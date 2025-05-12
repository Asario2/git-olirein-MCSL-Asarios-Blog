import { defineConfig } from "vite";
import laravel from "laravel-vite-plugin";
import vue from '@vitejs/plugin-vue';

export default defineConfig({
  define: {
    'process.env': {} // Verhindert Fehler bei process.env
  },
  server: {
    host: '127.0.0.1', // IPv4 verwenden statt [::1]
    hmr: {
      host: '127.0.0.1', // HMR über IPv4
    }
  },
  plugins: [
    laravel({
      input: [
        'resources/js/app.js',
      ],
      refresh: true,
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
