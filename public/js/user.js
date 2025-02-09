// Erkennen, ob Dark Mode aktiviert ist

const isDarkMode =
    window.matchMedia &&
    window.matchMedia("(prefers-color-scheme: dark)").matches;

// Senden Sie die Information an den Server
fetch("/set-dark-mode", {
    method: "POST",
    headers: {
        "Content-Type": "application/json",
        "X-CSRF-TOKEN": document.getElementById("token").value,
    },
    body: JSON.stringify({ darkMode: isDarkMode }),
});
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
