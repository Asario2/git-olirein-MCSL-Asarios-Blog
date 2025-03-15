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
    // Standardwert für Dark Mode aus localStorage holen
    let mode = localStorage.getItem("theme") || "light";

    // Falls in `window.darkMode` ein Wert gesetzt ist, diesen übernehmen
    if (window.darkMode) {
        mode = window.darkMode;
    } else {
        try {
            const response = await fetch("/api/dark-mode");
            const data = await response.json();
            mode = data.darkMode;
        } catch (error) {
            console.error("Fehler beim Laden des Dark Modes:", error);
        }
    }

    // Falls sich der Wert geändert hat, speichern
    if (localStorage.getItem("theme") !== mode) {
        localStorage.setItem("theme", mode);
    }

    // 🔥 Theme direkt auf <html> setzen
    document.documentElement.setAttribute("data-theme", mode);
    document.cookie = "darkMode=" + mode + "; path=/";

    // Alle AI-Buttons aktualisieren
    document.querySelectorAll(".ai-button").forEach((aibut) => {
        aibut.src = `/images/icons/ai-${mode}.png`;
    });
}

// 🎯 Dark Mode direkt beim Laden der Seite setzen
document.addEventListener("DOMContentLoaded", loadDarkMode);





