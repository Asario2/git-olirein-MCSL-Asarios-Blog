<template>
        <div v-if="isLoading" id="loader" class="fixed inset-0 flex items-center justify-center bg-black bg-opacity-50 backdrop-blur-sm transition-all" style='z-index:999999999'>
        <div class="text-center">
            <svg class="animate-spin h-10 w-10 text-primary-sun-500" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
            <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
            <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8v8H4z"></path>
            </svg>
            <p class="mt-4 text-primary-sun-100 text-sm">Bitte warten...</p>
        </div>
        </div>
  </template>

  <script>
  export default {
    name: 'Loader',

    data() {
      return {
        isLoading: true,
        pendingRequests: 0,
        imagesLoaded: false,
      };
    },

    mounted() {
      this.monitorAxios();
      this.waitForImagesToLoad();
//       this.isLoading = true;
//   setTimeout(() => this.isLoading = false, 3000);

    },

    methods: {
      setLoading(state) {
        this.isLoading = state;
      },

      checkLoading() {
        if (this.pendingRequests <= 0 && this.imagesLoaded) {
          this.setLoading(false);
        }
      },

      monitorAxios() {
        axios.interceptors.request.use((config) => {
          this.pendingRequests++;
          this.setLoading(true);
          return config;
        });

        axios.interceptors.response.use(
          (response) => {
            this.pendingRequests--;
            this.checkLoading();
            return response;
          },
          (error) => {
            this.pendingRequests--;
            this.checkLoading();
            return Promise.reject(error);
          }
        );
      },

      waitForImagesToLoad() {
        const images = document.querySelectorAll('img');
        const totalImages = images.length;
        let loadedCount = 0;

        if (totalImages === 0) {
          this.imagesLoaded = true;
          this.checkLoading();
          return;
        }

        const onImageLoad = () => {
          loadedCount++;
          if (loadedCount === totalImages) {
            this.imagesLoaded = true;
            this.checkLoading();
          }
        };

        images.forEach((img) => {
          if (img.complete) {
            onImageLoad();
          } else {
            img.addEventListener('load', onImageLoad);
            img.addEventListener('error', onImageLoad);
          }
        });
      },
    }
  };
  </script>
