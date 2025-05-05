<template>
  <section class="p-5 md:p-10 bg-layout-sun-0 dark:bg-layout-night-0 text-layout-sun-800 dark:text-layout-night-800">
    <div class="max-w-6xl mx-auto rounded overflow-hidden">

      <!-- Tabs -->
      <div class="flex border-b border-gray-300 dark:border-layout-night-200 mb-4 space-x-2">
        <span @click="activeTab = 'tables'" :class="tabClass('tables')">Tabellen</span>
        <span @click="activeTab = 'functions'" :class="tabClass('functions')">Funktionen</span>

        <!-- Rollen Auswahl -->
        <div class="ml-auto">
          <InputSelect
            v-model="selected"
            :xname="'users_rights_id'"
            :name="'users_rights_id'"
            :options="roles"
            @update:modalValue="selected = $event"
            @input-change="navigate"
          />
        </div>
      </div>

      <!-- Tabellen Rechte -->

              <!-- Tabellen-Rechte Section -->
<!-- Tabellen-Rechte Section -->
<div v-if="activeTab === 'tables'" class="bg-layout-sun-100 dark:bg-layout-night-100 p-4 rounded-lg shadow-sm">
  <table class="w-full border-collapse text-sm md:text-base rounded overflow-hidden">
    <thead class="bg-layout-sun-300 dark:bg-layout-night-300 text-layout-sun-800 dark:text-layout-night-800">
      <tr>
        <th class="px-4 py-3 text-left"><nobr>An/Aus</nobr></th>
        <th class="px-4 py-3 text-left">Tabelle</th>

        <th v-for="field in Object.keys(rights)" :key="field" class="px-4 py-3 text-left">
        <nobr>{{ ucf2(field) }}</nobr>

        </th>
      </tr>
    </thead>
    <tbody>
      <tr
        v-for="(table, index) in adminTables"
        :key="table"
        class="hover:bg-layout-sun-200 dark:hover:bg-layout-night-200 transition duration-200 border-b border-gray-200 dark:border-gray-700"
      >
        <td class="px-4 py-3 cursor-pointer text-left">
          <button @click="togglerow(index)" class="flex items-center text-blue-500">
            <IconRight class="w-5 h-5" fill="currentColor" v-tippy/><tippy>{{ ucf(table.name) }} An/Aus</tippy>
          </button>
        </td>
        <td class="px-4 py-3" v-tippy>{{ ucf(table.name) }}<tippy>{{ucf(table.name)}}</tippy></td>
        <td
          v-for="field in Object.keys(rights)"
          :key="field"
          class="px-4 py-3 text-left"
        >
          <input-checkbox v-model="rights[field][index]" v-tippy/><tippy>{{ ucf2(field) }} von {{ ucf(table.name) }}</tippy>
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


      <!-- Funktionen Rechte -->
      <div v-if="activeTab === 'functions'">
        <!-- {{ lf }} -->
        <div class="p-4 bg-layout-sun-100 dark:bg-layout-night-100 rounded-lg shadow-sm">
      <table class="w-full border-collapse text-sm md:text-base">
        <thead class="bg-layout-sun-300 dark:bg-layout-night-300 text-layout-sun-800 dark:text-layout-night-800">
          <tr>
            <th class="px-4 py-3 text-left">Modul</th>
            <th class="px-4 py-3 text-left">Beschreibung</th>
            <th class="px-4 py-3 text-left">Aktiv</th>
          </tr>
        </thead>
        <tbody>
            <tr class="hover:bg-layout-sun-200 dark:hover:bg-layout-night-200 transition duration-200 border-b border-gray-200 dark:border-gray-700" v-for="(value, key) in lf" :key="key">
            <td class="px-4 py-3 text-left">{{ stripXkis(key) }}</td>
            <td class="px-4 py-3 text-left">{{ getLabel(key) }}</td>
            <td class="px-4 py-3 text-left">
              <input-checkbox v-model="localFunc[key]" />
            </td>
          </tr>
        </tbody>
      </table>

      <button
        @click="saveRights"
        class="bg-blue-600 hover:bg-blue-700 text-white px-6 py-2 rounded mt-4"
      >
        Modulrechte speichern
      </button>
    </div>
      </div>

    </div>
  </section>
</template>

<script>
import { GetSettings } from "@/helpers";
import InputSelect from "@/Application/Components/Form/InputSelect.vue";
import InputCheckbox from "@/Application/Components/Form/InputCheckbox.vue";
import IconRight from "@/Application/Components/Icons/IconRight.vue"; // Assuming this is the correct import
export default {
  name: "Rightstable",
  components: { InputSelect , InputCheckbox,IconRight},
  props: {
    adminTables: Array,
    urid: [String, Number],
    roles: Array,
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
        localFunc: {},
        lf:{},

      };
  },
  methods: {
    tabClass(tab) {
      return [
        'cursor-pointer px-4 py-2',
        this.activeTab === tab ? 'border-b-2 border-blue-500 font-bold' : ''
      ];
    },
    navigate() {
      this.$emit('update:urid', this.selected); // Falls du es brauchst
    },
    async fetchRights(urid) {
        try {
          const response = await axios.get(`/admin/user-rights/get?urid=${urid}`);
          this.userRights = response.data;
          this.initializeRights();
        } catch (e) {
          console.error("Fehler beim Laden der Rechte1:", e);
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
      ucf2(str){
        return this.settings.exl?.[str] ?? str;
      },
//       saveRights() {
//   let payload = {};

//   // Erst Tabellen-Rechte zusammenbauen
//   for (const [key, values] of Object.entries(this.rights)) {
//     if (Array.isArray(values)) {
//       payload[key] = values.map((v) => (v ? "1" : "0")).join(""); // ergibt "1111101010..."
//     } else {
//       payload[key] = values ? "1" : "0"; // nur falls values aus irgendeinem Grund KEIN Array ist (Backup)
//     }
//   }

//   payload["urid"] = this.selected;

//   // Jetzt Modul-Rechte (`localFunc`) zusammenbauen
//   for (const [key, value] of Object.entries(this.localFunc)) {
//     payload[key] = value ? "1" : "0";
//   }
//   payload['urid'] = "1";
//   console.log("Sende Payload:", payload); // Nur zur Kontrolle!

//   axios.post("/admin/user-rights/save", payload).then(() => {
//     // alert("Rechte gespeichert!");
//   });
// },
// saveRights() {
//   let payload = {};

//   // Erst Tabellen-Rechte zusammenbauen
//   for (const [key, values] of Object.entries(this.rights)) {
//     if (Array.isArray(values)) {
//       payload[key] = values.map((v) => (v ? "1" : "0")).join(""); // ergibt "1111101010..."
//     } else {
//       payload[key] = values ? "1" : "0"; // nur falls values aus irgendeinem Grund KEIN Array ist (Backup)
//     }
//   }

//   payload["urid"] = this.selected;

//   // Jetzt Modul-Rechte (`localFunc`) zusammenbauen
//   for (const [key, value] of Object.entries(this.localFunc)) {
//     payload[key] = value ? "1" : "0";
//   }

//   console.log("Sende Payload:", payload); // Nur zur Kontrolle!

//   axios.post("/admin/user-rights/save", payload).then(() => {
//     // alert("Rechte gespeichert!");
//   });
// },
saveRights() {


  const payload = {};

  for (const [key, value] of Object.entries(this.rights)) {
    if (Array.isArray(value)) {
      // Tabellenrechte → Bitstring
      payload[key] = value.map(v => (v ? "1" : "0")).join("");
    }
    }
    // console.log("BJ:" + JSON.stringify(this.lf2,null,2));
    for (const [key, value] of Object.entries(this.lf2)) {
          console.log(key, value);  // Hier arbeitest du mit den Werten und Schlüsseln
          payload[key] = value;

    }

//   console.log("🚀 Finales Payload:", payload);

  axios.post('/api/admin/user-rights/save?urid=' + this.selected, payload)
    .then(response => {
    //   console.log('✅ Rechte gespeichert!', response.data);
    })
    .catch(error => {
      console.error('❌ Fehler beim Speichern:', error);
    });
},

    //   saveRights(p2) {
    //     let payload = {};
    //     for (const [key, values] of Object.entries(this.rights)) {
    //       payload[key] = values.map((v) => (v ? "1" : "0")).join("");
    //     }

    //     payload["urid"] = this.selected;
    //     // for (const funcname in p2) {
    //     // if (Object.hasOwn(p2, funcname)) {
    //     //     payload[funcname] = p2[funcname];
    //     // }
    //     // }
    //     for (const [key, value] of Object.entries(this.localFunc)) {
    //         payload[key] = value ? "1" : "0";
    //     }
    //     console.log("DATA: " + JSON.stringify(payload,null,2));
    //     axios.post("/admin/user-rights/save", payload).then(() => {
    //     //   alert("Rechte gespeichert!");
    //     });
    //   },
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
        this.loadFunctions(this.selected);
      },
      async loadFunctions(urid) {
  try {
    const response = await axios.get(`/admin/user-rights/get?urid=${urid}`);
    // console.log('Funktionen geladen:', response.data);  // Debugging
    Object.entries(response.data).forEach(([key, value]) => {
      if (key.includes("xkis_")) {
        this.lf[key] = value;
      }
    });
    this.localFunc = response.data || {};
  } catch (e) {
    console.error("Fehler beim Laden der Funktionen:", e);
  }
},
      stripXkis(key) {
        return key.replace(/^xkis_/, '');
      },
      getLabel(key) {

        let labels = this.settings?.exl?.[this.stripXkis(key)]

        return labels || this.stripXkis(key);
    },
},
    async mounted() {
        // console.log("urid im mounted:", this.urid);  // Verwende 'this.urid' hier direkt
        this.settings = await GetSettings();
        this.fetchRights(this.urid);  // Statt this.selected, direkt this.urid verwenden
        this.loadFunctions(this.urid);
},
watch: {
      localFunc: {
        immediate: true,
        deep: true,
        handler(newVal) {
          this.lf2 = {};
          for (const key in newVal) {
           if(key.includes("xkis_"))
           {
            this.lf2[key] = newVal[key] === 1 ? 1 : 0;
           }

          }
        },
      },
    },

};

</script>

<style>
.wff{
    min-width:200px !Important;
}
</style>
