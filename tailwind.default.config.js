import defaultTheme from "tailwindcss/defaultTheme";
import forms from "@tailwindcss/forms";
import typography from "@tailwindcss/typography";

/** @type {import('tailwindcss').Config} */
export default {
  darkMode: "class",

  content: [
    "./vendor/laravel/framework/src/Illuminate/Pagination/resources/views/*.blade.php",
    "./vendor/laravel/jetstream/**/*.blade.php",
	"./resources/css/**/*.css",
	"./public/css/**/*.css",
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
        "layout-sun-0": "#ffffff",
        "layout-sun-50": "#f9f9f9",
        "layout-sun-100": "#f0f0f0",
        "layout-sun-200": "#e0e0e0",
        "layout-sun-300": "#d0d0d0",
        "layout-sun-400": "#b0b0b0",
        "layout-sun-500": "#909090",
        "layout-sun-600": "#707070",
        "layout-sun-700": "#505050",
        "layout-sun-800": "#303030",
        "layout-sun-900": "#202020",
        "layout-sun-950": "#101010",
        "layout-sun-1000": "#000000",

        "layout-night-0": "#000000",
        "layout-night-50": "#101010",
        "layout-night-100": "#202020",
        "layout-night-200": "#303030",
        "layout-night-300": "#505050",
        "layout-night-400": "#707070",
        "layout-night-500": "#909090",
        "layout-night-600": "#b0b0b0",
        "layout-night-700": "#d0d0d0",
        "layout-night-800": "#e0e0e0",
        "layout-night-900": "#f0f0f0",
        "layout-night-950": "#f9f9f9",
        "layout-night-1000": "#ffffff",

        // ======
        // Primary (Graustufen-Akzente)
        // ======
        "primary-sun-0": "#ffffff",
        "primary-sun-50": "#f5f5f5",
        "primary-sun-100": "#e5e5e5",
        "primary-sun-200": "#cccccc",
        "primary-sun-300": "#b3b3b3",
        "primary-sun-400": "#999999",
        "primary-sun-500": "#aaf",
        "primary-sun-600": "#666666",
        "primary-sun-700": "#aaf",
        "primary-sun-800": "#333333",
        "primary-sun-900": "#1a1a1a",
        "primary-sun-950": "#0d0d0d",
        "primary-sun-1000": "#000000",

        "primary-night-0": "#000000",
        "primary-night-50": "#0d0d0d",
        "primary-night-100": "#1a1a1a",
        "primary-night-200": "#333333",
        "primary-night-300": "#4d4d4d",
        "primary-night-400": "#666666",
        "primary-night-500": "#aaf",
        "primary-night-600": "#999999",
        "primary-night-700": "#aaf",
        "primary-night-800": "#cccccc",
        "primary-night-900": "#e5e5e5",
        "primary-night-950": "#f5f5f5",
        "primary-night-1000": "#ffffff",
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
