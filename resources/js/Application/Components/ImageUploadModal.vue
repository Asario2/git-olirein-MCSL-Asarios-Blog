<template>
    <div v-if="isOpen" class="fixed inset-0 z-50 flex items-center justify-center bg-black bg-opacity-50">
      <div class="bg-layout-sun-100 dark:bg-layout-night-100 rounded-lg shadow-lg w-full max-w-lg p-6">
        <form @submit.prevent="uploadImage">
          <h3 class="text-2xl font-semibold text-center mb-4">Bild hochladen</h3>

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
            <button @click="closeModal" class="px-4 py-2 bg-red-500 text-white rounded-lg hover:bg-red-600">
              Abbrechen
            </button>
            <button type="submit" v-if="selectedImage" class="px-4 py-2 bg-blue-500 text-white rounded-lg hover:bg-blue-600">
              Hochladen
            </button>
          </div>
        </form>
      </div>
    </div>
  </template>


  <script>
  export default {
    props: {
      isOpen: Boolean,
      path: String,
      namee: String,
      column: String,
    },
    data() {
      return {
        selectedImage: null,
        tablex: '',
        previewImage: null,
        uploading: false,
        progress: 0,
        newFname: '',
      };
    },
    methods: {
        triggerFileInput() {
      this.$refs.fileInput.click(); // Klick auf das unsichtbare Datei-Input auslösen
    },
    handleFileChange(event) {
      const file = event.target.files[0];
      if (file) {
       // console.log("Ausgewähltes Bild:", file.name);
        // Weitere Logik für die Bildvorschau oder den Upload hier hinzufügen
      }
    },
        handleDrop(event) {
  event.preventDefault(); // Standardverhalten verhindern

  const files = event.dataTransfer.files;
  if (files.length > 0) {
    this.handleFileChange({ target: { files } });
  }
},
      triggerFileInput() {
        this.$refs.fileInput.click();
      },
      handleFileChange(event) {
        const file = event.target.files[0];
        if (file) {
          this.selectedImage = file;
          this.newFname = file.name;

          const fileURL = URL.createObjectURL(file);
          this.previewImage = fileURL;

        //   this.$emit('imageUploaded', fileURL, this.newFname);
        }
      },
      async uploadImage() {
        if (!this.selectedImage) return;
        this.uploading = true;
        this.progress = 0;

        // Dynamische Tabellen- und ID-Extraktion aus der URL
        const path = window.location.pathname;
        const segments = path.split("/");
        this.tablex = segments[segments.length - 1];

        // FormData für den Upload
        const formData = new FormData();
        formData.append("image", this.selectedImage);
        formData.append("path", this.path);
        formData.append("namee", this.namee);
        formData.append("_token", document.querySelector('meta[name="csrf-token"]').getAttribute('content'));
        formData.append("table", this.tablex);

        const xhr = new XMLHttpRequest();

        // Fortschrittsanzeige aktualisieren
        xhr.upload.addEventListener("progress", (event) => {
          if (event.lengthComputable) {
            this.progress = Math.round((event.loaded / event.total) * 100);
          }
        });

        // console.log("Upload für Tabelle: " + this.tablex);
        xhr.open("POST", "/upload-image/" + this.tablex, true);

        xhr.onload = () => {
          if (xhr.status === 200) {
            // console.log("Server-Antwort:", xhr.responseText);
            try {
              let response = JSON.parse(xhr.responseText);

              this.newFname = response.image_url;
            //   console.log(response);
              this.$emit('imageUploaded', response.image_url, this.newFname);

              // Status zurücksetzen & Modal schließen
              this.uploading = false;
              this.progress = 0;
              this.$emit("close");

            } catch (e) {
              console.error("Fehler beim Parsen der JSON-Antwort:", e);
              console.error("Antwort des Servers:", xhr.responseText);
            }
          } else {
            console.error("Fehler beim Upload, Status:", xhr.status);
            console.error("Antwort des Servers:", xhr.responseText);
          }
        };

        xhr.onerror = () => {
          console.error("Fehler beim Hochladen");
          this.uploading = false;
        };

        xhr.send(formData);
      },
      closeModal() {
        this.$emit("close");
      },
    }
  };
  </script>

  <style>
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
  </style>
