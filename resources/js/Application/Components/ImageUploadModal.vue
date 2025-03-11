<template>
    <div v-if="isOpen" class="modal">
      <form @submit.prevent="uploadImage">
        <div class="modal-content">
          <h3>Bild hochladen</h3>

          <!-- Datei-Dropzone -->
          <div class="dropzone" @dragover.prevent @drop.prevent="handleDrop" @click="triggerFileInput">
            <input
              ref="fileInput"
              type="file"
              accept="image/*"
              class="hidden"
              @change="handleFileChange"
            />
            <p>Ziehe das Bild hierher oder klicke, um eine Datei auszuwählen.</p>
          </div>

          <!-- Bildvorschau -->
          <div v-if="previewImage" class="preview-container" align="center">
            <img :src="previewImage" alt="Bildvorschau" class="preview" />
          </div>

          <!-- Fortschrittsanzeige -->
          <progress v-if="uploading" :value="progress" max="100"></progress>
          <p v-if="uploading">{{ progress }}%</p>

          <!-- Buttons -->
          <button @click="closeModal">Abbrechen</button>
          <button type="submit" v-if="selectedImage">Hochladen</button>
        </div>
      </form>
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
              console.log(response);
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
