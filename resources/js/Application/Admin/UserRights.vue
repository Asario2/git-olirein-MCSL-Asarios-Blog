<template>
    <section class="p-5 mx-auto sm:p-2 md:p-10 bg-layout-sun-0 text-layout-sun-800 dark:bg-layout-night-0 dark:text-layout-night-800">
      <div class="relative w-full flex flex-col max-w-6xl mx-auto overflow-hidden rounded">

        <!-- Tabs -->
        <div class="w-full flex border-b border-gray-300 dark:border-layout-night-200 mb-4 space-x-2 items-center">
          <!-- Tab Navigation -->
          <span
            @click="activeTab = 'tables'"
            class="cursor-pointer px-4 py-2"
            :class="activeTab === 'tables' ? 'border-b-2 border-blue-500 font-bold' : ''"
          >
            Tabellen
          </span>
          <span
            @click="activeTab = 'functions'"
            class="cursor-pointer px-4 py-2"
            :class="activeTab === 'functions' ? 'border-b-2 border-blue-500 font-bold' : ''"
          >
            Funktionen
          </span>
          <span class="px-4 py-2 text-gray-400">Gruppe</span>

          <!-- Dropdown for roles -->
          <div class="w-80 p-2.5 text-sm rounded-lg block text-layout-sun-900 bg-layout-sun-50 placeholder-layout-sun-400
                      dark:text-layout-night-900 dark:bg-layout-night-50 dark:placeholder-layout-night-400
                        dark:focus:ring-primary-night-500 dark:focus:border-primary-night-500 m-auto flr">
            <InputSelect

            :xval="selected"
            :xname="'role_id'"
            :name="'role_id'"
            :options="roles"
            @update:modalValue="selected = $event"
            @input-change="navigate"
            />

          </div>
        </div>

        <!-- Tabellen-Rechte Section -->
<!-- Tabellen-Rechte Section -->
<div v-if="activeTab === 'tables'" class="bg-layout-sun-100 dark:bg-layout-night-100 p-4 rounded-lg shadow-sm">
  <table class="w-full border-collapse text-sm md:text-base rounded overflow-hidden">
    <thead class="bg-layout-sun-200 dark:bg-layout-night-200 text-layout-sun-800 dark:text-layout-night-800">
      <tr>
        <th class="px-4 py-3 text-left">An/Aus</th>
        <th class="px-4 py-3 text-left">Tabelle</th>
        <th v-for="field in Object.keys(rights)" :key="field" class="px-4 py-3 text-center">
          {{ ucf(field) }}
        </th>
      </tr>
    </thead>
    <tbody>
      <tr
        v-for="(table, index) in adminTables"
        :key="table"
        class="hover:bg-layout-sun-200 dark:hover:bg-layout-night-200 transition duration-200 border-b border-gray-200 dark:border-gray-700"
      >
        <td class="px-4 py-3 cursor-pointer">
          <button @click="togglerow(index)" class="flex items-center text-blue-500">
            <IconRight class="w-5 h-5" fill="currentColor" />
          </button>
        </td>
        <td class="px-4 py-3">{{ ucf(table.name) }}</td>
        <td
          v-for="field in Object.keys(rights)"
          :key="field"
          class="px-4 py-3 text-center" align="center"
        >
          <input-checkbox v-model="rights[field][index]" />
        </td>
      </tr>
    </tbody>
  </table>

  <button
    @click="saveRights"
    class="bg-blue-600 hover:bg-blue-700 text-white px-6 py-2 rounded mt-4 transition-colors"
  >
    Rechte speichern
  </button>
</div>


        <!-- Funktionen-Rechte Section -->
        <div v-if="activeTab === 'functions'" class="bg-layout-sun-100 dark:bg-layout-night-100 p-4 rounded-lg">

          <functions
            v-if="func"
            :key="urid"
            :urid="urid"
            :func="func"
            @save="saveRights"
            />
        </div>
      </div>
    </section>
  </template>

  <script>
  import functions from "@/Application/Admin/functions.vue";
  import { GetSettings } from "@/helpers";
  import InputCheckbox from "@/Application/Components/Form/InputCheckbox.vue";
  import InputSelect from "@/Application/Components/Form/InputSelect.vue";
  import IconRight from "@/Application/Components/Icons/IconRight.vue"; // Assuming this is the correct import

  export default {
    name: "RightsTable",
    components: {
      functions,
      InputCheckbox,
      InputSelect,
      IconRight, // Register IconRight component
    },
    props: {
      adminTables: Array,
      urid: {
        type: [Boolean, Number, String],
        default: "1",
      },
      roles: {
        type: Array,
        required: true,
      },
      func: {
        type: [Array, Object, String, Number, Boolean],
        required: true,
      },
    },
    data() {
      const rights = {};
      const fields = [
        "view_table",
        "add_table",
        "edit_table",
        "publish_table",
        "date_table",
        "delete_table",
    ];
      for (const field of fields) {
        rights[field] = [];
      }

      return {
        rights,
        userRights: {},
        selected: String(this.urid),
        activeTab: "tables",
        settings: {},
        func: {},


      };
    },
    async mounted() {
      this.settings = await GetSettings();
      this.fetchRights(this.selected);
        this.loadFunctions(this.urid);
    },
    watch: {
        urid: {
                immediate: true,
                handler(newVal) {
                if (newVal) {
                    this.loadFunctions(newVal);
                }
                }
            },
            func: {
    immediate: true,
    handler(newVal) {
      this.localFunc = { ...newVal }; // flaches Klonen
    }
  }
    },

    methods: {
        async loadFunctions(urid) {
    try {
      const response = await axios.get(`api/roles?urid=${urid}`);
      this.func = response.data;
      console.log("TFF" + this.func);
    } catch (error) {
      console.error("Fehler beim Laden der Funktionen:", error);
    }
  },
loadFunc(urid) {
  axios.get(`/api/roles?urid=${urid}`)
    .then(response => {
      this.func = response.data;
    })
    .catch(error => {
      console.error("Fehler beim Laden der Funktionen:", error);
    });
},
      async fetchRights(urid) {
        try {
          const response = await axios.get(`/admin/user-rights/get?urid=${urid}`);
          this.userRights = response.data;
          this.initializeRights();
        } catch (e) {
          console.error("Fehler beim Laden der Rechte:", e);
        }
      },
      initializeRights() {
        const fieldNames = Object.keys(this.rights);
        for (const field of fieldNames) {
          const binaryString = this.userRights[field] || "";
          const padded = binaryString.padEnd(this.adminTables.length, "0");
          for (let i = 0; i < this.adminTables.length; i++) {
            this.rights[field][i] = padded[i] === "1";
          }
        }
      },
      ucf(str) {
        return str
          .split("_")
          .map((val) => val.charAt(0).toUpperCase() + val.slice(1).toLowerCase())
          .join(" ");
      },
      saveRights(p2) {
        let payload = {};
        for (const [key, values] of Object.entries(this.rights)) {
          payload[key] = values.map((v) => (v ? "1" : "0")).join("");
        }
        payload["urid"] = this.selected;
        for (const funcname in p2) {
        if (Object.hasOwn(p2, funcname)) {
            payload[funcname] = p2[funcname];
        }
        }


        axios.post("/admin/user-rights/save", payload).then(() => {
        //   alert("Rechte gespeichert!");
        });
      },

      togglerow(index) {
        const allEnabled = Object.keys(this.rights).every(
          (field) => this.rights[field][index]
        );
        const newValue = !allEnabled;

        for (const field in this.rights) {
          this.rights[field][index] = newValue;
        }
      },
      navigate() {
        this.fetchRights(this.selected);
        this.loadFunc(this.selected);
      },
    },
  };
  </script>

  <style scoped>
.flr{
 justify-items:right !Important;
}
  </style>
