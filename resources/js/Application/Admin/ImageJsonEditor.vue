<template>
    <div
      class="bg-white dark:bg-gray-900 p-4 rounded mx-auto shadow-md w-full max-w-4xl overflow-y-auto"
      :style="`max-height: ${windowHeight - 160}px`"
    >
      <h3 class="text-xl font-semibold mb-4 text-gray-800 dark:text-gray-100">
        🖼️ Galerie bearbeiten
      </h3>
      <div v-if="images.length !== 0">
        <div
          v-for="(element, index) in images"
          :key="element.filename"
          class="flex items-center gap-4 border-b border-gray-200 dark:border-gray-700 py-3"
        >
          <span class="text-sm text-gray-500 dark:text-gray-400">
            #{{ element.position }}
          </span>
          <span class="min-w-[100px]" align="right">
            <img
              :src="`${folder}/thumbs/${element.filename}`"
              alt=""
              class="max-w-[100px] max-h-[75px] rounded shadow"
            />
          </span>
          <input
            type="text"
            placeholder=""
            class="txt w-full p-2.5 text-sm rounded-lg block border focus:ring-3 focus:ring-opacity-75
                   bg-layout-sun-0 text-layout-sun-900 border-primary-sun-500
                   focus:border-primary-sun-500 focus:ring-primary-sun-500
                   placeholder:text-layout-sun-400 selection:bg-layout-sun-200 selection:text-layout-sun-1000
                   dark:bg-layout-night-0 dark:text-layout-night-900 dark:border-primary-night-500
                   dark:focus:border-primary-night-500 dark:focus:ring-primary-night-500
                   placeholder:dark:text-layout-night-400 dark:selection:bg-layout-night-200
                   dark:selection:text-layout-night-1000"
            v-model="element.label"
          />
          <form @submit.prevent="deletePost(index)" style="display:inline">
            <button @click.stop type="submit" onclick="return confirm('Sind Sie sicher, dass Sie diesen Blogbeitrag löschen möchten?');">&nbsp;<IconTrash style="margin-top:-27px;" class="sm-pencil cursor-pointer"></IconTrash></button>
        </form>
        </div>

      </div>

      <div class="mt-6 flex justify-between">
        <button
          type="button"
          @click="$emit('close')"
          class="px-4 py-2 bg-red-500 text-white rounded-lg hover:bg-red-600"
        >
          Schliessen
        </button>

        <button
          @click="saveJson"
          class="bg-blue-600 hover:bg-blue-700 text-white px-5 py-2 rounded shadow-md transition"
        >
          💾 Speichern
        </button>
      </div>
    </div>
  </template>

  <script>
  import axios from 'axios';
  import IconTrash from "@/Application/Components/Icons/Trash.vue";
  import { toastBus } from '@/utils/toastBus';

  import emitter from '@/eventBus';

  export default {
    name: 'ImageJsonEditor',
    components: {
        IconTrash,
        toastBus,
    },
    props: {
      folder: {
        type: String,
        required: true,
        default: ''
      },
      column:{
        type:String,
        required:true,
        default:'',
      }
    },
    data() {
      return {
        images: [],
        windowHeight: window.innerHeight
      };
    },
    methods: {
        refreshGallery() {
            emitter.emit('refresh-preview');
        },
        hasRight() {
      return this.$hasRight; // Zugriff auf globale Methode
    },
        async deletePost(id) {
        try {
            if(!this.hasRight("delete","images"))
            {
                 alert("Sie haben nicht die benötigten Rechet zum löschen des Bildes");
                 return "";
            }
            // console.log(`aad: admin/tables/delete/${this.table}/${this.id}`);
            // DELETE-Anfrage mit Parametern in der URL
            const parts = this.folder.replace(/\/+$/, '').split('/');
            const last = parts[parts.length - 1];
            const folder_alt = last;

            const response = await axios.post(`/api/del_image/${this.column}/${folder_alt}/${id}`, {
                params: {
                    edit: "blogposts.index",
                }
            });
            // console.log(response.data);
            toastBus.emit('toast', response.data); // ← erwartet { status: "...", message: "..." }
            this.$inertia.reload();
            this.refreshGallery();
            // this.$emit('refresh-preview');
            emitter.emit('refresh-preview');
            console.log('refresh-preview emitted');
            // Optional: Seite neu laden oder Liste aktualisieren
        } catch (error) {
            console.error("Fehler beim Löschen:", error);
        }
    },
      decodeHTMLEntities(str) {
        const textarea = document.createElement('textarea');
        textarea.innerHTML = str;
        return textarea.value;
      },
      async fetchImages() {
        try {
          const response = await axios.get(`${this.folder}/index.json`);
          if (this.validJson(response.data)) {
            this.images = response.data;
            // this.refreshGallery();
          }
        } catch (err) {
          console.error('Fehler beim Laden der JSON:', err);
          alert('Fehler beim Laden der Bilder');
        }
      },
      validJson(data) {
        try {
          JSON.stringify(data);
          return typeof data === 'object' && data !== null;
        } catch (e) {
          return false;
        }
      },
      async saveJson() {
        try {
          await axios.post('/api/save-json', {
            folder: this.folder,
            images: this.images
          });
          this.fetchImages();
        } catch (err) {
          console.error(err);
          alert('❌ Fehler beim Speichern');
        }
      },
      updateWindowHeight() {
        this.windowHeight = window.innerHeight;
      },

      // Diese Methode kann vom Parent oder anderen Komponenten über $refs aufgerufen werden
      refreshGallery() {
        this.fetchImages();
      }
    },
    mounted() {
      this.fetchImages();
      this.updateWindowHeight();
      window.addEventListener('resize', this.updateWindowHeight);
      this.refreshGallery();
    //   emitter.on('refresh-preview', this.getPreviewImagez);
    },
    beforeUnmount() {
      window.removeEventListener('resize', this.updateWindowHeight);
      this.refreshGallery();
    }
  };
  </script>

  <style scoped>
  /* keine body.modal-open mehr nötig */
  </style>
