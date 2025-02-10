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
