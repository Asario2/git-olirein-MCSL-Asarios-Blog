<template>
    <div class="absolute bottom-4 right-4 z-10">
        <img :src="aiButtonImage" alt="AI Button" class="object-contain ai-button x64" />
    </div>
</template>

<script>

    // setup() {
//         const darkMode = ref("light"); // Default-Wert
//         const aiButtonImage = ref("");

//         async function loadDarkMode() {
//             // Prüfen, ob `window.darkMode` aus Blade verfügbar ist
//             if (window.darkMode) {
//                 darkMode.value = window.darkMode;
//             } else {
//                 try {

//                     const response = await fetch("/api/dark-mode");
//                     const data = await response.json();
//                     darkMode.value = data.darkMode;
//                     // console.log("DMM:" + data.darkMode);

//                 } catch (error) {
//                     console.error("Fehler beim Laden des Dark Modes:", error);
//                 }
//             }
//             // Dark Mode in localStorage speichern
//             if(localStorage.getItem("darkMode") != darkMode.value){
//                 localStorage.setItem("darkMode", darkMode.value);

//             }

//             // Dynamischen Bild-Pfad setzen
//             aiButtonImage.value = `/images/icons/ai-${darkMode.value}.png`;
//         }

//         onMounted(loadDarkMode);

//         return { aiButtonImage };
//     },

</script>


<style scoped>
.absolute {
    position: absolute;
}
.bottom-4 {
    bottom:0px;
}
.right-4 {
    right:-0px;
}
.z-10 {
    z-index: 10;
}
.x64
{
    min-width:64px !important;
}
</style>
