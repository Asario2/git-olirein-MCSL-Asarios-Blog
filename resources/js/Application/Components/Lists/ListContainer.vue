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
                            <button-group>
                                <input-icon-hyperlink
                                    v-if="createOn"
                                    :href="routeCreate"
                                    display_type="table"
                                >
                                    <template #icon>
                                        <icon-plus-circle
                                            class="button_icon"
                                        ></icon-plus-circle>
                                        Erstelle
                                    </template>
                                </input-icon-hyperlink>
                                <slot name="button"></slot>
                            </button-group>
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
                    <tbody v-if="numberOfRows > 0">
                        <tr
                            v-for="datarow in datarows.data"
                            :key="datarow[rowId]"
                            class="np-dl-tr"
                        >
                            <slot name="datarow" :datarow="datarow"></slot>
                            <td
                                v-if="editOn"
                                class="np-dl-td-edit"
                                @click.prevent="editDataRow(datarow[rowId])"
                            >
                                <icon-pencil class="w-6 h-6" v-tippy />
                                <tippy>{{ editDescription }}</tippy>
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

                <pagination :links="datarows.links" v-if="numberOfRows > 0" />
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
import { Link } from "@inertiajs/vue3";

import SearchFilter from "@/Application/Components/Lists/SearchFilter.vue";
import Pagination from "@/Application/Components/Lists/Pagination.vue";

import ButtonGroup from "@/Application/Components/Form/ButtonGroup.vue";
import InputIconHyperlink from "@/Application/Components/Form/InputIconHyperlink.vue";

import ErrorList from "@/Application/Components/Form/ErrorList.vue";

import IconPlusCircle from "@/Application/Components/Icons/PlusCircle.vue";
import IconPencil from "@/Application/Components/Icons/Pencil.vue";
import IconEye from "@/Application/Components/Icons/Eye.vue";

import Alert from "@/Application/Components/Content/Alert.vue";

import mapValues from "lodash/mapValues";
import pickBy from "lodash/pickBy";
import throttle from "lodash/throttle";

const path = window.location.pathname; // Gibt "/admin/tables/show/Example" zurück
const segments = path.split("/"); // Teilt den Pfad in Segmente auf
const table = segments[segments.length - 1];
console.log("Table:", table);


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
        IconEye,
        Alert,
    },
    //
    emits: ["list-container-search-reset"],
    //
    props: {
        withinAccordion: {
            type: Boolean,
            default: false,
        },
        title: {
            type: String,
            required: false,
        },
        rowId: {
            type: String,
            default: "id",
        },
        datarows: {
            type: [Object, Array,String],
            default: () => [],
        },
        noEntries: {
            type: String,
            default: "Es wurden keine Datensätze gefunden.",
        },
        filters: {
            type: [Object, Array],
            default: () => [],
        },
        routeIndex: {
            type: String,
            default: null,
        },
        routeParamName: {
            type: [Number, String],
            default: "table",
        },
        routeParamValue: {
            type: [Number, String],
            default: table,
        },
        searchFilter: {
            type: Boolean,
            default: true,
        },
        searchText: {
            type: String,
            default: "Hier kannst du den Suchbegriff eingeben",
        },
        searchValue: {
            type: String,
            default: null,
        },
        showOn: {
            type: Boolean,
            default: false,
        },
        routeShow: {
            type: String,
        },
        editOn: {
            type: Boolean,
            default: false,
        },
        routeEdit: {
            type: String,
        },
        createOn: {
            type: Boolean,
            default: false,
        },
        routeCreate: {
            type: String,
            default: route('admin.tables.create', table),
        },
        showDescription: {
            type: String,
            default: "Daten anzeigen",
        },
        editDescription: {
            type: String,
            default: "Daten ändern",
        },
        errors: {
            type: Object,
            default: () => ({}),
        },
    },
    //
    data() {
        return {
            form: {
                search: this.filters.search,
            },
        // routeCreate: route('admin.tables.create', table),
        };
    },
    //
    created() {
        this.form.search = this.searchValue;
    },
    //
    computed: {
        numberOfRows() {
            //console.log('numberOfRows')
            if (Array.isArray(this.datarows.data)) {
                return this.datarows.data.length;
            } else if (typeof this.datarows === "object") {
                return Object.keys(this.datarows.data).length;
            } else {
                return 0;
            }
        },
    },
    //
    watch: {
        form: {

    handler: throttle(function () {
        let query = pickBy(this.form);
        let paramName = null
        let paramValue = null
        if (this.routeParamName && this.routeParamValue) {
            paramName = this.routeParamName;
            paramValue = this.routeParamValue;
        }

        let url = this.routeIndex;

        // Prüfe, ob routeIndex bereits eine URL ist
        if (!(typeof url === "string" && url.startsWith("http"))) {
            url = this.route(this.routeIndex, Object.keys(query).length ? query : { remember: "forget" });
        }

        if (this.searchFilter) {
            if (paramName && paramValue) {
                this.$inertia.get(url, {
                    search: this.form.search,
                    [paramName]: paramValue,
                    page: 1,
                }, {
                    preserveState: true,
                });
            } else {
                this.$inertia.get(url, {
                    search: this.form.search,
                    page: 1,
                }, {
                    preserveState: true,
                });
            }
        }
    }, 150),
    deep: true,
}

    },
    //
    methods: {
        reset() {
            this.form = mapValues(this.form, () => null);
            this.$emit("list-container-search-reset");
        },
        editDataRow(id) {
            const path = window.location.pathname; // Gibt "/admin/tables/show/Example" zurück
            const segments = path.split("/"); // Teilt den Pfad in Segmente auf
            const table = segments[segments.length - 1];
            this.$inertia.get(this.route(this.routeEdit, [id, table]));
        },
        //
        showDataRow(id) {
            this.$inertia.get(this.route(this.routeShow, id));
        },
    },
};
</script>
