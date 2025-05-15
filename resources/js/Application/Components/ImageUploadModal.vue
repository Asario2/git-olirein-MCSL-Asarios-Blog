<template>
    <div
      v-show="isModalOpen"
      class="fixed inset-0 z-1000 flex items-center justify-center bg-black bg-opacity-50"
    >
      <div class="bg-layout-sun-100 dark:bg-layout-night-100 rounded-lg shadow-lg w-full max-w-lg p-6">
        <form @submit.prevent="uploadImage">
          <h3 class="text-2xl font-semibold text-center mb-4">Bild hochladen</h3>
          <CopyLeftSelect
                v-if="isImages && !Message"
                v-model="form.copyleft"
                label="Wasserzeichen"
                name="copyleft"
              />
          <!-- Datei-Dropzone -->
          <div
            class="border-2 border-dashed border-layout-sun-500 dark:border-layout-night-500 rounded-lg p-6 text-center cursor-pointer hover:bg-layout-sun-200 dark:hover:bg-layout-night-200"
            @dragover.prevent
            @drop.prevent="handleDrop"
            @click="triggerFileInput"
          >
            <input
              ref="fileInput"
              type="file"
              accept="image/*"
              class="hidden"
              @change="handleFileChange"
            />
            <p class="text-layout-sun-700 dark:text-layout-night-700">

              Ziehe das Bild hierher oder klicke, um eine Datei auszuwählen.
            </p>
          </div>

          <!-- Bildvorschau -->
          <div v-if="previewImage" class="mt-4 text-center">
            <img :src="previewImage" alt="Bildvorschau" class="w-full h-auto rounded-lg shadow-md" />
          </div>

          <!-- Fortschrittsanzeige -->
          <div v-if="uploading" class="mt-4">
            <progress :value="progress" max="100" class="w-full"></progress>
            <p class="text-center mt-2">{{ progress }}%</p>
          </div>

          <!-- Buttons -->
          <div class="mt-6 flex justify-between">
            <button
              type="button"
              @click="closeModal"
              class="px-4 py-2 bg-red-500 text-white rounded-lg hover:bg-red-600"
            >
              Abbrechen
            </button>
            <button
              type="submit"
              v-if="selectedImage"
              class="px-4 py-2 bg-blue-500 text-white rounded-lg hover:bg-blue-600"
            >
              Hochladen
            </button>
          </div>
        </form>
      </div>
    </div>
  </template>

  <script>
  import { CleanTable as cleanTableFn, GetAuth } from '@/helpers';
  import md5 from 'md5';
  import CopyLeftSelect from "@/Application/Components/Content/CopyLeftSelect.vue";

  export default {
    name: 'ImageUploadModal',
    components: {
      CopyLeftSelect,
    },
    props: {
      isOpen: [Boolean, Number],
      path: String,
      namee: String,
      column: String,
      namee2: String,
      altpath: String,
      Message: {
        type: [Boolean, Number],
        default: false,
      },
      isModalOpen: {
    type: [Boolean, Number],
    default: false
  },
},
    computed: {
  isImages() {
    return cleanTableFn() === 'images';
  },
},

    data() {
      return {
        selectedImage: null,
        previewImage: null,
        uploading: false,
        progress: 0,
        newFname: '',
        tablex: this.altpath ? this.altpath : this.CleanTable(),
        form: {
          copyleft: ''
        },
        options: {
      type: Array,
      default: () => []
    },
      };
    },
    async mounted() {
         //this.fetchDataX();
         this.GetAuth = await GetAuth();
    },
    methods: {
        GetAuth,
        insertImage(imageUrl) {
    const editor = this.$refs.editor; // Hier ist der Referenz-Editor
    const selection = window.getSelection();
    const range = selection.getRangeAt(0); // Hole den aktuellen Bereich

    // Erstelle ein neues <img>-Tag mit der URL
    const img = document.createElement('img');
    img.src = imageUrl;
    img.alt = 'Image';  // Optional: Füge einen Alt-Text hinzu
    img.style.maxWidth = '100%';  // Optional: Maximalbreite definieren
    img.style.display = 'block';  // Optional: Bild als Block-Element darstellen

    // Füge das Bild an der aktuellen Cursor-Position ein
    range.deleteContents();  // Lösche die aktuelle Auswahl (falls vorhanden)
    range.insertNode(img);  // Füge das Bild ein

    // Setze den Cursor direkt nach dem Bild
    range.setStartAfter(img);
    range.setEndAfter(img);
    selection.removeAllRanges();
    selection.addRange(range);
  },
      CleanTable() {
        return cleanTableFn();
      },
      triggerFileInput() {
        this.$refs.fileInput.click();
      },
      handleDrop(event) {
        const files = event.dataTransfer.files;
        if (files.length > 0) {
          this.handleFileChange({ target: { files } });
        }
      },
      handleFileChange(event) {
        const file = event.target.files[0];
        if (file) {
          this.selectedImage = file;
          this.newFname = file.name;
          this.previewImage = URL.createObjectURL(file);
          if (this.Message) {
            const extension = file.name.split('.').pop();
            const newfg = (file.name + "_" + this.GetAuth()) + '.' + extension;
            this.$emit('insertImage', newfg);
            }
        }
      },
      async uploadImage() {
  if (!this.selectedImage) return;

  this.uploading = true;
  this.progress = 0;

  // FormData für den Upload erstellen
  const formData = new FormData();
  formData.append('image', this.selectedImage);
  formData.append('path', this.path);
  formData.append('namee', this.name);
  formData.append('_token', document.querySelector('meta[name="csrf-token"]').getAttribute('content'));
  formData.append('table', this.tablex);
  formData.append('copyleft', this.form.copyleft);
  formData.append("Message",this.Message);


  // Überprüfung und Fehlerbehandlung im Upload-Prozess
  const xhr = new XMLHttpRequest();
  xhr.upload.addEventListener('progress', (event) => {
    if (event.lengthComputable) {
      this.progress = Math.round((event.loaded / event.total) * 100);
    }
  });

  xhr.onload = () => {
    this.uploading = false;
    if (xhr.status === 200) {
      const response = JSON.parse(xhr.responseText);
      this.newFname = response.image_url;
    if (this.Message) {
      this.$emit('insertImage', response.image_url);
    } else {
      this.$emit('imageUploaded', response.image_url);
    }

    //   console.log("ri:" + response.image_url);
      this.closeModal();
    } else {
      console.error("Fehler beim Upload:", xhr.status);
    }
  };

  xhr.onerror = () => {
    this.uploading = false;
    console.error("Fehler beim Hochladen",xhr.status);
  };
  let isw = "0";
  if(this.CleanTable() === "images" && !this.Message)
  {
     isw = "1";
     const ASD = "SD";
  }
//   console.log("sel: " + JSON.stringify(this.selectedImage,null,2));
  xhr.open('POST', '/upload-image/' + this.tablex + "/" + isw, true);
  xhr.send(formData);
},
      closeModal() {
        this.selectedImage = null;
        this.previewImage = null;
        this.uploading = false;
        this.progress = 0;
        this.$emit('close');
      },
    },
    watch: {
        isModalOpen(newVal) {
    if (newVal) {
      // Modals öffnen, alles zurücksetzen
      this.selectedImage = null;
      this.previewImage = null;
      this.uploading = false;
      this.progress = 0;
    }
  },
    },
  };
  </script>

  <style scoped>
  .modal {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.5);
    display: flex;
    justify-content: center;
    align-items: center;
  }

  .modal-content {
    background: white;
    padding: 20px;
    border-radius: 5px;
    text-align: center;
  }

  .dropzone {
    border: 2px dashed #ccc;
    padding: 20px;
    cursor: pointer;
  }

  .preview-container {
    margin-top: 10px;
  }

  .preview {
    max-width: 300px;
    width: auto;
    height: auto;
  }

  /* .w-full{
    min-width:320px;
    max-width:400px;
  } */
  </style>
