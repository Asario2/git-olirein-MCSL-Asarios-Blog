import defaultTheme from "tailwindcss/defaultTheme";
import forms from "@tailwindcss/forms";
import typography from "@tailwindcss/typography";

/** @type {import('tailwindcss').Config} */
export default {
    darkMode: "class",

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
    // =====
    // Layout Farben (Sun & Night)
    // =====
    "layout-night-0":    "#000000",   // Schwarz
    "layout-night-50":   "#1a0a00",
    "layout-night-100":  "#330f00",
    "layout-night-200":  "#4d1600",
    "layout-night-300":  "#661c00",
    "layout-night-400":  "#803300",
    "layout-night-500":  "#ff4c00",   // kräftiges Neon-Orange
    "layout-night-600":  "#ff6600",
    "layout-night-700":  "#ff8533",
    "layout-night-800":  "#ffa366",
    "layout-night-900":  "#ffbf99",
    "layout-night-950":  "#ffd9cc",
    "layout-night-1000": "#ffffff",
    "layout-night-1050": "#ffa200",

    "layout-sun-0":    "#ffffff",
    "layout-sun-50":   "#fff8f3",
    "layout-sun-100":  "#ffe7d9",
    "layout-sun-200":  "#ffcfb3",
    "layout-sun-300":  "#ffb380",
    "layout-sun-400":  "#ff944d",
    "layout-sun-500":  "#ff751a",  // lebendiges Orange
    "layout-sun-600":  "#e66000",
    "layout-sun-700":  "#b34c00",
    "layout-sun-800":  "#803800",
    "layout-sun-900":  "#4d2400",
    "layout-sun-950":  "#331a00",
    "layout-sun-1000": "#000000",

    // =====
    // Primary Farben (Sun & Night)
    // =====
       "primary-night-0":    "#000000",   // Schwarz
    "primary-night-50":   "#1a0a00",
    "primary-night-100":  "#330f00",
    "primary-night-200":  "#4d1600",
    "primary-night-300":  "#661c00",
    "primary-night-400":  "#803300",
    "primary-night-500":  "#ff4c00",   // kräftiges Neon-Orange
    "primary-night-600":  "#ff6600",
    "primary-night-700":  "#ff8533",
    "primary-night-800":  "#ffa366",
    "primary-night-900":  "#ffbf99",
    "primary-night-950":  "#ffd9cc",
    "primary-night-1000": "#ffffff",
    "primary-night-1050": "#ffa200",

    "primary-sun-0":    "#ffffff",
    "primary-sun-50":   "#fff8f3",
    "primary-sun-100":  "#ffe7d9",
    "primary-sun-200":  "#ffcfb3",
    "primary-sun-300":  "#ffb380",
    "primary-sun-400":  "#ff944d",
    "primary-sun-500":  "#ff751a",  // lebendiges Orange
    "primary-sun-600":  "#e66000",
    "primary-sun-700":  "#b34c00",
    "primary-sun-800":  "#803800",
    "primary-sun-900":  "#4d2400",
    "primary-sun-950":  "#331a00",
    "primary-sun-1000": "#000000",
  },



            fontFamily: {
                sans: ["Open Sans", ...defaultTheme.fontFamily.sans],
                logo: ["Open Sans", ...defaultTheme.fontFamily.sans],
                title: ["Ubuntu", ...defaultTheme.fontFamily.sans],
            },
        },
    },

    plugins: [forms, typography],
};
