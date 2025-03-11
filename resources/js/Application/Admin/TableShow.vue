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
          :filters="filters"
          search-filter="true"
          search-text="Suche nach Inhalten anhand ihres Namens oder ihrer Beschreibung."
          :edit-on="true"
          route-edit="admin.tables.edit"
          :create-on="true"
          :route-create="routeCreate"
          :delete-on="true"
          route-delete="admin.tables.destroy"
          >
          <template #header>
            <tr>
              <th class="np-dl-th-normal">ID</th>
              <th class="np-dl-th-normal">Name</th>
              <th class="np-dl-th-normal">Beschreibung</th>
              <th class="np-dl-th-normal" colspan="2"></th>
            </tr>
          </template>
          <template v-slot:datarow="data" :items="items" @update-list="removeItem">
              <td class="np-dl-td-normal">{{ data.datarow.id }}</td>
              <td class="np-dl-td-normal">{{ data.datarow.name }}</td>
              <td class="np-dl-td-normal">{{ data.datarow.description }}</td>
          </template>
        </list-container>
      </section>
    </layout>
  </template>
  <input type="hidden" id="tb_alt" value="{ table_alt }" />
  <script>
  const path = window.location.pathname; // Gibt "/admin/tables/show/Example" zurück
const segments = path.split('/'); // Teilt den Pfad in Segmente auf
const lastSegment = segments[segments.length - 1];
let table_z = lastSegment;
let table_alt = table_z;
let table = table_z.toLowerCase();

  import { defineComponent } from "vue";
  import Layout from "@/Application/Admin/Shared/Layout.vue";
  import Breadcrumb from "@/Application/Components/Content/Breadcrumb.vue";
  import ListContainer from "@/Application/Components/Lists/ListContainer.vue";

  export default defineComponent({
    name: "AdminTableShow",
    components: {
      Layout,
      Breadcrumb,
      ListContainer,
    },
    props: {
    applicationName: {
    type: String,
    required: true,
    default: "Administrator-Anwendung",
  },
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
  data() {
    return {
      searchQuery: "test", // Lokale Suchanfrage
    //   rows: this.rows, // Props in lokale Daten kopieren
      ItemName: "Tabellen", // Kann von Backend oder durch andere Logik kommen.
       // Initialisieren, falls leer

    //    routeCreate:,
      tablez: this.ucf(table_z), // Hier kannst du den Wert von tablez setzen
        table: table.toLowerCase()  ,
        // showRoute : route("admin.tables.show",table),

    };
  },
  computed: {

    routeCreate() {
    return route( 'admin.tables.create', table);
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
    }
  },

    methods: {
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
      const arr = str.split("_");
      const na = arr.map(val => val.charAt(0).toUpperCase() + val.slice(1).toLowerCase());
      return na.join(" ");
    },

    },
  });
  var tb_alt = "admin_table";
  const url = route('admin.tables.show', { table: tb_alt });
//console.log(url); // Prüfe, ob die URL korrekt ist
// table_q = ucf(table_z);
table = String(table_z).toLowerCase();

</script>

  <style>
  /* Custom Styles if needed */
  </style>
