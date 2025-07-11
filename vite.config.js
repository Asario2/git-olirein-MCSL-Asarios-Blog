import { defineConfig } from 'vite';
import laravel from 'laravel-vite-plugin';
import vue from '@vitejs/plugin-vue';

function extractSubdomain(host) {
    const parts = host.split('.');
    if (parts.length >= 3) {
        return parts[0]; // z. B. admin.meineseite.test ? "admin"
    }
    return 'default';
}

export default defineConfig(({ command }) => {
    const host = process.env.VITE_HOST || 'ab.localhost.de'; // Default-Host
    const subdomain = extractSubdomain(host);

    process.env.SUBDOMAIN = subdomain; // An PostCSS übergeben

    return {
        server: {
            host: '127.0.0.1',
            port: 5173,
            hmr: {
                host: 'mfx.localhost.de',
            },
            cors: true,
        },
        plugins: [
            laravel({
                input: [
                    
					'resources/css/app.css',
					
					`public/css/app.css`,
					
                    `resources/js/app.js`,
                ],
                refresh: true,
            }),
            vue(),
        ],
        define: {
            'process.env': {}, // ?? verhindert Fehler "process is not defined"
        },
    };
});
