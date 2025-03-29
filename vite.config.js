
import { defineConfig } from "vite";
import laravel from "laravel-vite-plugin";
import vue from '@vitejs/plugin-vue';

// Exportiere die Vite-Konfiguration korrekt
export default defineConfig({
  plugins: [
    laravel({
      input: [
        'resources/js/app.js',
        
      ],
      refresh: true,  // Optional: Aktiviert das automatische Neu Laden bei Änderungen
    }),
        vue({
            template: {
                transformAssetUrls: {
                    base: null,
                    includeAbsolute: false,
                },
            },
        }),
    ],
	 css: {
    postcss: './postcss.config.js',
  },
   optimizeDeps: {
     include: ['photoswipe']
  }
});
