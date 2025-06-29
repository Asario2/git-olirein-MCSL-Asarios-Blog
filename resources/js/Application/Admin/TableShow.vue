<template>
    <layout>
      <!-- Header -->
      <template #header>
        <breadcrumb :breadcrumbs="breadcrumbs" :current="'Tabelle ' + table"></breadcrumb>

      </template>

        <!-- Table -->
        <section class="mt-8">

            <list-container
          :title="'Tabelle ' + tablez"
          :datarows="rows"
          :route-index="showRoute"
          :xxtable="tableq"
          :filters="filters"
          search-filter="true"
          search-text="Suche nach Inhalten anhand ihres Namens oder ihrer Beschreibung."
          :edit-on="true"
          route-edit="admin.tables.edit"
          :create-on="true"
          :route-create="routeCreate"
          :delete-on="true"
          route-delete="admin.tables.destroy"
          :tableq="this.tableq"
          @update-checked-status="onCheckedStatusUpdate"
          >
          <template #header>
            <tr>
                <th class="np-dl-th-normal">ID</th>
              <th v-if="cat_on_head" class="np-dl-ht-normal">{{ cat_on_head }}</th>
              <th v-if="table_head" class="np-dl-ht-normal">{{ table_head }}</th>
              <th class="np-dl-th-normal">{{ prename }}</th>
              <th class="np-dl-th-normal">{{ predesc }}</th>
              <th v-if="aftsetting" class="np-dl-ht-normal">{{ aftsettingshead }}</th>
              <th class="np-dl-th-normal" v-if="table === 'comments'">Check</th>
              <th class="np-dl-th-normal" v-if="hasCreated">Datum</th>
              <th class="np-dl-th-normal" colspan="2"></th>
            </tr>
          </template>
          <template v-slot:datarow="data" :items="items" @update-list="removeItem">
                <td class="np-dl-td-normal">{{ getMixId(data.datarow) }}</td>

                <!-- Kategorie -->
                <td v-if="data.datarow.image_categories" class="np-dl-td-normal">
                <img :src="'/images/_ab/images_categories/sm/' + data.datarow.image_categories + '.jpg'"  />
                </td>
                <td v-if="data.datarow.blog_categories" class="np-dl-td-normal">
                <span
                    class="text-sm min-w-fit min-h-fit bg-primary-sun-500 text-primary-sun-900 dark:bg-primary-night-500 dark:text-primary-night-900 font-semibold px-2.5 py-0.5 rounded-lg whitespace-nowrap"
                >

                    {{ data.datarow.blog_categories }}

                </span>
                </td>
                <td v-if="table  == 'comments'" class="np-dl-td-normal">
                    <!-- <pre>{{data.datarow}}</pre> -->
                    <CreatedAt :post_id="data.datarow.post_id" :table="data.datarow.admin_table">
                <span
                    class="text-sm min-w-fit min-h-fit bg-primary-sun-500 text-primary-sun-900 dark:bg-primary-night-500 dark:text-primary-night-900 font-semibold px-2.5 py-0.5 rounded-lg whitespace-nowrap"
                >
                    {{ ucf(data.datarow.admin_table) }}

                </span>
            </CreatedAt>
        </td>
                <td v-else-if="table != 'comments' && table_head"class="np-dl-td-normal">
                    <span
                    class="text-sm min-w-fit min-h-fit bg-primary-sun-500 text-primary-sun-900 dark:bg-primary-night-500 dark:text-primary-night-900 font-semibold px-2.5 py-0.5 rounded-lg whitespace-nowrap"
                >
                    {{ ucf(data.datarow.admin_table) }}

                </span>

                </td>

                <td class="np-dl-td-normal break-words whitespace-normal max-w-[600px]">{{ data.datarow.name }}</td>

                <td class="np-dl-td-normal" v-if="table === 'comments'">
                <div v-if="users[data.datarow.users_id]?.img && users[data.datarow.users_id].img !== '008.jpg'">
                    <nobr>
                    <img :src="'/images/' + users[data.datarow.users_id].img" class="max-w-[24px] max-h-[24px] object-cover rounded-full inline" />
                    &nbsp; {{ users[data.datarow.users_id].name }}
                    </nobr>
                </div>
                <div v-else>
                    <img src="/images/profile-photos/008.jpg" class="max-w-[24px] max-h-[24px] object-cover rounded-full inline" />
                    <span>&nbsp;{{ data.datarow.nick  }}</span>
                </div>
                </td>

                <td class="np-dl-td-normal break-words whitespace-normal" v-if="table !== 'comments'" >{{ data.datarow.description }}</td>

                <!-- Check ✅ -->
                <td class="np-dl-td-normal" v-if="table === 'comments'">
                    <span v-if="checkedStatus && checkedStatus[data.datarow.id]" style="font-size:24px;">✅</span>
                <span v-else class="bg-[rgb(50,174,179)] rounded-full w-[24px] h-[24px] px-[3px] text-white">O</span>
                </td>
          </template>
        </list-container>
       </section>
    </layout>
  </template>
  <input type="hidden" id="tb_alt" value="{ table_alt }" />
  <script>
let table_z = CleanTable();
let table_alt = table_z;
let table = table_z.toLowerCase();
import { defineComponent } from "vue";
  import Layout from "@/Application/Admin/Shared/Layout.vue";
  import CreatedAt from "@/Application/Components/Form/CreatedAt.vue";

  import { CleanTable, CleanId } from '@/helpers';
  import { GetSettings } from "@/helpers";

  import Breadcrumb from "@/Application/Components/Content/Breadcrumb.vue";
  import ListContainer from "@/Application/Components/Lists/ListContainer.vue";
  import { hasRight,loadAllRights,isRightsReady } from '@/utils/rights';
  export default defineComponent({
    name: "AdminTableShow",
    components: {
      Layout,
      Breadcrumb,
      CreatedAt,
      ListContainer,
    },
    props: {
    applicationName: {
    type: String,
    required: false,
    default: "Administrator-Anwendung",
  },
//   cat_on_head:{
//     type: String,
//   },
  users: Object,
  table_alt: {
    type: String,
    required: false,
  },
  table_q: {
    type: String,
    required: true,
    default: table_alt,
  },
  table: {
      type: String,
      required: true,
    },
    // tablez: {
    //   type: String,
    //   required: true,
    // },

  startPage: {
    type: Boolean,
    default: true,
  },
  breadcrumbs: {
      type: Object,
      required: true,
    },
  additionalEntries: {
    type: Array,
    default: () => [],
  },
  tableq:{
  type: String,
  },
  current: {
    type: String,
    required: true,
  },
    filters: {
      type: Object,
      default: () => ({}),
    },
    rows: {
        type: [Array,Object],
        required: true,
        default: () => [],
      },
      datarows: {
        type: [Array,String],
        required: true,
        default: () => [],
    },
    // routeCreate: {
    //     type: String,
    //     default: route('admin.tables.create', table),
    // },
    current:{
        type: String,
    },
    // applicationName:{
    //     type: String,
    // },
    // ItemName: {
    //   type: String,
    //   default: "",
    // },
    itemName_des: {
      type: String,
      default: "",
    },
    formData: {
      type: String,
      default: "",
    },



  },
// watch: {
//     '$route.query': {
//         async handler() {
//             await this.$nextTick(); // Warten, bis alles aktualisiert ist
//             this.fetchStatus();
//         },
//         deep: true,
//         immediate: true
//     }
// // },
// watch: {
//     '$route.query': {
//         async handler(newQuery, oldQuery) {
//             if (JSON.stringify(newQuery) !== JSON.stringify(oldQuery)) {
//                 await this.$nextTick();
//                 this.fetchStatus();
//             }
//         },
//         deep: true,
//         immediate: true
//     }
// },

  async mounted() {
        // if(!hasRight("view",CleanTable()))
        // {
        //     location.href="/no-rights";
        // }
            let cat_on_head = '';

        this.cat_on_head = this.checkCat();
        this.checkhasCreated();
        this.settings = await GetSettings();
        window.settings = this.settings;
            // console.log(this.datarows);
        // this.datarows = Object.values(this.datarows);
        this.$nextTick(() => {
        // this.fetchStatus();
        //this.fetchStatus()
    });
    //     if (this.table === "comments") {
    //     const rows = Array.isArray(this.datarows) ? this.datarows : Object.values(this.datarows || []);
    //     await Promise.all(
    //       rows.map(async (row) => {
    //         const done = await this.getChecked(row.id);
    //         this.checkedStatus, row.id, done;
    //       })
    //     );
    //   }
        // if(this.datarows['image_categories'] || this.datarows["blog_categories"])
        // {
        //   this.cat_on_head = "Kategorie";
        // }
           // console.log("WR:" + this.datarows);
                    // console.log("WS:", this.settings);

        // korrekt:
        if (this.settings.aftsetting && this.settings.aftsetting[table]) {
            // const aftsettingshead = "test";
            // const aftsetting = true;
            // const aftsettingvalue = GetFunc(table);
        }
        if (window.settings?.namealias) {
            this.namealias = window.settings.namealias;
        }
        if(window.settings?.descalias)
        {
            this.descalias = window.settings.descalias;
        }

    },
  data() {
    return {
      searchQuery: "test", // Lokale Suchanfrage
    //   rows: this.rows, // Props in lokale Daten kopieren
      ItemName: "Tabellen", // Kann von Backend oder durch andere Logik kommen.
      tablez: this.ucf(table_z), // Hier kannst du den Wert von tablez setzen
      checkedStatus: {},
        table: table.toLowerCase()  ,
         tableq: CleanTable(),
        // showRoute : route("admin.tables.show",table),
        settings: {},
        namealias: '',
        descalias: '',
        hasCreated: false,
        cat_on_head: '', // <-- hier definieren!
        userName: '',

    };
  },

    computed:{
        prename() {
            return this.namealias[this.table] ?? 'Name';
        },
        predesc() {
            return this.descalias[this.table] ?? 'Beschreibung';
        },
        isRightsReady() {
      return this.$isRightsReady; // Zugriff auf globale Methode
    },
    table_head() {
        return (Array.isArray(this.datarows) && this.datarows[0]?.admin_table_id) || typeof this.datarows[0]?.admin_table_id !== 'undefined' ? "Tabelle" : "";
      },
    hasRight() {
      return this.$hasRight; // Zugriff auf globale Methode
    },
    routeCreate() {
    return route( 'admin.tables.create', this.tableq);
  },
  showRoute() {
    return route('admin.tables.show', table);
  },
  createRoute()
  {
    return route('admin.tables.create', table);
  },
    formattedTableName() {
    //   return this.ucf(this.table_z);
    },

},

     methods: {

        onCheckedStatusUpdate(status) {
      this.checkedStatus = status
      console.log('Aktualisierter checkedStatus:', this.checkedStatus)
    },
    onSelectedChanged(value) {
    this.checkedStatus = value;
  },
        async MatchMaker(){
            const response = await axios.post('/api/chkcom');
        },
        async fetchStatus(){
            await this.$nextTick();

            if (!this.datarows || this.datarows.length === 0) {
                console.warn("Daten noch nicht verfügbar");
                return;
            }


            if (this.datarows && this.datarows.length > 0) {
        const ids = this.datarows.map(r => r.id);
        try {

        const response = await axios.get('/api/chkcom/');
        this.checkedStatus = response.data.success; // { [id]: true/false }
        // console.log("CS:" + JSON.stringify(this.checkedStatus,null,2));
        } catch (error) {
        console.error("Fehler beim Batch-Status laden:", error);
        }
            }
        },

        getMixId(row) {
        return this.table !== "comments" ? row.id : row.post_id;
      },
        checkCat() {
    let rows;

    // 1. Falls datarows ein JSON-String ist, versuche es zu parsen
    if (typeof this.datarows === 'string') {
        try {
            rows = JSON.parse(this.datarows);
        } catch (e) {
            console.error('Ungültiger JSON-String in datarows:', this.datarows);
            return null;
        }
    } else if (Array.isArray(this.datarows)) {
        rows = this.datarows;
    } else if (typeof this.datarows === 'object') {
        rows = Object.values(this.datarows);
    } else {
        return null;
    }

    // 2. Keine Daten? Sofort raus
    if (!rows.length) return null;

    // 3. Prüfen, ob mindestens ein Element eine Kategorie enthält
    const hasCategory = rows.some(row => {
        return row && typeof row === 'object' && !Array.isArray(row) &&
            ('image_categories' in row || 'blog_categories' in row);
    });
    rows.forEach((row, i) => {
        // console.log(`Row ${i}:`, row);
        // console.log('image_categories:', row?.image_categories);
        // console.log('blog_categories:', row?.blog_categories);
    });
    console.log("HSC:"  + hasCategory);

    // 4. Debug-Logging
    // rows.forEach(row => {
    //     console.log('Row:', row, 'Type:', typeof row, 'isArray:', Array.isArray(row));
    // });

    // 5. Ergebnis
    return hasCategory ? 'Kategorie' : null;
},

async getChecked(id) {
        try {
          const response = await axios.get(`/api/getCheckedDone/${id}`);
          return response.data.done === true;
        } catch (error) {
          console.error("Fehler beim Abrufen des Status:", error);
          return false;
        }
      },


        checkhasCreated(){
    axios.get(`/hasCreated/${this.table}`)
  .then(response => {
    this.hasCreated = response.data;
    return response.data;

  })
  .catch(error => {
    console.error('Fehler:', error);
  });
},
//                 async hasRight(right, table) {
//     // Überprüfe, ob die Rechte bereits geladen wurden
//    if (!this.rightsData[`${right}_${table}`] && table) {
//       // Wenn die Rechte noch nicht geladen wurden, lade sie
//       await this.checkRight(right, table);
//     }
//     // Wenn die Rechte nach dem Laden vorhanden sind, gib den Wert zurück
//     return this.rightsData[`${right}_${table}`] === 1; // Beispiel: Wenn das Recht '1' ist, erlauben wir den Zugriff
//   },

  async checkRight(right, table) {
    // Lade die Rechte für den User
    const value = await GetRights(right, table);
    // Speichere die geladenen Rechte im rightsData-Objekt
    this.$set(this.rightsData, `${right}_${table}`, value);
  },
      createNew() {
        alert("Neuer Eintrag erstellen");
      },
      removeItem(id) {
      this.items = this.items.filter((item) => item.id !== id);
    },
      editRow(id) {
        alert(`Eintrag mit ID ${id} bearbeiten`);
      },
    //   deleteRow(id) {
    //     if (confirm(`Eintrag mit ID ${id} wirklich löschen?`)) {
    //       this.rows = this.rows.filter((row) => row.id !== id);
    //     }
    //   },
      getEditRoute(table) {
        return `admin/tables/${table}/edit`;
    },
    ucf(str) {
      const arr = str?.split("_") || [];
      const na = arr.map(val => val.charAt(0).toUpperCase() + val.slice(1).toLowerCase());
      return na.join(" ");
    },

    },
    created() {
        let tableq = CleanTable();
    }
  });
  var tb_alt = "admin_table";
  const url = route('admin.tables.show', { table: tb_alt });
//console.log(url); // Prüfe, ob die URL korrekt ist
// table_q = ucf(table_z);
table = String(table_z).toLowerCase();

</script>

  <style>
    td {
    white-space: normal;        /* Textumbruch aktivieren */
    word-wrap: break-word;      /* für ältere Browser */
    overflow-wrap: break-word;  /* moderne Option */
  }
  .wwr{
    word-wrap: break-word;       /* für ältere Browser */
    overflow-wrap: break-word;   /* moderne Variante */
    white-space: normal;
  }
  .oton{
    background-color:rgb(50, 174, 179);
    border-radius: 50%;
    width:24px !important;
    height:24px;
    padding:0px 3px;
    color:#fff;
  }
  </style>
