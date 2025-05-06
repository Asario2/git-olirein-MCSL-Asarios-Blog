<template>
    <div>
        <div :class="[withinAccordion ? 'mx-1' : 'np-dl-outer-container']">
            <div class="np-dl-data-container">
                <!-- Titel und Button-Gruppe -->
                <div class="np-dl-title">
                    <div class="flex flex-col md:flex-row items-center justify-between gap-4">
                        <div>{{ title }}</div>
                        <div>
                            <button-group v-if="hasRight('add',tablex)">
                                <input-icon-hyperlink v-if="createOn" :href="routeCreate" display_type="table">
                                    <template #icon >
                                        <icon-plus-circle class="button_icon" />
                                        Erstelle
                                    </template>
                                </input-icon-hyperlink>
                                <slot name="button" />
                            </button-group>
                        </div>
                    </div>
                </div>

                <!-- Fehleranzeige -->
                <error-list :errors="errors" />

                <!-- Suchfeld -->
                <div v-if="searchFilter" class="mb-4">
                    <div class="my-6 flex justify-between items-center">
                        <search-filter
                            v-model="form.search"
                            class="w-full"
                            :searchText="searchText"
                            @reset="reset"
                        />
                    </div>
                </div>
                <!-- Tabelle -->
                <table class="np-dl-table">
                    <thead class="np-dl-thead">
                        <slot name="header" />
                    </thead>
                    <tbody v-if="numberOfRows > 0">
                        <tr v-for="datarow in datarows.data" :key="datarow[rowId]" class="np-dl-tr">
                            <slot name="datarow" :datarow="datarow" />
                            <td v-if="datarow.created_at && hasRight('view', datarow.full_name)" class="np-dl-td-normal">
                               {{ new Date(datarow.created_at).toLocaleString('de-DE', {
                                    day: '2-digit', month: '2-digit', year: 'numeric',
                                    hour: '2-digit', minute: '2-digit', second: '2-digit'
                                }) }}
                            </td>
                            <td v-if="hasRight('edit', datarow.full_name) && hasRight('view', datarow.full_name)"
                                class="np-dl-td-edit"
                                @click.prevent="editDataRow(datarow[rowId])">
                                <icon-pencil class="w-6 h-6" v-tippy />
                                <tippy>{{ editDescription }}</tippy>
                            </td>
                            <td v-else-if="hasRight('view',datarow.full_name)"
                            class="np-dl-td-edit"></td>
                            <td v-if="hasRight('delete', datarow.full_name) && hasRight('view', datarow.full_name)"
                                class="np-dl-td-edit"
                                @click="deleteDataRow(datarow[rowId])">
                                <icon-trash class="w-6 h-6" v-tippy />
                                <tippy>{{ deleteDescription }}</tippy>
                            </td>
                            <td v-else-if="hasRight('view',datarow.full_name)"
                            class="np-dl-td-edit"></td>
                        </tr>
                    </tbody>
                </table>

                <!-- Pagination -->
                <pagination :links="datarows.links" v-if="numberOfRows > 0" />
                <div v-else class="np-dl-td-no-entries">
                    <alert type="info">{{ noEntries }}</alert>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import { Link } from "@inertiajs/vue3";
import { toastBus } from '@/utils/toastBus';
import SearchFilter from "@/Application/Components/Lists/SearchFilter.vue";
import Pagination from "@/Application/Components/Lists/Pagination.vue";
import ButtonGroup from "@/Application/Components/Form/ButtonGroup.vue";
import InputIconHyperlink from "@/Application/Components/Form/InputIconHyperlink.vue";
import ErrorList from "@/Application/Components/Form/ErrorList.vue";
import IconPlusCircle from "@/Application/Components/Icons/PlusCircle.vue";
import IconPencil from "@/Application/Components/Icons/Pencil.vue";
import IconTrash from "@/Application/Components/Icons/Trash.vue";
import Alert from "@/Application/Components/Content/Alert.vue";
import { GetRights,CleanTable } from '@/helpers';
import mapValues from "lodash/mapValues";
import pickBy from "lodash/pickBy";
import throttle from "lodash/throttle";
import { hasRight } from "@/utils/rights";

export default {
    name: "Contents_Lists_ListContainer",
    components: {
        Link,
        toastBus,
        SearchFilter,
        Pagination,
        ButtonGroup,
        InputIconHyperlink,
        ErrorList,
        IconPlusCircle,
        IconPencil,
        IconTrash,
        Alert,
    },
    props: {
        items: {},
        withinAccordion: { type: Boolean, default: false },
        title: { type: String, required: false },
        rowId: { type: String, default: "id" },
        datarows: { type: [Object, Array, String], default: () => [] },
        datarow: { type: [Object, Array, String], default: () => [] },
        noEntries: { type: String, default: "Es wurden keine Datensätze gefunden." },
        filters: { type: [Object, Array], default: () => [] },
        routeIndex: { type: String, default: null },
        routeParamName: { type: [Number, String], default: "table" },
        routeParamValue: { type: [Number, String], default: null },
        searchFilter: { type: Boolean, default: true },
        searchText: { type: String, default: "Hier kannst du den Suchbegriff eingeben" },
        searchValue: { type: String, default: null },
        showOn: { type: Boolean, default: false },
        routeShow: { type: String },
        routeDelete: { type: String },
        deleteOn: { type: Boolean, default: false },
        editOn: { type: Boolean, default: false },
        routeEdit: { type: String },
        createOn: { type: Boolean, default: false },
        deleteDescription: { type: String, default: "Datensatz löschen" },
        editDescription: { type: String, default: "Daten ändern" },
        errors: { type: Object, default: () => ({}) },
        tableq: { type: String },
    },
    async mounted() {
  if (!this.datarow?.full_name) {
    this.datarow.full_name = CleanTable();
  }
},
    data() {
        return {
            form: { search: this.filters.search },
            rightsData: {},
            rightsReady: false,
            routeCreate: "/admin/tables/create/" + this.tableq,
            routeDelete: "/admin/tables/delete/" + this.tableq + "/",
        };
    },
    created() {
        this.form.search = this.searchValue;
    },
    computed: {
        numberOfRows() {
            if (Array.isArray(this.datarows.data)) {
                return this.datarows.data.length;
            } else if (typeof this.datarows === "object") {
                return Object.keys(this.datarows.data || {}).length;
            } else {
                return 0;
            }
        },
        isRightsReady() {
            return this.$isRightsReady;
        },
        hasRight() {
      return this.$hasRight; // Zugriff auf globale Methode
    },
    },
    watch: {
        form: {
            handler: throttle(function () {
                let query = pickBy(this.form);
                let url = this.routeIndex;

                if (!(typeof url === "string" && url.startsWith("http"))) {
                    url = this.route(this.routeIndex, Object.keys(query).length ? query : { remember: "forget" });
                }

                if (this.searchFilter) {
                    const params = {
                        search: this.form.search,
                        page: 1,
                        ...(this.routeParamName && this.routeParamValue && {
                            [this.routeParamName]: this.routeParamValue,
                        }),
                    };
                    this.$inertia.get(url, params, { preserveState: true });
                }
            }, 0),
            deep: true,
        },
    },
    methods: {
        reset() {
            this.form = mapValues(this.form, () => null);
            this.$emit("list-container-search-reset");
        },
        async hasRight(right, table) {
            if (!this.rightsData[`${right}_${table}`] && table) {
                await this.checkRight(right, table);

            }
            return this.rightsData[`${right}_${table}`] === 1;
        },
        async checkRight(right, table) {
            const value = await GetRights(right, table);
            this.rightsData[`${right}_${table}`] = value;

        },
        deleteDataRow(id) {
            if (confirm("Wollen Sie diesen Beitrag wirklich löschen?")) {
                axios.delete(this.routeDelete + id)
                .then(response => {
                    toastBus.emit('toast', response.data); // ← erwartet { status: "...", message: "..." }
                    this.$emit("deleted");

                         this.$inertia.reload();
                    })
                    .catch(error => console.error("Fehler beim Löschen:", error));
            }
        },
        editDataRow(id) {
            this.$inertia.visit(`/admin/tables/edit/${id}/${this.tableq}`);
        },
    },

};
</script>
