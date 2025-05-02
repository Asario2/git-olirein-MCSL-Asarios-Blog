<template>
    <meta-header :title="headerTitle">
      <template #robots>
        <meta head-key="robots" name="robots" content="noindex, nofollow" v-if="noIndexNoFollow" />
        <meta head-key="robots" name="robots" content="index, follow" v-else />
      </template>

      <template #description>
        <meta head-key="description" name="description" :content="headerDescription" />
        <link rel="canonical" v-if="headerUrl" :href="headerUrl" />
      </template>

      <template #opengraph>
        <meta head-key="og:title" property="og:title" :content="headerTitle" />
        <meta property="og:description" head-key="og:description" :content="headerDescription" />
        <meta v-if="headerUrl" head-key="og:url" property="og:url" :content="headerUrl" />
        <meta v-if="headerImage" head-key="og:image" property="og:image" :content="headerImage" />
        <meta head-key="og:type" property="og:type" content="website" />
      </template>
    </meta-header>

    <main :class="mode" id="app-layout-start">
      <section class="relative bg-layout-sun-50 text-layout-sun-900 dark:bg-layout-night-50 dark:text-layout-night-900 transition-colors duration-1000"  style='z-index:50;'>
        <!-- Header -->
        <nav class="fixed top-0 left-0 right-0 z-30 bg-layout-sun-50 text-layout-sun-900 dark:bg-layout-night-50 dark:text-layout-night-900 border-b border-layout-sun-200 dark:border-layout-night-200"  style='z-index:50;'>
          <div class="container mx-auto max-w-6xl p-6 lg:flex lg:items-center lg:justify-between" style='z-index:50;'>
            <div class="flex items-center justify-between">
              <brand-header :route-name="route('home.index')" :brand_1="$page.props.applications.brand_name_1" :brand_2="$page.props.applications.brand_name_2" :app-name="$page.props.applications.app_name"></brand-header>

              <!-- Mobile menu button -->
              <div class="flex lg:hidden">
                <button v-on:click="toggleNavbar()" type="button" class="focus:outline-none text-primary-sun-1000 hover:text-primary-sun-800 focus:text-primary-sun-800 dark:text-primary-night-1000 dark:hover:text-primary-night-800 dark:focus:text-primary-night-800" aria-label="toggle menu">
                  <icon-menu class="w-6 h-6" v-if="!isOpen_Menu"></icon-menu>
                  <icon-close class="w-6 h-6" v-if="isOpen_Menu"></icon-close>
                </button>
              </div>
            </div>

            <!-- Mobile Menu open: "block", Menu closed: "hidden" -->
            <div :class="[isOpen_Menu ? 'translate-x-0 opacity-100 ' : 'opacity-0 -translate-x-full']" style='z-index:10000000;' class="absolute inset-x-0 mt-6 w-full px-6 py-4 shadow-md transition-all duration-300 ease-in-out bg-primary-sun-200 dark:bg-primary-night-200 lg:relative lg:top-0 lg:mt-0 lg:flex lg:w-auto lg:translate-x-0 lg:items-center lg:bg-transparent lg:p-0 lg:opacity-100 lg:shadow-none lg:dark:bg-transparent">
              <div class="flex flex-col items-center space-y-4 lg:mt-0 lg:flex-row lg:space-y-0 lg:space-x-8" style='z-index:10000000;'>
                <link-header :route-name="route('home.index')" name="Home"></link-header>
                <link-header :route-name="route('home.images.index')" name="Bilder"></link-header>
                <link-header :route-name="route('home.pricing')" name="Preise"></link-header>
                <link-header :route-name="route('home.blog.index')" name="Blog"></link-header>

                <template v-if="!$page.props.userdata.user_id">
                  <link-header :route-name="route('login')" name="Login"></link-header>
                  <link-header :route-name="route('register')" name="Registrieren"></link-header>
                </template>

                <template v-if="$page.props.userdata.user_id">
                  <link-header :route-name="route('applicationswitch')" name="Dashboard"></link-header>
                </template>

                <button-change-mode :mode="mode" @changeMode="changeMode"></button-change-mode>
              </div>
            </div>
          </div>
        </nav>

        <!-- Loading -->
        <div v-if="isLoading" id="loader" class="fixed inset-0 flex items-center justify-center bg-black bg-opacity-50 backdrop-blur-sm transition-all" style='z-index:999999999'>
        <div class="text-center">
            <svg class="animate-spin h-10 w-10 text-primary-sun-500" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
            <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
            <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8v8H4z"></path>
            </svg>
            <p class="mt-4 text-primary-sun-100 text-sm">Bitte warten...</p>
        </div>
        </div>

        <!-- Content -->
        <div class="container mx-auto max-w-6xl min-h-screen py-32 px-2">
          <!-- Toast -->
          <div>
            <toast></toast>
          </div>

          <!-- Slot für Content -->
          <div class="mt-4">
            <slot></slot>
          </div>
        </div>
      </section>

      <!-- Footer -->
      <footer class="bg-layout-sun-50 text-layout-sun-900 dark:bg-layout-night-50 dark:text-layout-night-900 border-t border-layout-sun-200 dark:border-layout-night-200" aria-labelledby="footer-heading">
        <div class="container mx-auto max-w-6xl">
          <h2 id="footer-heading" class="sr-only">Footer</h2>
          <div class="px-1 md:px-4 lg:px-8 pb-8 pt-8">
            <div class="mt-8 grid grid-cols-1 md:grid-cols-2 gap-4 xl:col-span-2 xl:mt-0">
              <div class="md:grid md:grid-cols-2 md:gap-4">
                <div class="text-center md:text-left">
                  <h3 class="text-sm font-semibold leading-6 px-2">
                    <span> Webseite </span>
                  </h3>
                  <ul role="list" class="mt-6 space-y-4">
                    <li>
                      <link-footer name="Get Started" :route-name="route('home.get_started')"></link-footer>
                    </li>
                    <li>
                      <link-footer name="Preise" :route-name="route('home.pricing')"></link-footer>
                    </li>
                    <li>
                      <link-footer name="Blog" :route-name="route('home.blog.index')"></link-footer>
                    </li>
                    <li>
                      <link-footer name="Impressum" :route-name="route('home.imprint')"></link-footer>
                    </li>
                    <li>
                      <link-footer name="Datenschutzerklärung" :route-name="route('home.privacy')"></link-footer>
                    </li>
                    <li>
                      <link-footer @click="reopenCookieBanner">Cookie-Einstellungen</link-footer>
                    </li>
                  </ul>
                </div>
                <div class="text-center md:text-left">
                  <h3 class="text-sm font-semibold leading-6 px-2">
                    <span> Authentifizierung </span>
                  </h3>
                  <ul role="list" class="mt-6 space-y-4">
                    <li>
                      <link-footer name="Login" :route-name="route('login')"></link-footer>
                    </li>
                    <li>
                      <link-footer name="Registrierung" :route-name="route('register')"></link-footer>
                    </li>
                  </ul>
                </div>
              </div>
            </div>

            <div class="pt-8 text-layout-sun-700 dark:text-layout-night-700">
              <div class="flex flex-col items-center justify-between text-xs leading-5 gap-4">
                <div class="w-full flex flex-col md:flex-row flex-1 items-center justify-between gap-4">
                  <div>
                    <brand-footer></brand-footer>
                  </div>
                  <div>
                    <link-footer>
                      <a href="https://www.facebook.com" target="_blank" class="bg-layout-sun-0 dark:bg-layout-night-0">
                        <icon-facebook class="flex-shrink-0 w-6 h-6"></icon-facebook>
                      </a>
                    </link-footer>
                    <link-footer>
                      <a href="https://www.linkedin.com" target="_blank" class="bg-layout-sun-0 dark:bg-layout-night-0">
                        <icon-linked-in class="flex-shrink-0 w-6 h-6"></icon-linked-in>
                      </a>
                    </link-footer>
                    <link-footer>
                      <a href="https://youtube" target="_blank" class="bg-layout-sun-0 dark:bg-layout-night-0">
                        <icon-youtube class="flex-shrink-0 w-6 h-6"></icon-youtube>
                      </a>
                    </link-footer>
                  </div>
                </div>

                <div class="w-full flex flex-col md:flex-row flex-1 items-center justify-between gap-4">
                  <div class="text-xs leading-6">
                    {{ year }} Starter Eleven/MCSL. Ein Template von Oliver Reinking / Asario.
                  </div>

                  <div class="text-xs leading-6">
                    <span> Version: </span>
                    {{ $page.props.version.versionnr }}
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </footer>
    </main>
  </template>
<script>
import axios from "axios";
import MetaHeader from "@/Application/Homepage/Shared/MetaHeader.vue";
import BrandHeader from "@/Application/Shared/BrandHeader.vue";
import LinkHeader from "@/Application/Shared/LinkHeader.vue";
import BrandFooter from "@/Application/Shared/BrandFooter.vue";
import LinkFooter from "@/Application/Shared/LinkFooter.vue";
import IconMenu from "@/Application/Components/Icons/Menu.vue"
import Toast from "@/Application/Components/Content/Toast.vue";
import ButtonChangeMode from "@/Application/Components/ButtonChangeMode.vue";
import { ref } from "vue";

export default {
  name: "Homepage_Shared_Layout",

  components: {
    MetaHeader,
    BrandHeader,
    LinkHeader,
    BrandFooter,
    LinkFooter,
    Toast,
    IconMenu,
    ButtonChangeMode
  },

  data() {
    return {
      mode: localStorage.theme ? localStorage.theme : "",
      isOpen_Menu: false,
      year: new Date().getFullYear(),
      pendingRequests: 0, // Wird bei jeder Anfrage erhöht
      isLoading: true, // Spinner anzeigen, wenn Ladeprozess läuft
      search: '',
      imagesLoaded: false,
    };
  },

  mounted() {
    // Debugging: Prüfen, ob die Seite zum ersten Mal geladen wird


    // Den 'search' Parameter prüfen
    const urlParams = new URLSearchParams(window.location.search);
    const searchParam = urlParams.get('search'); // Holt den 'search' Parameter

    // Wenn der 'search' Parameter leer oder nicht gesetzt ist, zeige den Loader
    if (searchParam === '' || searchParam === null) {
      this.setLoadingState(true); // Setze Loading auf true, wenn 'search' leer oder nicht vorhanden ist
      this.searchval = true;
    } else {
      this.setLoadingState(false); // Verstecke den Loader, wenn 'search' gesetzt ist
      this.searchval = false;
    }

    // Axios Interceptoren
    axios.interceptors.request.use((config) => {
    //   console.log('Request sent, pendingRequests:', this.pendingRequests);
      this.pendingRequests += 1;
      this.setLoadingState(this.searchval);
      return config;
    });

    axios.interceptors.response.use(
      (response) => {
        this.pendingRequests -= 1;
        // console.log('Response received, pendingRequests:', this.pendingRequests);
        this.checkLoadingState();
        return response;
      },
      (error) => {
        this.pendingRequests -= 1;
        console.log('Error response received, pendingRequests:', this.pendingRequests);
        this.checkLoadingState();
        return Promise.reject(error);
      }
    );

    // Bilder laden überwachen
    this.waitForImagesToLoad();
  },

  methods: {
    setLoadingState(state) {
    //   console.log('Setting loading state to:', state);
      this.isLoading = state;
    },

    checkLoadingState() {
      // Überprüft den Status und blendet den Loader aus, wenn alle Bilder geladen sind und keine ausstehenden Anfragen mehr vorhanden sind
      if (this.pendingRequests === 0 && this.imagesLoaded) {
        //console.log('All requests completed and images loaded, hiding loader');
        this.setLoadingState(false);
      }
    },

    waitForImagesToLoad() {
      const images = document.querySelectorAll('img');
      const totalImages = images.length;
      let imagesLoadedCount = 0;

      if (totalImages === 0) {
        //console.log('No images found');
        this.imagesLoaded = true; // Keine Bilder, also direkt auf true setzen
        this.checkLoadingState();  // Prüfe den Lade-Status erneut
        return;
      }

      images.forEach((img, index) => {
        if (img.complete) {
          imagesLoadedCount++;
          console.log(`Image ${index + 1} already loaded`);
        } else {
          img.addEventListener('load', () => {
            imagesLoadedCount++;
            //console.log(`Image ${index + 1} loaded`);
            if (imagesLoadedCount === totalImages) {
              //console.log('All images loaded');
              this.imagesLoaded = true;
              this.checkLoadingState();  // Prüfe den Lade-Status erneut
            }
          });
        }
      });

      if (imagesLoadedCount === totalImages) {
       // console.log('All images were already loaded');
        this.imagesLoaded = true;
        this.checkLoadingState();  // Prüfe den Lade-Status erneut
      }
    },

    toggleNavbar() {
      this.isOpen_Menu = !this.isOpen_Menu;
    },

    // Ändert den Modus (Light/Dark)
    changeMode() {
      this.mode = this.mode === "dark" ? "light" : "dark";
      localStorage.theme = this.mode;
    }
  }
};
</script>

<style scoped>
/* Deine Styles hier */
</style>
