import "./bootstrap";
import '../css/app.css';
// import 'shariff';

import { createApp, h } from "vue";
import { createInertiaApp } from "@inertiajs/vue3";
import { resolvePageComponent } from "laravel-vite-plugin/inertia-helpers";
import { ZiggyVue } from "../../vendor/tightenco/ziggy";
import { i18nVue } from "laravel-vue-i18n";
import { route as ziggyRoute } from 'ziggy-js';
import { Inertia } from '@inertiajs/inertia';

// Wrapper
function safeRoute(...args) {
    try {
        return ziggyRoute(...args);
    } catch (error) {
        if (error.message.includes('is not in the route list')) {
            console.warn(`Ziggy: Route '${args[0]}' nicht gefunden. Leite auf 404 um.`);
            alert("404");
            Inertia.visit('/404');
            return '/404';
        }
        throw error;
    }
}

// Nur global setzen, nicht das Modul-Export überschreiben
window.route = safeRoute;

import { createPinia } from "pinia";  // <--- Pinia importieren

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

import { route } from "ziggy-js";

// // Ziggy mit globalem Error-Handler erweitern
// const originalRoute = route;
// window.route = (...args) => {
//     try {
//         return originalRoute(...args);
//     } catch (error) {
//         if (error.message.includes('is not in the route list')) {
//             alert("404");
//             Inertia.visit('/404')
//             return '/404'; // Fallback

//         }
//         throw error;
//     }
// };
// import route, { Ziggy } from "ziggy-js";
// import * as ZiggyModule from 'ziggy-js';

// const originalRoute = ZiggyModule.route;
// ZiggyModule.route = (...args) => {
//     const name = args[0];
//     if (!ZiggyModule.Ziggy.namedRoutes[name]) {
//         alert("404");
//         Inertia.visit('/404');
//         return '/404';
//     }
//     return originalRoute(...args);
// };
const appName = import.meta.env.VITE_APP_NAME || "Starter Eleven";
axios.defaults.headers.common['X-CSRF-TOKEN'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
// Rechte laden
loadAllRights()
  .then(() => {
    // Erstelle Inertia-App
    createInertiaApp({
      title: (title) => `${title} - ${appName}`,
      resolve: (name) =>
        resolvePageComponent(
          `./Application/${name}.vue`,
          import.meta.glob("./Application/**/*.vue")
        ),
      setup({ el, App, props, plugin }) {
        // App erstellen
        const app = createApp({ render: () => h(App, props) });

        // Pinia verwenden
        const pinia = createPinia();
        app.use(pinia); // <--- Pinia als Plugin registrieren

        // Globale Rechtefunktionen registrieren
        app.config.globalProperties.$hasRight = hasRight;
        app.config.globalProperties.$isRightsReady = isRightsReady;

        // Plugins hinzufügen
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
            tippyDefaults: {}, // Tooltip-Einstellungen
// // Erkennen, ob Dark Mode aktiviert ist

// const isDarkMode = window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches;

// // Senden Sie die Information an den Server
// fetch('/set-dark-mode', {
// method: 'POST',
// headers: {
// 'Content-Type': 'application/json',
// 'X-CSRF-TOKEN': document.getElementById('token').value,
// },
// body: JSON.stringify({ darkMode: isDarkMode })
// });
// alert(isDarkMode);
          });
var $_GET = {};
if(document.location.toString().indexOf('?') !== -1) {
    var query = document.location
                   .toString()
                   // get the query string
                   .replace(/^.*?\?/, '')
                   // and remove any existing hash string (thanks, @vrijdenker)
                   .replace(/#.*$/, '')
                   .split('&');

    for(var i=0, l=query.length; i<l; i++) {
       var aux = decodeURIComponent(query[i]).split('=');
       $_GET[aux[0]] = aux[1];
    }
}
async function loadDarkMode() {
    // Lade den gespeicherten Wert aus localStorage (Standard: 'light', falls nicht vorhanden)
    let mode = localStorage.getItem("theme") || "light";


    // Überprüfe, ob ein globales 'darkMode' gesetzt wurde
    if (window.darkMode) {
        mode = window.darkMode;
    } else {
        try {
            const response = await fetch("/api/dark-mode");
            const data = await response.json();
            mode = data.darkMode || "light"; // Verwende die vom Server gelieferten Daten, wenn vorhanden
        } catch (error) {
            console.error("Fehler beim Laden des Dark Modes:", error);
        }
    }

    // Setze den Wert im localStorage nur, wenn er sich geändert hat
    if (localStorage.getItem("theme") !== mode) {

        //console.log("Ändere Theme von", localStorage.getItem("theme"), "auf", mode);
        localStorage.setItem("theme", mode);
    }

    // Setze das `data-theme` Attribut auf <html>, um das Theme zu wechseln
    document.documentElement.setAttribute("data-theme", mode);

    // Optional: Alle AI-Buttons oder spezifische Elemente aktualisieren
    document.querySelectorAll(".ai-button").forEach((aibut) => {
        aibut.src = `/images/icons/ai-${mode}.png`;
    });


    // Alle AI-Buttons aktualisieren
    document.querySelectorAll(".ai-button").forEach((aibut) => {
        aibut.src = `/images/icons/ai-${mode}.png`;
    });
}

// 🎯 Dark Mode direkt beim Laden der Seite setzen
document.addEventListener("DOMContentLoaded", loadDarkMode);


function checkImageExists(url, callback) {
    const img = new Image();
    img.onload = () => callback(true);   // Bild erfolgreich geladen
    img.onerror = () => callback(false); // Bild konnte nicht geladen werden
    img.src = url;
  }
  function decodeHtml(txt) {
    if(!txt){
return "";
    }
    return txt.replace(/%5B/g, '[').replace(/%5D/g, ']');

}
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






        // Globale Komponenten
        app.component("font-awesome-icon", FontAwesomeIcon);

        // App mounten
        app.mount(el);
      },
      progress: {
        color: "#0EA5E9", // Fortschrittsbalken-Farbe
      },
    });
  })
  .catch((error) => {
    // Fehlerbehandlung
    return "";
    // const fallback = document.createElement("div");
    // fallback.innerHTML = `
    //   <div style="padding:2rem;text-align:center;font-family:sans-serif">
    //     <h2>Fehler beim Laden der Benutzerrechte</h2>
    //     <p>Bitte laden Sie die Seite neu oder melden Sie sich erneut an.</p>
    //   </div>
    // `;
    // document.body.appendChild(fallback);
    // console.error("Fehler beim Laden der Benutzerrechte: ", error);
  });
  let oldUrl = window.location.href;

window.addEventListener('beforeunload', function (event) {
  let newUrl = document.activeElement?.href || '';

  // Wenn die neue URL sich von der aktuellen unterscheidet
  if (newUrl && newUrl !== oldUrl) {
    navigator.sendBeacon('/unset-session.php');
  }
});
