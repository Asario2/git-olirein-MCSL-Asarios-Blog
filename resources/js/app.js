import "./bootstrap";
import "../css/app.css";

import { createApp, h } from "vue";
import { createInertiaApp } from "@inertiajs/vue3";
import { resolvePageComponent } from "laravel-vite-plugin/inertia-helpers";
import { ZiggyVue } from "../../vendor/tightenco/ziggy";
import { i18nVue } from "laravel-vue-i18n";

function ucf(str) {
    // Teilt den String an den Unterstrichen
    const arr = str.split("_");

    // Wandelt jedes Element des Arrays um, falls es mehr als ein Wort gibt
    const na = arr.map(
        (val) => val.charAt(0).toUpperCase() + val.slice(1).toLowerCase(),
    );

    // Setzt die W�rter mit einem Leerzeichen zusammen
    return na.join(" ");
}

import "@fontsource/open-sans/index.css";
import "@fontsource/ubuntu/index.css";
import { Ziggy } from "./ziggy"; // Importiere Ziggy
// import Ziggy from './ziggy-routes.json' assert { type: 'json' };
import { route } from "ziggy-js";

console.log(route("admin.tables.create", { table: "blogs" }, undefined, Ziggy));
console.log(Ziggy);

import App from "./app.vue";

// use the plugin v-tippy (https://thecodewarrior.github.io/Tippy.vue/getting-started.html)
import { TippyPlugin } from "tippy.vue";

const appName = import.meta.env.VITE_APP_NAME || "Starter Eleven";

createInertiaApp({
    title: (title) => `${title} - ${appName}`,
    resolve: (name) =>
        resolvePageComponent(
            `./Application/${name}.vue`,
            import.meta.glob("./Application/**/*.vue"),
        ),
    setup({ el, App, props, plugin }) {
        return createApp({ render: () => h(App, props) })
            .use(i18nVue, {
                resolve: async (lang) => {
                    const langs = import.meta.glob("../../lang/*.json");
                    return await langs[`../../lang/${lang}.json`]();
                },
            })
            .use(plugin)
            .use(ZiggyVue)
            .use(TippyPlugin, {
                tippyDefaults: {}, // convenience to set tippy.js default props
            })
            .mount(el);
    },
    progress: {
        color: "#0EA5E9",
    },
});

// import { createApp } from 'vue';           // Importiere die `createApp`-Funktion von Vue
// import App from './components/App.vue';    // Importiere die Hauptkomponente `App.vue`
// import './assets/main.css';                // Optional: Importiere eine globale CSS-Datei

const app = createApp(App); // Erstelle die Vue-Anwendung mit `App.vue` als Einstiegskomponente
app.mount("#app");

import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome"; // Importiere die FontAwesomeIcon-Komponente
import { library } from "@fortawesome/fontawesome-svg-core";
import { faPencilAlt, faTrashCan } from "@fortawesome/free-solid-svg-icons"; // Importiere ben�tigte Icons

library.add(faPencilAlt, faTrashCan); // F�ge alle Icons zur Bibliothek hinzu

app.component("font-awesome-icon", FontAwesomeIcon); // Registriere die Komponente global

app.mount("#app");
