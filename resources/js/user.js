// Erkennen, ob Dark Mode aktiviert ist

const isDarkMode = window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches;

// Senden Sie die Information an den Server
fetch('/set-dark-mode', {
    method: 'POST',
    headers: {
        'Content-Type': 'application/json',
        'X-CSRF-TOKEN': document.getElementById('token').value,
    },
    body: JSON.stringify({ darkMode: isDarkMode })
});
alert(isDarkMode);
