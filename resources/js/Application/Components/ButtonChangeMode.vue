<template>
    <button
        type="button"
        @click="changeMode"
        class="flex items-center flex-nowrap cursor-pointer rounded-md px-4 py-2 border border-transparent leading-4 font-medium bg-transparaent transition focus:outline-none"
        :class="class"
    >
        <span v-if="mode == 'light'">
            <icon-night class="w-4 h-4"></icon-night>
        </span>
        <span v-else>
            <icon-sun class="w-4 h-4"></icon-sun>
        </span>
    </button>
</template>
<script>
import { defineComponent } from 'vue'

import IconNight from '@/Application/Components/Icons/Night.vue'
import IconSun from '@/Application/Components/Icons/Sun.vue'

export default defineComponent({
    name: 'Components_ButtonChangeMode',

    components: {
        IconNight,
        IconSun
    },

    emits: ['changeMode'],

    props: {
        mode: {
            type: String,
            default: 'light'
        },
        class: {
            type: String,
            default:
                `cursor-pointer inline-block rounded-lg px-2 py-1 text-sm
                text-layout-sun-700 hover:bg-layout-sun-100 hover:text-layout-sun-900
                dark:text-layout-night-700 dark:hover:bg-layout-night-100 dark:hover:text-layout-night-900`
        }
    },

    setup (props) {
        function changeMode () {
            let value = 'light'
            if (props.mode == 'light') {
                value = 'dark'
            }
            fetch('/toggle-dark-mode', {
            method: 'POST',
            headers: {
                'X-CSRF-TOKEN': document.getElementById('token').value,
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ dark_mode: value }),
            });

            this.$emit('changeMode', value)
            reloadQrCode();
        }

        return {
            changeMode
        }
    }
});
function reloadQrCode() {
    fetch(location.href)
        .then(response => response.text())
        .then(html => {
            const parser = new DOMParser();
            const doc = parser.parseFromString(html, 'text/html');
            const newSvg = doc.querySelector('svg#QrCode'); // SVG mit der ID `qrcode` finden
            const currentSvg = document.querySelector('svg#QrCode'); // Aktuelles SVG auf der Seite finden
            if (newSvg && currentSvg) {
                currentSvg.innerHTML = newSvg.innerHTML; // Inhalt des SVGs aktualisieren
            }
        })
        .catch(error => console.error('Error reloading QR Code:', error));
}
</script>
