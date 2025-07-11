import defaultTheme from 'tailwindcss/defaultTheme';
import forms from '@tailwindcss/forms';
import typography from '@tailwindcss/typography';

/** @type {import('tailwindcss').Config} */
export default {
    darkMode: 'class',

    content: [
		"./vendor/laravel/framework/src/Illuminate/Pagination/resources/views/*.blade.php",
        "./vendor/laravel/jetstream/**/*.blade.php",
        "./storage/framework/views/*.php",
        "./resources/views/**/*.blade.php",
        "./resources/js/**/*.vue",
    ],

    theme: {
        extend: {
            colors: {
                // ======
                // Layout
                // ======
                'layout-sun-0': '#ffffff',
                'layout-sun-50': '#f9fafb',
                'layout-sun-100': '#f3f4f6',
                'layout-sun-200': '#e5e7eb',
                'layout-sun-300': '#d1d5db',
                'layout-sun-400': '#9ca3af',
                'layout-sun-500': '#6b7280',
                'layout-sun-600': '#4b5563',
                'layout-sun-700': '#374151',
                'layout-sun-800': '#1f2937',
                'layout-sun-900': '#111827',
                'layout-sun-950': '#030712',
                'layout-sun-1000': '#000000',
                'layout-sun-1050': '#000000',
                //
                'layout-night-0': '#000000',
                'layout-night-50': '#030712',
                'layout-night-100': '#111827',
                'layout-night-200': '#1f2937',
                'layout-night-300': '#374151',
                'layout-night-400': '#4b5563',
                'layout-night-500': '#6b7280',
                'layout-night-600': '#9ca3af',
                'layout-night-700': '#d1d5db',
                'layout-night-800': '#e5e7eb',
                'layout-night-900': '#f3f4f6',
                'layout-night-950': '#f9fafb',
                'layout-night-1000': '#ffffff',
                'layout-night-1050': '#ffffff',
                // ===
                // Sky
                // ===
                'primary-sun-0': '#ffffff',
                'primary-sun-50': '#f0f9ff',
                'primary-sun-100': '#e0f2fe',
                'primary-sun-200': '#bae6fd',
                'primary-sun-300': '#7dd3fc',
                'primary-sun-400': '#38bdf8',
                'primary-sun-500': '#0ea5e9',
                'primary-sun-600': '#0284c7',
                'primary-sun-700': '#0369a1',
                'primary-sun-800': '#075985',
                'primary-sun-900': '#0c4a6e',
                'primary-sun-950': '#082f49',
                'primary-sun-1000': '#000000',
                'primary-sun-1050': '#000000',
                //
                'primary-night-0': '#000000',
                'primary-night-50': '#082f49',
                'primary-night-100': '#0c4a6e',
                'primary-night-200': '#075985',
                'primary-night-300': '#0369a1',
                'primary-night-400': '#0284c7',
                'primary-night-500': '#0ea5e9',
                'primary-night-600': '#38bdf8',
                'primary-night-700': '#7dd3fc',
                'primary-night-800': '#bae6fd',
                'primary-night-900': '#e0f2fe',
                'primary-night-950': '#f0f9ff',
                'primary-night-1000': '#ffffff',
                'primary-night-1050': '#ffffff',
            },

            fontFamily: {
                sans: ['Open Sans', ...defaultTheme.fontFamily.sans],
                logo: ['Open Sans', ...defaultTheme.fontFamily.sans],
                title: ['Ubuntu', ...defaultTheme.fontFamily.sans],
            },
        },
    },

    plugins: [forms, typography],
};
