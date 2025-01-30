<template>
    <layout>
        <template #header>
            <!-- <breadcrumb
                :application-name="$page.props.applications.app_admin_name"
                :current="
                    rows.id > 0 ? '{ItemName} ändern' : '{ItemName} erstellen'
                "
                :breadcrumbs="{
                    'Liste der Tabellen': route('admin.tables.index'),
                    'Tabelle {{ tablez }}': route('admin.tables.show',{table_alt:table_alt,id:rows.id}),
                }"
            ></breadcrumb> -->
            <breadcrumb :breadcrumbs="breadcrumbs" :current="'Eintrag ' + editstate "></breadcrumb>
        </template>

        <section-form>
            <template #title>{ItemName}-Daten</template>
            <template #description
                >Hier kannst du alle Daten {ItemName_des} ändern
                <!-- Loading -->
                <input-loading
                    :loading="loading"
                    :loading-text="loadingText"
                ></input-loading>
                <!-- ENDS Loading -->
            </template>

            <template #form>
                <!-- Liste der Fehler -->
                <error-list :errors="errors" />

                <input-subtitle>Daten</input-subtitle>
                <template>
                <form @submit.prevent="submitForm">
                    <div v-for="field in formFields" :key="field.name">
                    <label :for="field.name">{{ field.label }}</label>
                    <div v-if="field && field.type == 'text'">
                        <!-- Render das Eingabefeld für den 'text'-Typ -->
                        <input type="text" :name="field.name" v-model="formData[field.name]" />
                    </div>
                    </div>
                    <button type="submit">Absenden</button>
                </form>
                </template>
<!-- {{ formData }} -->
   </template>

            <template #actions>
                <!-- Befehle -->
                <button-group>
                    <input-danger-button
                        v-if="table.id > 0"
                        type="button"
                        @click.prevent="confirmTableDeletion"
                    >
                        {ItemName} löschen
                    </input-danger-button>
                    <smooth-scroll href="#app-layout-start" v-if="table.id > 0">
                        <input-button
                            type="button"
                            @click.prevent="updateTableData"
                        >
                            {ItemName} ändern
                        </input-button>
                    </smooth-scroll>
                    <smooth-scroll href="#app-layout-start" v-if="table.id == 0">
                        <input-button
                            type="button"
                            @click.prevent="createTableData"
                        >
                            {ItemName} erstellen
                        </input-button>
                    </smooth-scroll>
                </button-group>
                <!-- ENDS Befehle -->
            </template>
        </section-form>

        <!-- Bestätigungsmodal zum Löschen -->
        <dialog-modal
            :show="confirmingTableDeletion"
            @close="close_confirmingTableDeletion"
        >
            <template #title> {ItemName} löschen </template>

            <template #content>
                Bist du sicher, dass du diesen {ItemName} löschen möchtest?
            </template>

            <template #footer>
                <button-group>
                    <input-button @click="close_confirmingTableDeletion">
                        Zurück
                    </input-button>

                    <input-danger-button @click="deleteTable">
                        {ItemName} jetzt löschen
                    </input-danger-button>
                </button-group>
            </template>
        </dialog-modal>
    </layout>
</template>

<script>
const path = window.location.pathname; // Gibt "/admin/tables/show/Example" zurück
const segments = path.split('/'); // Teilt den Pfad in Segmente auf
const lastSegment = segments[segments.length - 2];
const id = segments[segments.length - 1];
const table = segments[segments.length - 2];
let table_z = lastSegment;
let table_alt = table_z;

import { defineComponent } from "vue";

import Layout from "@/Application/Admin/Shared/Layout.vue";
import Breadcrumb from "@/Application/Components/Content/Breadcrumb.vue";

import SmoothScroll from "@/Application/Components/SmoothScroll.vue";

import PageTitle from "@/Application/Components/Content/PageTitle.vue";

import SectionForm from "@/Application/Components/Content/SectionForm.vue";
import SectionBorder from "@/Application/Components/Content/SectionBorder.vue";

import ButtonGroup from "@/Application/Components/Form/ButtonGroup.vue";
import InputButton from "@/Application/Components/Form/InputButton.vue";
import InputDangerButton from "@/Application/Components/Form/InputDangerButton.vue";

import InputLoading from "@/Application/Components/Form/InputLoading.vue";

import ErrorList from "@/Application/Components/Form/ErrorList.vue";
import InputSubtitle from "@/Application/Components/Form/InputSubtitle.vue";
import InputGroup from "@/Application/Components/Form/InputGroup.vue";
import InputContainer from "@/Application/Components/Form/InputContainer.vue";
import InputLabel from "@/Application/Components/Form/InputLabel.vue";
import InputElement from "@/Application/Components/Form/InputElement.vue";
import InputCheckbox from "@/Application/Components/Form/InputCheckbox.vue";
import InputSelect from "@/Application/Components/Form/InputSelect.vue";
import InputTextarea from "@/Application/Components/Form/InputTextarea.vue";
import InputHtml from "@/Application/Components/Form/InputHtml.vue";
import InputError from "@/Application/Components/Form/InputError.vue";
import { throttle } from 'lodash';
import DialogModal from "@/Application/Components/DialogModal.vue";

import Alert from "@/Application/Components/Content/Alert.vue";

export default defineComponent({
    name: "Admin_TableForm",

    components: {
        Layout,
        Breadcrumb,
        SmoothScroll,
        PageTitle,
        SectionForm,
        SectionBorder,
        ButtonGroup,
        InputButton,
        InputDangerButton,
        InputLoading,
        ErrorList,
        InputSubtitle,
        InputGroup,
        InputContainer,
        InputLabel,
        InputElement,
        InputCheckbox,
        InputSelect,
        InputTextarea,
        InputHtml,
        InputError,
        DialogModal,
        Alert,
    },

    props: {
        table: {
            type: Object,
            default: () => ({}),
        },
        editstate: {
            type: String,
            default:''
        },
        fields:{
            type: Array,
            default: [],
        },
        table_authors: {
            type: Object,
            default: () => ({}),
        },
        table_categories: {
            type: Object,
            default: () => ({}),
        },
        table_images: {
            type: Object,
            default: () => ({}),
        },
        errors: {
            type: Object,
            default: () => ({}),
        },
        table_alt: {
            type: String,
            default:table_z,
        },
        tablez: {
            type: String,
            default:table_z,
        },
        rows:{
            type:Array,
            default: [],
        },
        breadcrumbs: {
            type: Array,
            required: true,
        },
    },

    data() {
        return {
            formData: {},
            formFields: [
            { name: '', type: '' }
        ],
            fields: [],
            loading: false,
            loadingText: null,
            confirmingTableDeletion: false,
            form: {},
        };
    },
    computed: {
        filters() {
            return this.$page.props.filters;
        },
        datarows() {
            return this.$page.props.datarows;
        },
        rows() {
            return this.$page.props.rows;
        },
        table_alt() {
            return this.$page.props.table_alt;
        },
        tablez() {
            return this.$page.props.tablez;
        },
        tables() {
            return this.$page.props.tables;
        },
        formData() {
            return this.$page.props.formData;
        },
        formFields() {
            return this.$page.props.formFields;
        },
    },
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

                if (this.routeParamName && this.routeParamValue) {
                    paramName = this.routeParamName;
                    paramValue = this.routeParamValue;
                }

                if (this.searchFilter) {
                    if (paramName && paramValue) {
                        this.$inertia.get(
                            this.route(this.routeIndex, { [paramName]: paramValue }),
                            {
                                search: this.form.search,
                                [paramName]: paramValue,
                                page: 1
                            },
                            {
                                preserveState: true
                            }
                        );
                    }
                    if (!paramName || !paramValue) {
                        this.$inertia.get(
                            this.route(
                                this.routeIndex,
                                Object.keys(query).length
                                    ? query
                                    : { remember: 'forget' }
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

    methods: {
        confirmTableDeletion() {
            this.confirmingTableDeletion = true;
        },
        async fetchFormData() {
            try {
                const response = await axios.get(route("GetTableForm", [table, id]));
                this.formFields = response.data.fields;
                console.log("tables/form-data/"+ table +"/" + id);
                console.log(response.data);

                this.formFields.forEach(field => {
                    this.formData[field.name] = "";
                });
            } catch (error) {
                console.error("Fehler beim Abrufen der Formulardaten:", error);
            }
        },
        submitForm() {
            console.log(this.formData); // Formular-Daten absenden
        },
        deleteTable() {
            this.confirmingTableDeletion = false;
            this.loading = true;
            this.loadingText = "Der {ItemName} wird gelöscht!";
            this.$inertia.delete(
                this.route("admin.table.delete", this.table.id),
                {
                    onSuccess: () => {
                        this.loading = false;
                    },
                    onError: () => {
                        this.loading = false;
                    },
                }
            );
        },

        close_confirmingTableDeletion() {
            this.confirmingTableDeletion = false;
        },

        createTableData() {
            this.loading = true;
            this.loadingText = "Der neue {ItemName} wird gespeichert!";
            this.$inertia.post(this.route("admin.table.store"), this.form, {
                onSuccess: () => {
                    this.loading = false;
                },
                onError: () => {
                    this.loading = false;
                },
            });
        },

        updateTableData() {
            this.loading = true;
            this.loadingText =
                "Die geänderten Daten des {ItemName} werden jetzt gespeichert!";
            this.$inertia.put(
                this.route("admin.table.update", this.table.id),
                this.form,
                {
                    onSuccess: () => {
                        this.loading = false;
                    },
                    onError: () => {
                        this.loading = false;
                    },
                }
            );
        },

        selectTableImage(id) {
            console.log("selectTableImage id:", id);
            this.form.table_image_id = id;
        },
    },
    mounted() {
        console.log(this.field);
        this.fetchFormData();
    },
});
</script>
