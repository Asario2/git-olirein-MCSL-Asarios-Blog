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
            <template #title>{{ItemName}}-Daten</template>
            <template #description
                >Hier kannst du alle Daten {{ItemName_des}} ändern
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
                        <!-- <pre>{{ formData }}</pre> -->
                        <!-- <pre>{{ quotebrace(this.sortedOptions) }}</pre> -->

                        <input-group>
                            <form @submit.prevent="submitForm">
                                <div class="maxx grid grid-cols-1 lg:grid-cols-2 mb-2 gap-2 lg:gap-x-6 mt-2">
                                <template v-for="(field, key) in ffo" :key="key">
                                    <input-container v-if="field.type === 'text'">
                                        <InputFormText
                                            :id="field.name + '_' + field.id"
                                            :name="field.name"
                                            v-model="field.value"
                                            :placeholder="field.placeholder || ''"
                                            :required="isRequired(field.required)"
                                            >
                                            <template #label>{{ field.label }}</template>
                                        </InputFormText>
                                    </input-container>

                                    <input-container v-else-if="field.type === 'datetime'">
                                        <InputFormDateTime
                                            :id="field.name + '_' + field.id"
                                            :name="field.name"
                                            :ref="field.name"
                                            v-model="field.value"
                                            :placeholder="field.placeholder || ''"
                                            :class="field.class"
                                            :required="isRequired(field.required)"
                                            >
                                            <template #label>{{ field.label }}</template>
                                        </InputFormDateTime>
                                    </input-container>

                                    <input-container
                                        v-else-if="['textarea_short', 'textarea'].includes(field.type)"
                                        :full-width="true"

                                    >
                                        <InputFormTextArea
                                            :id="field.name + '_' + field.id"
                                            :name="field.name"
                                            v-model="field.value"
                                            :rows="field.rows"
                                            :ref="field.name"
                                            cols="25"
                                            :placeholder="field.placeholder || ''"
                                            :class="field.class"
                                            :required="isRequired(field.required)"
                                        >
                                            <template #label>{{ field.label }}</template>
                                        </InputFormTextArea>
                                    </input-container>
                                    <input-container
                                    v-else-if="field.type === 'checkbox'" :full-width="true"
                                    >
                                        <input-checkbox
                                            name="markdown_on"
                                            v-model="field.value"
                                            :required="isRequired(field.required)"
                                        >
                                            Liegt der Artikel im Markdown-Format
                                            vor?</input-checkbox
                                        >
                                    </input-container>


                                    <input-container
                                        v-else-if="field.type === 'select_id'"

                                    >
                                        <!-- Weitere Inhalte für die select_id-Komponente -->

                                        <InputLabel
                                        :name="field.name"
                                        :label="field.label">
                                    </InputLabel>
                                    <InputSelect


                                    @input-change="updateFormData"

                                        :id="field.name + '_' + field.id"
                                        v-model="this.xval"
                                        :options="'options:' + (this.sortedOptions.length > 0)
                                            ? this.sortedOptions.find(obj => obj[field.name])?.[field.name] || []
                                            : []"
                                        ref="field.name"
                                        :name="field.name"
                                        :xval="field.value"
                                        :xname="field.name"
                                        :required="isRequired(field.required)"
                                    >

                                </InputSelect>

                                </input-container>
                                </template>
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
            <pre>{{ tables }}</pre>

            <template #actions style="display:inline-block;">
                <!-- Befehle -->
                <button-group>
                    <input-danger-button
                        v-if="table.id > 0"
                        type="button"
                        @click.prevent="confirmTableDeletion"
                    >
                        {{ItemName}} löschen
                    </input-danger-button>
                    <smooth-scroll href="#app-layout-start" v-if="table.id > 0">
                        <input-button
                            type="button"
                            @click.prevent="debugUpdateTableData"
                        >
                            {{ItemName}} ändern
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
                            {{ItemName}} erstellen
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
            <template #title> {{ItemName}} löschen </template>

            <template #content>
                Bist du sicher, dass du diesen {{ItemName}} löschen willst?
            </template>

            <template #footer>
                <button-group>
                    <input-button @click="close_confirmingTableDeletion">
                        Zurück
                    </input-button>

                    <input-danger-button @click="deleteTable">
                        {{ItemName}} jetzt löschen
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
let tablex = segments[segments.length - 1]; // Muss ein ref sein, wenn es reaktiv sein soll
const table_z = tablex;
let xid = segments[segments.length - 2];

const routes = {
    getform: (tablex, id) => `/tables/form-data/${tablex}/${id}`,
    getselroute: (name) => `/tables/sort-data/${name}`,
    putdata: (table,id) => `admin/tables/update/${tablex}/${id}`,
};
// this.sortOptions = this.sortOptions ?? {}
let sortOptions;
sortOptions = sortOptions ?? {};
// console.log(routes.getselroute("blog_authors"));
import { defineComponent } from "vue";
import axios from "axios";
import $ from "jquery";
import pickBy from "lodash/pickBy";
// import { usePage } from '@inertiajs/vue3';
import { ref, watch } from "vue";
// const page2 = usePage();

// import { Ziggy } from 'ziggy-js';
// import route from 'ziggy';

import { onMounted, watchEffect } from "vue";
import Layout from "@/Application/Admin/Shared/Layout.vue";
import Breadcrumb from "@/Application/Components/Content/Breadcrumb.vue";

import SmoothScroll from "@/Application/Components/SmoothScroll.vue";

import PageTitle from "@/Application/Components/Content/PageTitle.vue";

import SectionForm from "@/Application/Components/Content/SectionForm.vue";
import SectionBorder from "@/Application/Components/Content/SectionBorder.vue";

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
import InputLabel from "@/Application/Components/Form/InputLabel.vue";
import InputElement from "@/Application/Components/Form/InputElement.vue";
import InputCheckbox from "@/Application/Components/Form/InputCheckbox.vue";
import InputSelect from "@/Application/Components/Form/InputSelect.vue";
import InputTextarea from "@/Application/Components/Form/InputTextarea.vue";
import InputHtml from "@/Application/Components/Form/InputHtml.vue";
import InputError from "@/Application/Components/Form/InputError.vue";
import { throttle } from "lodash";
import DialogModal from "@/Application/Components/DialogModal.vue";
import { reactive } from "vue";
import Alert from "@/Application/Components/Content/Alert.vue";
onMounted(() => {
  this.fetchFormData();
});
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
         InputLabel,
         InputElement,
        InputCheckbox,
         InputSelect,
         InputTextarea,
         InputHtml,
        InputFormTextArea,
        InputError,
        DialogModal,
         Alert,
    },

    props: {
        // table: {
        //     type: Object,
        //     default: () => ({}),
        // },
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
        tablex: {
            type: String,
            default:table_z,
        },
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
        id:{
            type: [String,Number],
            default: '1',
        },
    },

    data() {
        return {
            table: reactive({ id: "1" }),// Standardwert setzen, falls leer
            formDatas: {},
        ItemName: "Beitrag",  // Falls nicht definiert
            //     formFields: [{

            //         name: "testname",
            //         type: "text",
            //         value: "valuei"
            // }],
            // formFields:  {},
            ///formFields:[],
            options: this.options ?? {},
            //   formData: {},
            field: [{ name: '', label: '', type:'' } ],

            // formData: {},
           // formFields: {}, // FormField-Daten
            //formData: reactive({}), // Dynamisch erstelltes Formular-Objekt
                sdata: {},
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
                //content: this.table.content,
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
        sortedOptions() {
            // this.sortedOptions = this.sortedOptions ?? {};
            this.options = this.options ?? this.sortedOptions;

            if(Array.isArray(this.options)) {
            // Falls `this.options` bereits ein korrektes Array ist, direkt zurückgeben
            return this.options;
        }
        else if (typeof this.options === "object" && this.options !== null) {
            // Falls `this.options` ein Objekt ist, in ein Array von Arrays umwandeln
            return Object.entries(this.options);
        }
        // Falls `this.options` nicht gültig ist, ein leeres Array zurückgeben
        console.log("options:" + this.options);
        return [];
    },
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
                if (!field.name.includes("_id"))
                {
                    acc[field.name] = this.formData[field.name] || field.value;
                }

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
                    if (!field.name.includes("_id")){
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
        // ffo: [String, Array, Object, Number];
    },
    setup() {
        const ffo = ref(localStorage.getItem("ffo") || "Standardwert");

watch(ffo, (newValue) => {
    localStorage.setItem("ffo", newValue);
    var $_GET = {};
if(document.location.toString().indexOf('?') !== -1) {
    var query = document.location
                   .toString()
                   // get the query string
                   .replace(/^.*?\?/, '')
                   // and remove any existing hash string (thanks, @vrijdenker)
                   .replace(/#.*$/, '')
                   .split('&');

    for(var i=0, l=query.length; i<l; i++) {
       var aux = decodeURIComponent(query[i]).split('=');
       $_GET[aux[0]] = aux[1];
    }
}
// function fetchFormData() {
    //         axios
    //             .get(routes.getform(table, id))
    //             .then((response) => {
    //                 this.formFields = response.data;
    //                 var formFields_old = response.data;
    //                 let obj = JSON.stringify(this.formFields, null, 2);
    //                 obj = obj.replace(/"formFields": \[.*\]/, "");
    //                 obj = obj.replace(/^\{|\}$/g, "");
    //                 obj = obj
    //                     .replace(/}\s*,\s*\n\s*}/g, "},")
    //                     .replace(/[[\]]/g, "")
    //                     .replace(/\[|\]$/, "");
    //                 obj = obj.replace(/,\s*\n\s*{/g, ",");
    //                 obj = obj.replace(/\s*\}(?!,)\s*/g, "}");
    //                 obj = obj.replace(/}},/g, "\n   },");
    //                 obj = obj.replace(/}}/g, "\n   }\n  }");

    //                 this.ffo = JSON.parse(obj);
    //                 const ffo = this.ffo;
    //                 //            this.ffo = obj;
    //                 formFields_old.forEach((field) => {
    //                     this.setFormField(field);
    //                 });

    //                 // this.formFields.forEach(field => {
    //                 //     this.formData[field.name] = field.value;
    //                 // });
    //             })
    //             .catch((error) => {
    //                 console.error(
    //                     "Fehler beim Abrufen der Formulardaten:",
    //                     error,
    //                 );
    //             });
    //     }
    if(!$_GET['rl'])
    {
       //location.href = location.href + "?rl=2";
    }
    if($_GET['rl']  == "2")
    {
        let url = location.href.replace(/\?rl=2/g, '');
        history.pushState(null, "", url);
    }


//     $(document).ready(function () {
//     // Prüfen, ob 'rl' in der URL vorhanden ist
//     const urlParams = new URLSearchParams(window.location.search);

//     if (!urlParams.has("rl")) {
//         urlParams.set("rl", "2"); // 'rl=2' hinzufügen
//         const newUrl = window.location.pathname + "?" + urlParams.toString();

//         $.ajax({
//             url: newUrl,
//             success: function (data) {
//                 history.pushState(null, "", newUrl); // URL in der Adressleiste aktualisieren
//                 $("body").html($(data).find("body").html()); // Nur den Body ersetzen
//             }
//         });
//     }
// })

});

return { ffo };


        return { ffor };

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
                label: "Zusammenfassung",
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
   removeNumericKeys(obj) {
        let newObj = {};

        Object.values(obj).forEach(value => {
            Object.assign(newObj, value);
        });

        return newObj;
    },
    isRequired(value) {
      return value === "required" || value === true; // Falls Laravel `true` statt `"required"` sendet
    },
        updateFormData(value, fieldName) {
            let formDatas = {};
            if (fieldName.includes("_id")){
            this.formDatas[fieldName] = value;
            }
            console.log("aaaaaaaa" + JSON.stringify(this.formDatas,null,2));
        },
        setFormField(field,name) {

            // Directly setting the value in formData
            console.log(field);
            console.log(field.name);
            console.log(field.type);
            if(field.type == "select_id")
            {

                this.getsel(field.name);

            }
            if (field.name.includes("_id")) {
                this.formData[field.name] = this.formDatas[field.name];
            }
            else{
                this.formData[field.name] = field.value || "";
            }
        },
        debugUpdateTableData() {
            console.log("updateTableData wird aufgerufen!");
            this.updateTableData();
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
        getsel(name)
        {
            var sortedOptions = this.sortedOptions ?? [];
            let sdata = this.sdata ?? {};
            axios
                .get(routes.getselroute(name))
                .then((response) => {

                    sdata = JSON.stringify(response.data);

                    //sdata = sdata.replace(new RegExp(name, "g"), '');
                    sdata = JSON.parse(sdata);
                    // 1. JSON-String in Objekt umwandeln
                    // const parsedData = JSON.parse(jsonString);

                    // 2. Nur das ".sortedOptions" Objekt extrahieren
                    // const sortedOptionsData = parsedData[".sortedOptions"];

                    // 3. In `sortedOptions` speichern
                    if (!Array.isArray(this.sortedOptions)) {
                        this.sortedOptions = []; // Leeres Array initialisieren
                    }
                    // this.sortedOptions[name] = sortedOptionsData;

                                       // sortedOptions[name] = sortedOptionsData;


                    // Die Struktur umkehren
                    // Object.entries(this.sortedOptions).forEach(([key, value]) => {
                    //     if (value.sortedOptions) {
                    //         sortedOptions[key] = value.sortedOptions;
                    //     }
                    // });

                    const input = (sdata);
                    const output = {};

                    // Durch alle Einträge iterieren und die Keys umwandeln
                    Object.entries(input).forEach(([key, value]) => {
                        // Entfernen von "sortedOptions" aus dem Key, falls vorhanden
                        const cleanedKey = key.replace('.sortedOptions', '');

                        // Überprüfen, ob der Key ein String ist und ob er einen Punkt enthält
                        if (typeof cleanedKey === 'string' && cleanedKey.includes('.')) {
                            const parts = cleanedKey.split('.'); // Key in zwei Teile aufteilen

                            if (parts.length === 2) {
                                const [prefix, suffix] = parts;
                                const newKey = `${suffix}.${prefix}`; // Reihenfolge umdrehen
                                output[newKey] = value;
                            } else {
                                output[cleanedKey] = value;
                            }
                        } else {
                            // Falls der Key keinen Punkt enthält, oder nicht als String vorliegt, Key unverändert lassen
                            output[cleanedKey] = value;
                        }
                    });
                    // output = (JSON.stringify(output));

                    this.sortedOptions.push(output);
                    this.options = this.sortedOptions;

                })
                .catch((error) => {
                    console.error(
                        "Fehler beim Abrufen der Formulardaten:",
                        error,
                    );
                });

        },
        fetchFormData() {
    axios
        .get(routes.getform(tablex, id))
        .then((response) => {
            this.formFields = response.data;
            let formFields_old = response.data;

            // JSON bereinigen
            let obj = JSON.stringify(this.formFields,null,2)

            obj = obj.replace(/"formFields": \[.*\]/, "")
                .replace(/^\{|\}$/g, "")
                .replace(/}\s*,\s*\n\s*}/g, "},")
                .replace(/[[\]]/g, "")
                .replace(/\[|\]$/, "")
                .replace(/,\s*\n\s*{/g, ",")
                .replace(/\s*\}(?!,)\s*/g, "}")
                .replace(/}},/g, "\n   },")
                .replace(/}}/g, "\n   }\n  }")
                .replace(/"\d+"\s*:\s*{/g, '{')
                .replace(/},\s*{/g, '},');

            obj = JSON.parse(obj);

            console.log(obj);
            this.ffo = obj
            const ffo = this.ffo;
            // 💡 Konvertiere das Objekt in ein Array
            const formFieldsArray = Object.values(formFields_old);

            console.log("FormFields als Array:", formFieldsArray);

            formFieldsArray.forEach((field) => {
                if (typeof field === "object" && field !== null) {
                    Object.entries(field).forEach(([subKey, subValue]) => {
                        this.setFormField(subValue, subValue.name);
                    });
                }

            });

        })
        .catch((error) => {
            console.error("Fehler beim Abrufen der Formulardaten:", error);
        });
},
quotebrace(obj){
    obj = typeof obj !== String ? JSON.stringify(obj,null,2) : obj;
                obj.replace(/^\{|\}$/g, "")
                .replace("[{|}]")
                .replace(/}\s*,\s*\n\s*}/g, "},")
                .replace(/[[\]]/g, "")
                .replace(/\[|\]$/, "")
                .replace(/,\s*\n\s*{/g, ",")
                .replace(/\s*\}(?!,)\s*/g, "}")
                .replace(/}},/g, "\n   },")
                .replace(/}}/g, "\n   }\n  }");
                return JSON.parse(obj);
},
remom(str){
// Variable, um die Anzahl der Vorkommen von ","
let commaCount = 0;
// str = Object.entries(str);
// Ersetze jedes ungerade Vorkommen von ","
//  var str = JSON.stringify(str);
// str = str.replace(/[^:]*:\s*{/g, '{');
// console.log(str);
str = Object.entries((str));
str.forEach(([key, value]) => {

    if (!key.includes("_id")){
    this.formData[value['name']] = value['value'];
    console.log("NO ID@" + key);
    console.log(`${key}: ${value['value']}`);

    }
    else{
        this.formData[key] = this.formDatas[key];
    }
});
var modifiedStr;
// str = this.objectToCSVArray(str);
modifiedStr  = this.formData;
// str.replace(/,/g, (match) => {
//   commaCount++;
//   return commaCount % 2 !== 0 ? ':' : ',';
// });
return modifiedStr;
},
// getData($obje){
//     this.obje.find(obj => obj[field.value])?.[field.value];
//     console.log("obj: " + obje);
// },
objectToCSVArray(obj) {
    let csvArray = [];

    // Überschriften (Header)
    let headers = Object.keys(obj);
    csvArray.push(headers.join(',')); // Als CSV-String speichern

    // Werte extrahieren
    let values = Object.values(obj);
    csvArray.push(values.join(',')); // Als CSV-String speichern

    return csvArray; // Gibt das CSV als Array zurück
},
async submitForm() {

        try {
            this.formData2 = JSON.stringify(this.remom(this.ffo));
            console.log("Daten, die gesendet werden:",this.formData);
            const path = window.location.pathname; // Gibt "/admin/tables/show/Example" zurück
            const segments = path.split("/"); // Teilt den Pfad in Segmente auf
            this.xid = segments[segments.length - 2];
            tablex = segments[segments.length - 1];
            let response;
            if(segments[segments.length - 2] == "create")
            {
                response = await axios.post(`/admin/tables/store/${this.tablex}`, {
                formData: this.formData
            });
            }
            else{
                response = await axios.put(`/admin/tables/update/${this.tablex}/${this.xid}`, {
                formData: this.formData
            });
            }


        //     await axios.post('/admin/table/update', {
        //     table: this.tablex,  // Dynamische Tabelle
        //     id: this.id,         // Die ID des Datensatzes
        //     ...this.formData     // Formulardaten direkt mit spread-Operator einfügen
        // });

            console.log("tf:"+this.formData);
            console.log("Formular erfolgreich gesendet:", response.data);

        } catch (error) {
            console.error("Fehler beim Absenden:", error);
        }
    },
// async submitForm() {
//         // Überprüfen, ob `this.ffo` ein Objekt ist

//         if (typeof this.ffo === 'object') {
//             // Umwandlung von `this.ffo` in ein Array von [key, value] Paaren
//             let formData = Object.entries(this.ffo).reduce((acc, [key, value]) => {
//                 acc[key] = Object.entries(value);
//                 return acc;
//             }, {});

//             try {

//                 const response = await axios("admin.table.update",[formData,id,table]);
//                 console.log("Formular erfolgreich gesendet!", response.data);
//             } catch (error) {
//                 console.error("Fehler beim Absenden:", error.response.data);
//             }
//         } else {
//             console.error("this.ffo ist kein Objekt!");
//         }
//     },


        deleteTable() {
            this.confirmingTableDeletion = false;
            //
            this.loading = true;
            this.loadingText = "Der {{ItemName}} wird gelöscht!";
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
            this.loadingText = "Der neue {{ItemName}} wird gespeichert!";
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

        async updateTableData() {
    try {
        this.loading = true;
        this.loadingText = `Die geänderten Daten des ${this.ItemName} werden jetzt gespeichert!`;

        const response = await axios.put(`/admin/tables/update/${this.tablex}/${this.id}`,{formData: this.formData});

        if (response.data) {
            this.loading = false;
            console.log("Daten erfolgreich gespeichert!", response.data);
        }
    } catch (error) {
        this.loading = false;
        console.error("Fehler beim Speichern der Daten:", error);
    }
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
                    if (!field.name.includes("_id")) {
                        this.formData[field.name] = field.value || "";
                    }
                });
            }
        },
        selectTableImage(id) {
            console.log("selectTableImage id:", id);
            this.form.table_image_id = id;
        },
        emptyChecker(){
            if(this.formData.length < 1)
            {
                alert("empty");
            }
        }
    },
    mounted() {
         //this.fetchDataX();
        this.fetchFormData();
        this.updateData();
        this.emptyChecker();
    //     console.log("sortedOptions:", this.sortedOptions);
    // console.log("field.name:", this.field?.name);
    // console.log("sortedOptions[field.name]:", this.sortedOptions[this.field.name]);
    // console.log("field.name:", this.field?.name);
    },
    created() {
        // this.fetchFormData();
    },
});
</script>
