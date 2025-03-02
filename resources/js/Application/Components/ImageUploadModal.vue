<template>
    <div v-if="isOpen" class="modal">
      <div class="modal-content">
        <h3>Bild hochladen</h3>
        <div class="dropzone" @dragover.prevent @drop.prevent="handleDrop" @click="triggerFileInput">
          <input
            name="image"
            :path="path"
            ref="fileInput"
            type="file"
            :namee="namee"
            accept="image/*"
            @change="handleFileChange"
            class="hidden"
          />
          <p>Ziehe das Bild hierher oder klicke, um eine Datei auszuwählen.</p>
        </div>
        <div v-if="previewImage" class="preview-container">
          <img :src="previewImage" alt="Bildvorschau" class="preview" />
        </div>
        <div v-if="uploading">
          <p>Upload läuft...</p>
          <progress :value="progress" max="100"></progress>
        </div>

        <button @click="closeModal">Abbrechen</button>
        <button v-if="selectedImage" @click="uploadImage">Hochladen</button>
      </div>
    </div>
  </template>

  <script>
  export default {
    props: {
      isOpen: Boolean,
      tablex: String,
      column: String,
      path: String,
      iid: {
        type: [Number,String],
        default: 1, // Standard-ID = 1
      },
      image_url: {
        type: String,
        default: "008.jpg",
      },
    },
    data() {
      return {
        selectedImage: null,
        uploading: false,
        progress: 0,
        image_url: "",
        iid:1,
        imageUrl: null,
        tablex: this.path,
        lastInsertedId: null, // Speichert die vom Server erhaltene $iid
        previewImage: null,
        preview_image: {},
      };
    },
    created() {
    //   this.fetchPreviewImage();
    },
    watch: {
      iid(newId) {
        // this.fetchPreviewImage(newId);
      },
    },
    methods: {
      triggerFileInput() {
        this.$refs.fileInput.click();
      },

      handleFileChange(event) {
        const file = event.target.files[0];
        if (file) {
          this.selectedImage = file;

          // Vorschau generieren
          const reader = new FileReader();
          reader.onload = (e) => {
            this.previewImage = e.target.result;
          };
          reader.readAsDataURL(file);
        }
      },

      handleDrop(event) {
        const file = event.dataTransfer.files[0];
        if (file) {
          this.selectedImage = file;

          // Vorschau generieren
          const reader = new FileReader();
          reader.onload = (e) => {
            this.previewImage = e.target.result;
          };
          reader.readAsDataURL(file);
        }
      },

      // ** Vorschaubild von API holen und für die aktuelle `iid` aktualisieren **
            async uploadImage() {
        if (!this.selectedImage) return;

        this.uploading = true;
        this.progress = 0;

        let formData = new FormData();
        formData.append("image", this.selectedImage);
        formData.append("table", this.path);
        formData.append("column", this.column);
        formData.append("path", this.path);
        formData.append("name", this.namee);
        formData.append("_token", document.getElementById("token").value);

        try {
          let xhr = new XMLHttpRequest();
          xhr.open("POST", "/upload-image", true);

          // CSRF-Token setzen
          xhr.setRequestHeader("X-CSRF-TOKEN", document.getElementById("token").value);

          // Fortschrittsanzeige überwachen
          xhr.upload.onprogress = (event) => {
            if (event.lengthComputable) {
              this.progress = Math.round((event.loaded / event.total) * 100);
            }
          };

          xhr.onload = () => {
            if (xhr.status === 200) {
              const response = JSON.parse(xhr.responseText);
              console.log("Upload erfolgreich:", response);

              // Vorschau nach Upload neu laden
            //   this.fetchPreviewImage();

              // Server-Antwort auslesen (iid übernehmen)
              this.lastInsertedId = response.iid;
              this.image_url = response.image_url;
              console.log("IIIIID:" + this.lastInsertedId);
                this.iid = this.lastInsertedId;
                if (response.image_url) {
                // 🔥 `image_url` an die Elternkomponente senden
                this.$emit("imageUploaded", [response.iid, response.image_url]);
                }
              // Modal schließen
              this.$emit("close");
            } else {
              console.error("Upload fehlgeschlagen:", xhr.responseText);
              alert("Fehler beim Hochladen!");
            }

            // Zurücksetzen
            this.uploading = false;
            this.selectedImage = null;
            this.previewImage = null;
            this.progress = 0;
          };

          xhr.onerror = () => {
            console.error("Fehler beim Upload");
            alert("Fehler beim Hochladen!");
            this.uploading = false;
          };

          xhr.send(formData);
        } catch (error) {
          console.error("Upload fehlgeschlagen:", error);
          alert("Fehler beim Hochladen!");
          this.uploading = false;
        }
      },

      closeModal() {
        this.$emit("close");
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
    display: flex;
    justify-content: center;
    align-items: center;
    background-color: rgba(0, 0, 0, 0.5);
  }
  .modal-content {
    background-color: white;
    padding: 20px;
    border-radius: 8px;
    width: 400px;
  }
  .dropzone {
    border: 2px dashed #ccc;
    padding: 20px;
    text-align: center;
    cursor: pointer;
  }
  .hidden {
    display: none;
  }
  progress {
    width: 100%;
    height: 20px;
  }
  </style>
