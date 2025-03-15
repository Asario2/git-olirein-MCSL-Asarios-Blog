<template>
    <meta-header :title="headerTitle">
        <template #robots>
            <meta
                head-key="robots"
                name="robots"
                content="noindex, nofollow"
                v-if="noIndexNoFollow"
            />
            <meta
                head-key="robots"
                name="robots"
                content="index, follow"
                v-else
            />
        </template>

        <template #description>
            <meta
                head-key="description"
                name="description"
                :content="headerDescription"
            />
            <link rel="canonical" v-if="headerUrl" :href="headerUrl" />
        </template>

        <template #opengraph>
            <meta
                head-key="og:title"
                property="og:title"
                :content="headerTitle"
            />
            <meta
                property="og:description"
                head-key="og:description"
                :content="headerDescription"
            />
            <meta
                v-if="headerUrl"
                head-key="og:url"
                property="og:url"
                :content="headerUrl"
            />
            <meta
                v-if="headerImage"
                head-key="og:image"
                property="og:image"
                :content="headerImage"
            />
            <meta head-key="og:type" property="og:type" content="website" />
        </template>
    </meta-header>

    <main :class="mode" id="app-layout-start">
        <section
            class="relative bg-layout-sun-50 text-layout-sun-900 dark:bg-layout-night-50 dark:text-layout-night-900 transition-colors duration-1000"
        >
            <!-- Header -->
            <nav
                class="fixed top-0 left-0 right-0 z-50 bg-layout-sun-50 text-layout-sun-900 dark:bg-layout-night-50 dark:text-layout-night-900 border-b border-layout-sun-200 dark:border-layout-night-200"
            >
                <div
                    class="container mx-auto max-w-6xl p-6 lg:flex lg:items-center lg:justify-between"
                >
                    <div class="flex items-center justify-between">
                        <brand-header
                            :route-name="route('home.index')"
                            :brand_1="$page.props.applications.brand_name_1"
                            :brand_2="$page.props.applications.brand_name_2"
                            :app-name="$page.props.applications.app_name"
                        ></brand-header>

                        <!-- Mobile menu button -->
                        <div class="flex lg:hidden">
                            <button
                                v-on:click="toggleNavbar()"
                                type="button"
                                class="focus:outline-none text-primary-sun-1000 hover:text-primary-sun-800 focus:text-primary-sun-800 dark:text-primary-night-1000 dark:hover:text-primary-night-800 dark:focus:text-primary-night-800"
                                aria-label="toggle menu"
                            >
                                <icon-menu
                                    class="w-6 h-6"
                                    v-if="!isOpen"
                                ></icon-menu>
                                <icon-close
                                    class="w-6 h-6"
                                    v-if="isOpen"
                                ></icon-close>
                            </button>
                        </div>
                    </div>

                    <!-- Mobile Menu open: "block", Menu closed: "hidden" -->
                    <div
                        :class="[
                            isOpen
                                ? 'translate-x-0 opacity-100 '
                                : 'opacity-0 -translate-x-full',
                        ]"
                        class="absolute inset-x-0 mt-6 w-full px-6 py-4 shadow-md transition-all duration-300 ease-in-out bg-primary-sun-200 dark:bg-primary-night-200 lg:relative lg:top-0 lg:mt-0 lg:flex lg:w-auto lg:translate-x-0 lg:items-center lg:bg-transparent lg:p-0 lg:opacity-100 lg:shadow-none lg:dark:bg-transparent"
                    >
                        <div
                            class="flex flex-col items-center space-y-4 lg:mt-0 lg:flex-row lg:space-y-0 lg:space-x-8"
                        >
                            <link-header
                                :route-name="route('home.index')"
                                name="Home"
                            ></link-header>

                            <link-header
                                :route-name="route('home.images.index')"
                                name="Bilder"
                            ></link-header>

                            <link-header
                                :route-name="route('home.pricing')"
                                name="Preise"
                            ></link-header>

                            <link-header
                                :route-name="route('home.blog.index')"
                                name="Blog"
                            ></link-header>

                            <template v-if="!$page.props.userdata.user_id">
                                <link-header
                                    :route-name="route('login')"
                                    name="Login"
                                ></link-header>
                                <link-header
                                    :route-name="route('register')"
                                    name="Registrieren"
                                ></link-header>
                            </template>

                            <template v-if="$page.props.userdata.user_id">
                                <link-header
                                    :route-name="route('applicationswitch')"
                                    name="Dashboard"
                                ></link-header>
                            </template>

                            <button-change-mode
                                :mode="mode"
                                @changeMode="changeMode"
                            ></button-change-mode>
                        </div>
                    </div>
                </div>
            </nav>

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
        <footer
            class="bg-layout-sun-50 text-layout-sun-900 dark:bg-layout-night-50 dark:text-layout-night-900 border-t border-layout-sun-200 dark:border-layout-night-200"
            aria-labelledby="footer-heading"
        >
            <div class="container mx-auto max-w-6xl">
                <h2 id="footer-heading" class="sr-only">Footer</h2>
                <div class="px-1 md:px-4 lg:px-8 pb-8 pt-8">
                    <div
                        class="mt-8 grid grid-cols-1 md:grid-cols-2 gap-4 xl:col-span-2 xl:mt-0"
                    >
                        <div class="md:grid md:grid-cols-2 md:gap-4">
                            <div class="text-center md:text-left">
                                <h3
                                    class="text-sm font-semibold leading-6 px-2"
                                >
                                    <span> Webseite </span>
                                </h3>
                                <ul role="list" class="mt-6 space-y-4">
                                    <li>
                                        <link-footer
                                            name="Get Started"
                                            :route-name="
                                                route('home.get_started')
                                            "
                                        ></link-footer>
                                    </li>
                                    <li>
                                        <link-footer
                                            name="Preise"
                                            :route-name="route('home.pricing')"
                                        ></link-footer>
                                    </li>
                                    <li>
                                        <link-footer
                                            name="Blog"
                                            :route-name="
                                                route('home.blog.index')
                                            "
                                        ></link-footer>
                                    </li>
                                    <li>
                                        <link-footer
                                            name="Impressum"
                                            :route-name="route('home.imprint')"
                                        ></link-footer>
                                    </li>
                                    <li>
                                        <link-footer
                                            name="Datenschutzerklärung"
                                            :route-name="route('home.privacy')"
                                        ></link-footer>
                                    </li>
                                    <li>
                                        <link-footer @click="reopenCookieBanner"
                                            >Cookie-Einstellungen</link-footer
                                        >
                                    </li>
                                </ul>
                            </div>
                            <div class="text-center md:text-left">
                                <h3
                                    class="text-sm font-semibold leading-6 px-2"
                                >
                                    <span> Authentifizierung </span>
                                </h3>
                                <ul role="list" class="mt-6 space-y-4">
                                    <li>
                                        <link-footer
                                            name="Login"
                                            :route-name="route('login')"
                                        ></link-footer>
                                    </li>
                                    <li>
                                        <link-footer
                                            name="Registrierung"
                                            :route-name="route('register')"
                                        ></link-footer>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <div
                        class="pt-8 text-layout-sun-700 dark:text-layout-night-700"
                    >
                        <div
                            class="flex flex-col items-center justify-between text-xs leading-5 gap-4"
                        >
                            <div
                                class="w-full flex flex-col md:flex-row flex-1 items-center justify-between gap-4"
                            >
                                <div>
                                    <brand-footer></brand-footer>
                                </div>
                                <div>
                                    <link-footer>
                                        <a
                                            href="https://www.facebook.com"
                                            target="_blank"
                                            class="bg-layout-sun-0 dark:bg-layout-night-0"
                                        >
                                            <icon-facebook
                                                class="flex-shrink-0 w-6 h-6"
                                            ></icon-facebook>
                                        </a>
                                    </link-footer>
                                    <link-footer>
                                        <a
                                            href="https://www.linkedin.com"
                                            target="_blank"
                                            class="bg-layout-sun-0 dark:bg-layout-night-0"
                                        >
                                            <icon-linked-in
                                                class="flex-shrink-0 w-6 h-6"
                                            ></icon-linked-in>
                                        </a>
                                    </link-footer>
                                    <link-footer>
                                        <a
                                            href="https://youtube"
                                            target="_blank"
                                            class="bg-layout-sun-0 dark:bg-layout-night-0"
                                        >
                                            <icon-youtube
                                                class="flex-shrink-0 w-6 h-6"
                                            ></icon-youtube>
                                        </a>
                                    </link-footer>
                                </div>
                            </div>

                            <div
                                class="w-full flex flex-col md:flex-row flex-1 items-center justify-between gap-4"
                            >
                                <div class="text-xs leading-6">
                                    {{ year }} Starter Eleven. Ein Template von
                                    Oliver Reinking.
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
import MetaHeader from "@/Application/Homepage/Shared/MetaHeader.vue";
import BrandHeader from "@/Application/Shared/BrandHeader.vue";
import LinkHeader from "@/Application/Shared/LinkHeader.vue";
import BrandFooter from "@/Application/Shared/BrandFooter.vue";
import LinkFooter from "@/Application/Shared/LinkFooter.vue";

import Toast from "@/Application/Components/Content/Toast.vue";

import ButtonChangeMode from "@/Application/Components/ButtonChangeMode.vue";

import IconMenu from "@/Application/Components/Icons/Menu.vue";
import IconClose from "@/Application/Components/Icons/Close.vue";
import IconFacebook from "@/Application/Components/Icons/SocialMedia/Facebook.vue";
import IconLinkedIn from "@/Application/Components/Icons/SocialMedia/LinkedIn.vue";
import IconYoutube from "@/Application/Components/Icons/SocialMedia/Youtube.vue";
import { ref, provide } from "vue";

const darkMode = ref(localStorage.getItem("darkMode") === "true");

provide("darkMode", darkMode); // 👈 Hier stellen wir `darkMode` bereit

function toggleDarkMode() {
  darkMode.value = !darkMode.value;
  localStorage.setItem("darkMode", darkMode.value);
  document.documentElement.classList.toggle("dark", darkMode.value);
}
export default {
    name: "Homepage_Shared_Layout",

    components: {
        MetaHeader,
        BrandHeader,
        LinkHeader,
        BrandFooter,
        LinkFooter,
        Toast,
        ButtonChangeMode,
        IconMenu,
        IconClose,
        IconFacebook,
        IconLinkedIn,
        IconYoutube,
    },

    props: {
        headerTitle: {
            type: String,
            default: "Starter Eleven",
        },
        headerDescription: {
            type: String,
            default: "Starter Eleven - Ein Template von Oliver Reinking.",
        },
        headerUrl: {
            type: String,
            default: null,
        },
        headerImage: {
            type: String,
            default: null,
        },
        noIndexNoFollow: {
            type: Boolean,
            default: false,
        },
    },

    data() {
        return {
            mode: localStorage.theme ? localStorage.theme : "",
            isOpen: false,
            year: new Date().getFullYear(),
        };
    },

    methods: {
        changeMode(value) {
            this.mode = value;
            this.isOpen = false;
            localStorage.theme = this.mode;
        },

        toggleNavbar() {
            this.isOpen = !this.isOpen;
        },

        reopenCookieBanner() {
            LaravelCookieConsent.reset();
            this.$inertia.visit(this.route("home.index"), {
                preserveState: false,
            });
        },
    },
};
</script>
