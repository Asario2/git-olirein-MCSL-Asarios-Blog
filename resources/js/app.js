import "./bootstrap";
import "../css/app.css";

import { createApp, h } from "vue";
import { createInertiaApp } from "@inertiajs/vue3";
import { resolvePageComponent } from "laravel-vite-plugin/inertia-helpers";
import { ZiggyVue } from "../../vendor/tightenco/ziggy";
import { i18nVue } from "laravel-vue-i18n";
import { route } from "ziggy-js";

// Schriftarten
import "@fontsource/open-sans/index.css";
import "@fontsource/ubuntu/index.css";

// Rechte-Logik
import { loadAllRights, hasRight, isRightsReady } from "@/utils/rights";

// Tooltip Plugin
import { TippyPlugin } from "tippy.vue";

// FontAwesome
import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome";
import { library } from "@fortawesome/fontawesome-svg-core";
import { faPencilAlt, faTrashCan } from "@fortawesome/free-solid-svg-icons";
library.add(faPencilAlt, faTrashCan);

const appName = import.meta.env.VITE_APP_NAME || "Starter Eleven";

createInertiaApp({
  title: (title) => `${title} - ${appName}`,
  resolve: (name) =>
    resolvePageComponent(
      `./Application/${name}.vue`,
      import.meta.glob("./Application/**/*.vue"),
    ),
  setup({ el, App, props, plugin }) {
    // Vue App vorbereiten
    const app = createApp({ render: () => h(App, props) });

    // Rechte laden, dann App mounten
    loadAllRights().then(() => {
      // Globale Methoden registrieren
      app.config.globalProperties.$hasRight = hasRight;
      app.config.globalProperties.$isRightsReady = isRightsReady;

      // Plugins
      app
        .use(plugin)
        .use(ZiggyVue)
        .use(i18nVue, {
          resolve: async (lang) => {
            const langs = import.meta.glob("../../lang/*.json");
            return await langs[`../../lang/${lang}.json`]();
          },
        })
        .use(TippyPlugin, {
          tippyDefaults: {},
        });

      // Globale Komponenten
      app.component("font-awesome-icon", FontAwesomeIcon);

      // App mounten
      app.mount(el);
    });
  },
  progress: {
    color: "#0EA5E9",
  },
});
