<template>
    <div class="p-4 bg-layout-sun-100 dark:bg-layout-night-100 rounded-lg shadow-sm">
      <table class="w-full table-auto border-collapse text-sm md:text-base">
        <thead class="bg-layout-sun-200 dark:bg-layout-night-200 text-layout-sun-800 dark:text-layout-night-800">
          <tr>
            <th class="px-4 py-3 text-left">Modul</th>
            <th class="px-4 py-3 text-left">Beschreibung</th>
            <th class="px-4 py-3 text-left">Aktiv</th>
          </tr>
        </thead>
        <tbody>
          <tr
            v-for="(value, key) in localFunc"
            :key="key"
            class="hover:bg-layout-sun-200 dark:hover:bg-layout-night-200 transition duration-200 border-b border-gray-200 dark:border-gray-700"
          >
            <td class="px-4 py-3">{{ stripXkis(key) }}</td>
            <td class="px-4 py-3">{{ getLabel(key) }}</td>
            <td class="px-4 py-3">
              <input-checkbox
                :name="key"
                v-model="localFunc[key]"
              />
            </td>
          </tr>
        </tbody>
      </table>
      <button
      @click="submit"
    class="bg-blue-600 hover:bg-blue-700 text-white px-6 py-2 rounded mt-4 transition-colors"
  >
    Modulrechte speichern
  </button>
    </div>
  </template>

  <script>
  import InputCheckbox from "@/Application/Components/Form/InputCheckbox.vue";
  import { GetSettings } from "@/helpers";

  export default {
    name: "Functions",
    components: {
      InputCheckbox,
    },
    props: {
      func: {
        type: Object,
        required: true,
      },
    },
    emits: ["save"],

    data() {
      return {
        settings: {},
        localFunc: {}, // Lokale Kopie für reaktive Bearbeitung
      };
    },

    watch: {
      func: {
        immediate: true,
        handler(newVal) {
          // tiefer kopieren bei Bedarf, aber für einfache Werte reicht:
          this.localFunc = { ...newVal };
        },
      },
    },

    async mounted() {
      this.settings = await GetSettings();
    },

    methods: {
      stripXkis(key) {
        return key.replace(/^xkis_/, "");
      },
      getLabel(key) {
        const cleanKey = key.replace(/^xkis_/, "");
        return this.settings.exl?.[cleanKey] ?? "—";
      },

      submit() {
        console.log("es:" + this.localFunc);
        this.$emit("save", this.localFunc);

      },
    },
  };
  </script>
