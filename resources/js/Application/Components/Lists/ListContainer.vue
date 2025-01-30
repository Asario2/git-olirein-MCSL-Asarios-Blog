<template>
    <div>
        <div :class="[withinAccordion ? 'mx-1' : 'np-dl-outer-container']">
            <div class="np-dl-data-container">
                <div class="np-dl-title">
                    <div
                        class="flex flex-col md:flex-row items-center justify-between gap-4"
                    >
                        <div>
                            {{ title }}
                        </div>
                        <div>
                            <td>
                                <button-group>
                                    <input-icon-hyperlink
                                        v-if="editOn"
                                        :href="route(routeEdit,{table_alt:table_alt,id:datarows.id})"

                                        display_type="table"
                                    >
                                    <template #icon>
                                        <button v-tippy="{ content: createDescription }" class="flex items-center">
                                            <icon-plus-circle class="w-6 h-6 mr-2" />
                                            <strong>Erstellen</strong>
                                        </button>
                                    </template>

                                    </input-icon-hyperlink>
                                    <slot name="button"></slot>
                                </button-group>
                            </td>
                        </div>
                    </div>
                </div>

                <!-- Liste der Fehler -->
                <error-list :errors="errors" />

                <div class="mb-4" v-if="searchFilter">
                    <div class="my-6 flex justify-between items-center">
                        <search-filter
                            v-model="form.search"
                            class="w-full"
                            :searchText="searchText"
                            @reset="reset"
                        >
                        </search-filter>
                    </div>
                </div>
                <table class="np-dl-table">
                    <thead class="np-dl-thead">
                        <slot name="header"></slot>
                    </thead>

                    <tbody  v-if="numberOfRows > 0">
                        <tr
                            v-for="datarow in datarows.data"
                            :key="datarow[rowId]"
                            class="np-dl-tr"
                        >
                            <slot name="datarow" :datarow="datarow"></slot>




                            <td  class="np-dl-td-normal">
                                <ButtonGroup>
                                    <a v-if="editOn"
                                        :href="route(routeEdit, {table_alt:table_alt,id:datarow.id})"

                                    >

                                            <i class='fa-solid fa-pencil w-6 h-6' v-tippy></i>
                                            <tippy>{{ editDescription }}</tippy>


                                </a>
                                </ButtonGroup>
                            </td>

                            <td
                                v-if="deleteOn"
                                class="np-dl-td-edit"
                                @click.prevent="deleteDataRow(table_alt)"
                            >
                            <i class='fa-solid fa-trash-can w-6 h-6' v-tippy></i>
                                <tippy>{{ deleteDescription }}</tippy>
                            </td>
                            <td
                                v-if="showOn"
                                class="np-dl-td-edit"
                                @click.prevent="showDataRow(datarow[rowId])"
                            >
                                <icon-eye class="w-6 h-6" v-tippy />
                                <tippy>{{ showDescription }}</tippy>
                            </td>
                        </tr>
                    </tbody>
                </table>

                <pagination :links="datarows.links"  v-if="numberOfRows > 0" />
            </div>
            <div v-if="numberOfRows == 0" class="np-dl-td-no-entries">
                <alert type="info">
                    {{ noEntries }}
                </alert>
            </div>
        </div>
    </div>
    <!-- ENDS Anzeige der Liste -->
</template>
<script>
const path = window.location.pathname; // Gibt "/admin/tables/show/Example" zurück
const segments = path.split('/'); // Teilt den Pfad in Segmente auf
var lastSegment = segments[segments.length - 1];
if (!isNaN(Number(lastSegment))) {
    lastSegment = segments[segments.length - 2];
}
if(lastSegment == "tables")
{
    lastSegment = '';
}
var tablez = lastSegment;
console.log(lastSegment);
var table_z = tablez;


import { Link } from '@inertiajs/vue3'

import SearchFilter from '@/Application/Components/Lists/SearchFilter.vue'
import Pagination from '@/Application/Components/Lists/Pagination.vue'

// import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome';
// import { library } from '@fortawesome/fontawesome-svg-core';
// import { faEdit, faTimes } from '@fortawesome/free-solid-svg-icons';
// import FontAwesomeIcon from '@/Application/Components/fa.vue'
import ButtonGroup from '@/Application/Components/Form/ButtonGroup.vue'
import InputIconHyperlink from '@/Application/Components/Form/InputIconHyperlink.vue'

import ErrorList from '@/Application/Components/Form/ErrorList.vue'
import IconDelete from '@/Application/Components/Icons/Delete.vue'
import IconPlusCircle from '@/Application/Components/Icons/PlusCircle.vue'
import IconPencil from '@/Application/Components/Icons/Pencil.vue'
import IconEye from '@/Application/Components/Icons/Eye.vue'


import Alert from '@/Application/Components/Content/Alert.vue'

import mapValues from 'lodash/mapValues'
import pickBy from 'lodash/pickBy'
import throttle from 'lodash/throttle'

// import { createApp } from 'vue';           // Importiere die `createApp`-Funktion von Vue
// import App from './components/App.vue';    // Importiere die Hauptkomponente `App.vue`
// import './assets/main.css';                // Optional: Importiere eine globale CSS-Datei

// const app = createApp(App);               // Erstelle die Vue-Anwendung mit `App.vue` als Einstiegskomponente
// app.mount('#app');

export default {
    name: "Contents_Lists_ListContainer",

    components: {
        Link,
        SearchFilter,
        Pagination,
        ButtonGroup,
        InputIconHyperlink,
        ErrorList,
        IconPlusCircle,
        IconPencil,
        IconDelete,
        IconEye,
        Alert
    },
    //
    emits: ['list-container-search-reset'],
    //
    props: {
        withinAccordion: {
            type: Boolean,
            default: false
        },
        title: {
            type: String,
            required: false
        },
        rowId: {
            type: String,
            default: 'id'
        },
        datarows: {
            type: [Object, Array],
            default: () => []
        },
        noEntries: {
            type: String,
            default: 'Es wurden keine Datensätze gefunden.'
        },
        filters: {
            type: [Object, Array],
            default: () => []
        },
        routeIndex: {
            type: String,
            default: null
        },
        routeParamName: {
            type: [Number, String],
            default: null
        },
        routeParamValue: {
            type: [Number, String],
            default: null
        },
        searchFilter: {
            type: Boolean,
            default: true
        },
        searchText: {
            type: String,
            default: 'Hier kannst du den Suchbegriff eingeben'
        },
        searchValue: {
            type: String,
            default: null
        },
        showOn: {
            type: Boolean,
            default: false
        },
        routeShow: {
            type: String
        },
        editOn: {
            type: Boolean,
            default: false
        },
        routeEdit: {
            type: String
        },
        createOn: {
            type: Boolean,
            default: false
        },
        routeCreate: {
            type: String
        },
        deleteOn: {
            type: Boolean,
            default: false
        },
        routeDelete: {
            type: String
        },
        showDescription: {
            type: String,
            default: 'Daten anzeigen'
        },
        editDescription: {
            type: String,
            default: 'Daten ändern'
        },
        deleteDescription:{
            type: String,
            default: 'Daten Löschen'
        },
        errors: {
            type: Object,
            default: () => ({})
        },
        table_alt: {
            type: String,
            default:table_z,
        },
        tablez: {
            type: String,
            required: true,
        },
    },
    //
    data () {
        return {
            form: {
                search: this.filters.search
            },


        }
    },
    //
    created () {
        this.form.search = this.searchValue
    },
    //
    computed: {
    numberOfRows() {
      if (!this.datarows || typeof this.datarows !== 'object') {
        return 0;
      }
      return Array.isArray(this.datarows)
        ? this.datarows.length
        : Object.keys(this.datarows).length;
    },
    formattedTableName() {
      return this.ucf(this.table); // Hier wird die Methode `ucf` aufgerufen und das `table`-Datenfeld übergeben
    }
},
    //
    // watch: {
    //     form: {
    //         handler: throttle(function () {
    //             let query = pickBy(this.form)
    //             //
    //             let paramName = null
    //             let paramValue = null
    //             //
    //             if (this.routeParamName && this.routeParamValue) {
    //                 paramName = this.routeParamName
    //                 paramValue = this.routeParamValue
    //             }
    //             //
    //             if (this.searchFilter) {
    //                 if (paramName && paramValue) {
    //                     this.$inertia.get(
    //                         this.route(this.routeIndex),
    //                         {
    //                             search: this.form.search,
    //                             [paramName]: paramValue,
    //                             page: 1
    //                         },
    //                         {
    //                             preserveState: true
    //                         }
    //                     )
    //                 }
    //                 if (!paramName || !paramValue) {
    //                     this.$inertia.get(
    //                         this.route(
    //                             this.routeIndex,
    //                             Object.keys(query).length
    //                                 ? query
    //                                 : { remember: 'forget' }
    //                         ),
    //                         {
    //                             search: this.form.search,
    //                             page: 1
    //                         },
    //                         {
    //                             preserveState: true
    //                         }
    //                     )
    //                 }
    //             }
    //         }, 150),
    //         deep: true
    //     }
    // },
    watch: {
  form: {
    handler: throttle(function () {
      let query = pickBy(this.form);
      let paramName = 'table_alt';
      const path = window.location.pathname; // Gibt "/admin/tables/show/Example" zurück
      const segments = path.split('/'); // Teilt den Pfad in Segmente auf
      const lastSegment = segments[segments.length - 1];
      let paramValue = lastSegment;
      let table_alt = lastSegment;
      //   let paramValue = document.getElementById("tb_alt").value;

      // Dynamische Parameter für die Route
      if (this.routeParamName && this.routeParamValue) {
        paramName = this.routeParamName; // z.B. 'table_alt'
        paramValue = this.routeParamValue; // Der Wert, z.B. der Tabellenname
      }

      // Wenn ein Filter für die Suche existiert
      if (this.searchFilter) {
        // Wenn der dynamische Parameter existiert, Route mit dem Parameter aufrufen
        if (paramName && paramValue) {

          this.$inertia.get(


            this.route(this.routeIndex, { [paramName]: paramValue }),// Ziggy erstellt die Route
            {
              search: this.form.search,
              [paramName]: paramValue,  // Dynamischer Parameter
              page: 1
            },
            {
              preserveState: true
            }
          );
        }
        // Wenn kein dynamischer Parameter existiert, normale Route ohne Parameter
        if (!paramName || !paramValue) {
          this.$inertia.get(
            this.route(
              this.routeIndex,
              Object.keys(query).length
                ? query
                : { remember: 'forget' } // Query-Parameter für Filter
            ),
            {
              search: this.form.search,
              page: 1
            },
            {
              preserveState: true
            }
          );
        }
      }
    }, 150),
    deep: true
  }
},

    //
    methods: {
        reset () {
            this.form = mapValues(this.form, () => null)
            this.$emit('list-container-search-reset')
        },
        editDataRow (id) {
            this.$inertia.get(this.route(this.routeEdit,table_alt, id))
        },
        //
        showDataRow (id) {
            this.$inertia.get(this.route(this.routeShow, id))
        },

    }
}
</script>


