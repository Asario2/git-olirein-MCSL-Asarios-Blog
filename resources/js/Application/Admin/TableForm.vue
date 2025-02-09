<!-- <template> -->
<template>
    <layout>
        <template #header>
            <breadcrumb
                :breadcrumbs="breadcrumbs"
                :current="'Eintrag ' + editstate"
            ></breadcrumb>
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
                <template style="display: inline-block">
                    <div>
                        <!-- <pre>{{ formData }}</pre>
                        <pre>{{ this.formFields }}</pre> -->

                        <input-group>
                            <form @submit.prevent="submitForm">
                                <div
                                    class="maxx grid grid-cols-1 lg:grid-cols-2 mb-2 gap-2 lg:gap-x-6 mt-2"
                                >
                                    <span
                                        v-for="(field, key) in this.formFields"
                                        :key="key"
                                    >
                                        {{ field.type }}
                                        <!-- Dynamische Felder basierend auf Feldtyp -->
                                        <span
                                            v-if="field && field.type == 'text'"
                                        >
                                            <input-container>
                                                <InputFormText
                                                    :id="field.id || field.name"
                                                    :name="field.name"
                                                    v-model="field.value"
                                                    :placeholder="
                                                        field.placeholder || ''
                                                    "
                                                >
                                                    <template #label>{{
                                                        field.label
                                                    }}</template>
                                                </InputFormText>
                                            </input-container>
                                        </span>

                                        <span
                                            v-if="
                                                field &&
                                                field.type == 'datetime'
                                            "
                                        >
                                            <input-container>
                                                <InputFormDateTime
                                                    :id="field.id"
                                                    :name="field.name"
                                                    :ref="field.name"
                                                    v-model="field.value"
                                                    :placeholder="
                                                        field.placeholder || ''
                                                    "
                                                    :class="field.class"
                                                >
                                                    <template #label>{{
                                                        field.label
                                                    }}</template>
                                                </InputFormDateTime>
                                            </input-container>
                                        </span>

                                        <span
                                            v-if="
                                                field &&
                                                field.type == 'textarea_short'
                                            "
                                            class="maxx grid grid-cols-1 lg:grid-cols-2 mb-2 gap-2 lg:gap-x-6 mt-2"
                                        >
                                            <input-container :full-width="true">
                                                <InputFormTextArea
                                                    :id="field.id"
                                                    :name="field.name"
                                                    v-model="field.value"
                                                    :value="field.value"
                                                    :rows="field.rows"
                                                    :ref="field.name"
                                                    cols="25"
                                                    :placeholder="
                                                        field.placeholder || ''
                                                    "
                                                    :class="field.class"
                                                    >{{ field.value }}
                                                    <template #label>{{
                                                        field.label
                                                    }}</template>
                                                </InputFormTextArea>
                                            </input-container>
                                        </span>
                                        <span
                                            v-if="
                                                field &&
                                                field.type == 'textarea'
                                            "
                                        >
                                            <input-container>
                                                <InputFormTextArea
                                                    :id="field.id"
                                                    :name="field.name"
                                                    v-model="field.name"
                                                    :value="field.value"
                                                    :rows="field.rows"
                                                    :ref="field.name"
                                                    :placeholder="
                                                        field.placeholder || ''
                                                    "
                                                    :class="field.class"
                                                    >{{ field.value }}
                                                    <template #label>{{
                                                        field.label
                                                    }}</template>
                                                </InputFormTextArea>
                                            </input-container>
                                        </span>
                                    </span>
                                </div>

                                <button
                                    type="submit"
                                    class="bg-blue-500 text-white p-2 rounded"
                                >
                                    Absenden
                                </button>
                            </form>
                        </input-group>
                    </div>
                </template>
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
                    <smooth-scroll
                        href="#app-layout-start"
                        v-if="table.id == 0"
                    >
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

        <!-- Delete Blog Confirmation Modal -->
        <dialog-modal
            :show="confirmingTableDeletion"
            @close="close_confirmingTableDeletion"
        >
            <template #title> {ItemName} löschen </template>

            <template #content>
                Bist du sicher, dass du diesen {ItemName} löschen willst?
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
const segments = path.split("/"); // Teilt den Pfad in Segmente auf
const id = segments[segments.length - 2];
const table = segments[segments.length - 1];
const routes = {
    getform: (table, id) => `/tables/form-data/${table}/${id}`,
};

import { defineComponent } from "vue";
import axios from "axios";
import pickBy from "lodash/pickBy";
// import { usePage } from '@inertiajs/vue3';

// const page2 = usePage();

// import { Ziggy } from 'ziggy-js';
// import route from 'ziggy';

import { onMounted } from "vue";
import Layout from "@/Application/Admin/Shared/Layout.vue";
import Breadcrumb from "@/Application/Components/Content/Breadcrumb.vue";

import SmoothScroll from "@/Application/Components/SmoothScroll.vue";

// import PageTitle from "@/Application/Components/Content/PageTitle.vue";

import SectionForm from "@/Application/Components/Content/SectionForm.vue";
// import SectionBorder from "@/Application/Components/Content/SectionBorder.vue";

import ButtonGroup from "@/Application/Components/Form/ButtonGroup.vue";
import InputButton from "@/Application/Components/Form/InputButton.vue";
import InputFormText from "@/Application/Components/Form/InputFormText.vue";
import InputFormDateTime from "@/Application/Components/Form/InputFormDateTime.vue";
import InputFormTextArea from "@/Application/Components/Form/InputFormTextArea.vue";

import InputDangerButton from "@/Application/Components/Form/InputDangerButton.vue";

import InputLoading from "@/Application/Components/Form/InputLoading.vue";

import ErrorList from "@/Application/Components/Form/ErrorList.vue";
import InputSubtitle from "@/Application/Components/Form/InputSubtitle.vue";
import InputGroup from "@/Application/Components/Form/InputGroup.vue";
import InputContainer from "@/Application/Components/Form/InputContainer.vue";
// import InputLabel from "@/Application/Components/Form/InputLabel.vue";
// import InputElement from "@/Application/Components/Form/InputElement.vue";
// import InputCheckbox from "@/Application/Components/Form/InputCheckbox.vue";
// import InputSelect from "@/Application/Components/Form/InputSelect.vue";
// import InputTextarea from "@/Application/Components/Form/InputTextarea.vue";
// import InputHtml from "@/Application/Components/Form/InputHtml.vue";
// import InputError from "@/Application/Components/Form/InputError.vue";
import { throttle } from "lodash";
import DialogModal from "@/Application/Components/DialogModal.vue";
import { reactive } from "vue";
// import Alert from "@/Application/Components/Content/Alert.vue";

export default defineComponent({
    name: "Admin_TableForm",

    components: {
        Layout,
        Breadcrumb,
        SmoothScroll,
        // PageTitle,
        InputFormDateTime,
        InputFormText,
        SectionForm,
        // SectionBorder,
        ButtonGroup,
        InputButton,
        InputDangerButton,
        InputLoading,
        ErrorList,
        InputSubtitle,
        InputContainer,
        InputGroup,
        // InputLabel,
        // InputElement,
        // InputCheckbox,
        // InputSelect,
        // InputTextarea,
        // InputHtml,
        InputFormTextArea,
        // InputError,
        DialogModal,
        // Alert,
    },

    props: {
        table: {
            type: Object,
            default: () => ({}),
        },
        // formFields:{
        //     type: Object,
        //     default: () => ({}),
        // },
        editstate: {
            type: String,
            default: "",
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
        // table_alt: {
        //     type: String,
        //     default:table_z,
        // },
        // tablez: {
        //     type: String,
        //     default:table_z,
        // },
        // rows:{
        //     type:Array,
        //     default: [],
        // },
        breadcrumbs: {
            type: Object,
            required: true,
        },
        // formData:{
        //     type: Array,
        //     default: [],
        // },
    },

    data() {
        return {
            //     formFields: [{

            //         name: "testname",
            //         type: "text",
            //         value: "valuei"
            // }],
            // formFields:  {},
            ///formFields:[],

            //   formData: {},
            // formData: [{ name: '', label: '', type:'' } ],

            formData: {},

            // formFields: {}, // FormField-Daten
            //formData: reactive({}), // Dynamisch erstelltes Formular-Objekt

            loading: false,
            loadingText: null,
            //
            confirmingTableDeletion: false,
            //
            form: {
                // table_author_id: this.table.table_author_id,
                // table_category_id: this.table.table_category_id,
                // markdown_on: this.table.markdown_on,
                // table_image_id: this.table.table_image_id,
                // table_date: this.table.table_date,
                // title: this.table.title,
                // summary: this.table.summary,
                content: this.table.content,
                // reading_time: this.table.reading_time,
                // audio_on: this.table.audio_on,
                // audio_url: this.table.audio_url,
                // audio_duration: this.table.audio_duration,
                // formData: "@php echo $formData @endphp", // PHP-Ausgabe in JS-String
                // ItemName: "@php echo $ItemName @endphp",
                // ItemName_des: "@php echo $ItemName_des ?? $ItemName @endphp",
            },
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
        // formData() {
        //     return this.$page.props.formData;
        // },
        dynamicFormData() {
            return this.formFields.reduce((acc, field) => {
                acc[field.name] = this.formData[field.name] || field.value;
                return acc;
            }, {});
        },
    },
    watch: {
        updateData() {
            if (this.formData.length < 1) {
                this.formData = {};
            }
            if (
                typeof this.formFields === "object" &&
                !Array.isArray(this.formFields)
            ) {
                const fieldsArray = Object.values(this.formFields);
                fieldsArray.forEach((field) => {
                    if (field.name) {
                        this.formData[field.name] = field.value || "";
                    }
                });
            }
        },
        formFields(newVal) {
            console.log("formFields geändert:", newVal);
        },
        form: {
            handler: throttle(function () {
                let query = pickBy(this.form);
                let paramName = "table";
                const path = window.location.pathname; // Gibt "/admin/tables/show/Example" zurück
                const segments = path.split("/"); // Teilt den Pfad in Segmente auf
                const lastSegment = segments[segments.length - 1];
                let paramValue = lastSegment;

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
                            this.route(this.routeIndex, {
                                [paramName]: paramValue,
                            }), // Ziggy erstellt die Route
                            {
                                search: this.form.search,
                                [paramName]: paramValue, // Dynamischer Parameter
                                page: 1,
                            },
                            {
                                preserveState: true,
                            },
                        );
                    }
                    // Wenn kein dynamischer Parameter existiert, normale Route ohne Parameter
                    if (!paramName || !paramValue) {
                        this.$inertia.get(
                            this.route(
                                this.routeIndex,
                                Object.keys(query).length
                                    ? query
                                    : { remember: "forget" }, // Query-Parameter für Filter
                            ),
                            {
                                search: this.form.search,
                                page: 1,
                            },
                            {
                                preserveState: true,
                            },
                        );
                    }
                }
            }, 150),
            deep: true,
        },
    },
    defineProps() {
        ffo: [String, Array, Object, Number];
    },
    setup() {
        const formFields = reactive({
            idField: {
                name: "id",
                type: "text",
                label: "ID",
                value: "2",
                id: "2",
                class: "disabled",
                rows: "8",
            },
            nameField: {
                name: "name",
                type: "text",
                label: "Name",
                value: "Devlog",
                id: "2",
                class: "text",
                rows: "8",
            },
            summaryField: {
                name: "summary",
                type: "textarea_short",
                label: "Kurzfassung",
                value: "short description of this one",
                id: "2",
                class: "textarea_short",
                rows: "4",
            },
            created_atField: {
                name: "created_at",
                type: "datetime",
                label: "Erstellt am:",
                value: "2025-01-22 09:02:27",
                id: "2",
                class: "datetime",
                rows: "8",
            },
        });
        //this.formData = reactive({});

        // Instead of using $set, just update directly
        // formData.field1 = 'newvalue';

        onMounted(() => {
            //   Object.keys(formFields).forEach((key) => {
            //     formData[formFields[key].name] = formFields[key].value;
            //   });
        });

        return {
            formFields,
            // formData
        };
    },
    methods: {
        setFormField(field) {
            // Directly setting the value in formData
            this.formData[field.name] = field.value || "";
        },
        confirmTableDeletion() {
            this.confirmingTableDeletion = true;
        },
        cleanArray(array) {
            return array.filter(
                (value) =>
                    (typeof value === "string" && value.trim().length > 0) ||
                    typeof value === "number",
            );
        },
        //             async fetchFormData() {
        //             try {

        //             const response = await axios.get(route("GetTableForm", [table, id]));
        //             // response=>response.json();
        //             console.log("tables/form-data/"+ table +"/" + id);
        //             // console.log(response.data);
        //             this.formFields = response.data;
        //             var formFields_old = response.data;
        //             var obj = JSON.stringify(this.formFields,null,2);
        //             obj = obj.replace(/"formFields": \[.*\]/, '');
        //             obj =  obj.replace(/^\{|\}$/g, '');

        //             obj = obj.replace(/}\s*,\s*\n\s*}/g, "},").replace(/[\[\]]/g, '').replace(/\[|\]$/, '');
        //             // obj = obj.replace(/},/g, "");
        //             obj = obj.replace(/,\s*\n\s*{/g, ',');

        //             //     console.log("new:"+JSON.stringify(obj, null, 2));
        //             obj = obj.replace(/\s*\}(?!,)\s*/g, '}');;
        //             obj = obj.replace(/}},/g, '\n   },');
        //             obj = obj.replace(/}}/g, '\n   }\n  }');

        //             this.formFields = obj;
        //             var fields = obj;
        //             console.log(this.formFields);

        //             formFields_old.forEach((field) => {
        //             //this.$set(this.formData, field.name, field.value || '');
        //             this.setFormField(field);

        //             console.log(field);
        //             });
        // //            Initialisiere das Formular-Daten-Objekt
        //             this.formFields.forEach(field => {
        //                 this.formData[field.name] = field.value;
        //              });
        //         } catch (error) {
        //             console.error("Fehler beim Abrufen der Formulardaten:", error);
        //         }

        //         }
        // async fetchDataX() {
        //     loading.value = true
        //     if(data.length < 1)
        //     {
        //         data = {};
        //     }
        // error.value = null
        // try {
        // const response = await fetch(routes["getform", [table, id]])
        // if (!response.ok) {
        // throw new Error('Network response was not ok')
        // }
        // data.value = await response.json();
        // this.formFields = data;

        // } catch (err) {
        // error.value = err.message
        // } finally {
        // loading.value = false
        // console.log("asd:" + JSON.stringify(data,null,2));
        // }
        // },

        fetchFormData() {
            console.log(table, id);
            axios
                .get(routes.getform(table, id))
                .then((response) => {
                    this.formFields = response.data;
                    var formFields_old = response.data;
                    let obj = JSON.stringify(this.formFields, null, 2);
                    obj = obj.replace(/"formFields": \[.*\]/, "");
                    obj = obj.replace(/^\{|\}$/g, "");
                    obj = obj
                        .replace(/}\s*,\s*\n\s*}/g, "},")
                        .replace(/[[\]]/g, "")
                        .replace(/\[|\]$/, "");
                    obj = obj.replace(/,\s*\n\s*{/g, ",");
                    obj = obj.replace(/\s*\}(?!,)\s*/g, "}");
                    obj = obj.replace(/}},/g, "\n   },");
                    obj = obj.replace(/}}/g, "\n   }\n  }");

                    this.formFields = obj;
                    console.log(this.formFields);
                    //            this.ffo = obj;
                    formFields_old.forEach((field) => {
                        this.setFormField(field);
                        console.log(field);
                    });

                    // this.formFields.forEach(field => {
                    //     this.formData[field.name] = field.value;
                    // });
                })
                .catch((error) => {
                    console.error(
                        "Fehler beim Abrufen der Formulardaten:",
                        error,
                    );
                });
        },

        submitForm() {
            //console.log(JSON.stringify(this.formData, null, 2)); // Formular-Daten absenden
        },

        deleteTable() {
            this.confirmingTableDeletion = false;
            //
            this.loading = true;
            this.loadingText = "Der {ItemName} wird gelöscht!";
            //
            this.$inertia.delete(
                this.route("admin.table.delete", this.table.id),
                {
                    onSuccess: () => {
                        this.loading = false;
                    },
                    onError: () => {
                        this.loading = false;
                    },
                },
            );
        },

        close_confirmingTableDeletion() {
            this.confirmingTableDeletion = false;
        },

        createTableData() {
            this.loading = true;
            this.loadingText = "Der neue {ItemName} wird gespeichert!";
            //
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
            //
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
                },
            );
        },
        updateData() {
            if (!this.formData) {
                this.formData = {};
            }
            if (
                typeof this.formFields === "object" &&
                !Array.isArray(this.formFields)
            ) {
                const fieldsArray = Object.values(this.formFields);
                fieldsArray.forEach((field) => {
                    if (field.name) {
                        this.formData[field.name] = field.value || "";
                    }
                });
            }
        },
        selectTableImage(id) {
            console.log("selectTableImage id:", id);
            this.form.table_image_id = id;
        },
    },
    mounted() {
        //     // API-Anfrage zum Abrufen der Daten
        //     axios.get(routes["getform", [table, id]])  // Ersetze dies durch die tatsächliche API-URL
        // .then(response => {
        //    //this.formFields = response.data;  // Setze die abgerufenen Daten in den lokalen Zustand
        // })
        // .catch(error => {
        //     console.error('Fehler beim Abrufen der Daten:', error);
        // });

        //this.fetchDataX();
        this.fetchFormData();
        this.updateData();
    },
    created() {},
});
</script>
