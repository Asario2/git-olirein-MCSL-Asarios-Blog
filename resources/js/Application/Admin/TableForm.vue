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
                        <!-- <pre>{{this.xsor_alt['admin_table_id'] }}</pre> -->
                        <a v-if="hasRight('add',tablex)" :href="'/admin/tables/create/' + tablex" target="" class="inline-flex items-center
                        px-1 py-1.5 md:px-2 md:py-2 h-6 md:h-8 rounded-md font-medium text-xs tracking-widest
                         disabled:opacity-25 transition cursor-pointer focus:ring focus:outline-none button_bg
                          button_text_case_bg"><div class="flex items-center whitespace-nowrap"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" fill="none" class="button_icon"><path stroke-linecap="round" stroke-linejoin="round" d="M12 9v6m3-3H9m12 0a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z"></path></svg> Erstelle </div></a>
                        <input-group>

    <form @submit.prevent="submitForm" enctype="multipart/form-data" >
        <div class="textar maxx grid grid-cols-1 lg:grid-cols-2 mb-2 gap-2 lg:gap-x-4 mt-2">
            <template v-for="(field, key) in ffo" :key="key">

                <input-container v-if="field.name === 'reading_time'">
                    <InputFormText
                        :id="field.name"
                        :name="field.name"
                        v-model="readingTime"
                        :placeholder="field.placeholder || ''"
                        readonly
                        :disabled="true"
                        :required="isRequired(field.required)"

                        @input="handleInput"
                        >
                        <template #label>{{ field.label }}</template>

                    </InputFormText>
                </input-container>
                <input-container v-if="field.type === 'autoSlug'">
                    <InputFormText
                        :id="field.name"
                        :name="field.name"
                        v-model="aslug"
                        :placeholder="field.placeholder || ''"
                        readonly
                        :disabled="true"
                        :value="aslug"
                        :required="isRequired(field.required)"

                        @input="handleInput"
                        >
                        <template #label>{{ field.label }}</template>

                    </InputFormText>
                </input-container>

                <!-- Textarea für den Inhalt -->
                <input-container v-else-if="['textarea', 'textarea_short'].includes(field.type)" :full-width="true">

                <Editor ref="editor"
                        :id="field.name"
                        :name="field.name"
                        v-model="field.value"
                        :rows="field.rows"
                        cols="25"
                        :placeholder="field.placeholder || ''"
                        :class="field.class"
                        @focus="isFocused = true"
                        :required="isRequired(field.required)"
                >
                        <template #label>{{ field.label }}</template>
                    </Editor>


                </input-container>
                <input-container v-else-if="field.type === 'textarea'">
                <InputFormTextarea
                        :id="field.name"
                        :name="field.name"
                        v-model="field.value"
                        :placeholder="field.placeholder || ''"
                        :required="isRequired(field.required)"
                        >
                        <template #label>{{ field.label }}</template>
                    </InputFormTextarea>
                </input-container>
                <input-container v-else-if="field.type === 'text'">
                    <InputFormText
                        :id="field.name"
                        :name="field.name"
                        v-model="field.value"
                        :placeholder="field.placeholder || ''"
                        :required="isRequired(field.required)"
                        >
                        <template #label>{{ field.label }}</template>
                    </InputFormText>
                </input-container>
                <input-container v-else-if="field.type === 'price'">
                    <InputFormPrice
                        :id="field.name"
                        :name="field.name"
                        v-model="field.value"
                        :placeholder="field.placeholder || ''"
                        :required="isRequired(field.required)"
                        >
                        <template #label>{{ field.label }}</template>
                    </InputFormPrice>
                </input-container>
                <input-container v-else-if="field.type ==='IID'">

                <ImageUploadModal
                        :alt_path="field.class === 'profile' ? 'profile_photos' : ''"
                        v-show="isModalOpen"
                        :tablex="table_x"
                        :column="field.name"
                        :path="tablex"
                        :ref="field.name"
                        :value="imageId"
                        :image="field.value"
                        :namee="field.value"
                        :namee2="field.name"
                        :Message="false"
                        @close="closeModal"
                        @update:fileName="handleFileNameUpdate"
                        @imageUploaded="handleImageUpload"
                />
                <button type="button" @click="openModal_alt">
                    <p v-if="this.nf2 && typeof this.nf2 !== 'object' && this.nf2 != '[]' && this.nf2 != '008.jpg' ">Hochgeladenes Bild:

                        <img :src="table_alter + this.nf2" width="100" alt="Vorschau1" title="Vorschau1"/></p>
                        <p
                        v-else-if="ffo[this.column] && ffo[this.column].value && ffo[this.column].value !== '008.jpg'"
                        >
                        Hochgeladenes Bild:
                        <img
                            :src="`${table_older}${ffo[this.column].value}`"
                            width="100"
                            alt="Vorschau2"
                            title="Vorschau2"
                        />
                        </p>
                    <span v-else><img src="/images/blogs/thumbs/009.jpg" alt="Jetzt Bild Hochladen" width="100"  title="Jetzt Bild Hochladen" ></span>
                        <input type="hidden" :id="field.name" :value="this.nf2.replace('images//images/','images/')">
                </button>
                <input
                type="hidden"
                :name="field.name"
                :value="nf2.replace('images//images/','images/')"
                :id="field.name"
                />

                </input-container>
                <input-container v-else-if="field.type === 'datetime'">
                    <InputFormDateTime
                        :id="field.name"
                        :name="field.name"
                        :ref="field.name"
                        v-model="field.value"
                        :value="field.value"
                        :placeholder="field.placeholder || ''"
                        :class="field.class"
                        :required="isRequired(field.required)"
                        >
                        <template #label>{{ field.label }}</template>
                    </InputFormDateTime>
                </input-container>
                <input-container
                v-else-if="field.type === 'checkbox'" :full-width="true"
                >
                    <input-checkbox
                        :name="field.name"
                        v-model="field.value"
                        :value="field.value"

                        >
                        {{field.label}}</input-checkbox
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

                                        :id="field.name"
                                        :model-value="field.value"

                                        :options="`options: ${this.xsor_alt[field.name]?.length > 0 ? this.xsor_alt[field.name] : []}`"
                                        :ref="field.name"
                                        :name="field.name"
                                        :xval="field.name == 'users_id' ? field.users_id : field.value"
                                        :xname="field.name"
                                        :users_id="field.name == 'users_id' ? field.users_id : ''"
                                        :required="isRequired(field.required)"
                                    >

                                </InputSelect>

                                </input-container>

                                <input-container
                                        v-else-if="field.type === 'select_itemscope'"

                                    >


                                        <InputLabel
                                        :name="field.name"
                                        :label="field.label">
                                    </InputLabel>
                                    <InputSelectEnum


                                    @input-change="updateFormData"

                                        :id="field.name"
                                        :model-value="field.value"
                                        v-model="field.name"
                                        :options="`options: ${this.xsor_alt[field.name]?.length > 0 ? this.xsor_alt[field.name] : []}`"
                                        ref="field.name"
                                        :name="field.name"
                                        :xval="field.value"
                                        :xname="field.name"
                                        :tablex="tablex"
                                        :required="isRequired(field.required)"
                                    >

                                </InputSelectEnum>

                                </input-container>
                                <input-container
                                        v-else-if="field.type === 'artselect'"

                                    >
                                <ArtSelect :id="field.id" :table="this.tablex"/>
                                </input-container>
                                <input-container
                                        v-else-if="field.type === 'select'"

                                    >


                                        <InputLabel
                                        :name="field.name"
                                        :label="field.label">
                                    </InputLabel>
                                    <InputSelectEnum


                                    @input-change="updateFormData"

                                        :id="field.name"
                                        :model-value="field.value"
                                        v-model="field.name"
                                        :options="`options: ${this.xsor_alt[field.name]?.length > 0 ? this.xsor_alt[field.name] : []}`"
                                        ref="field.name"
                                        :name="field.name"
                                        :xval="field.value"
                                        :xname="field.name"
                                        :tablex="tablex"
                                        :required="isRequired(field.required)"
                                    >

                                </InputSelectEnum>

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
            <template>

</template>



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
const id = CleanId();
let tablex = CleanTable(); // Muss ein ref sein, wenn es reaktiv sein soll
const table_z = tablex;
const tablex3 = tablex;
let table = tablex;
let xid3 = CleanId();

const routes = {
    getform: (tablex, id) => `/tables/form-data/${tablex3}/${xid3}`,
    getselroute: (name) => `/tables/sort-data/${name}`,
    getselenumroute: (table,name) => `/tables/sort-enum/${table}/${name}`,
    getselenumisroute: (table,name) => `/tables/sort-enumis/${table}/${name}`,


    putdata: (tablex,id) => `admin/tables/update/${tablex}/${id}`,
};
//console.log("RTE " + routes.getselenumroute("images", "status"));

// this.sortOptions = this.sortOptions ?? {}
let sortOptions;
sortOptions = sortOptions ?? {};
// console.log(routes.getselroute("blog_authors"));
import { defineComponent } from "vue";
import { nextTick } from 'vue';
import { GetSettings } from "@/helpers";


import axios from "axios";
import $ from "jquery";
import pickBy from "lodash/pickBy";
import { computed } from "vue";
// import { usePage } from '@inertiajs/vue3';
import { ref, watch } from "vue";
// const page2 = usePage();
import { CleanTable, CleanId } from '@/helpers';
import ImageUploadModal from '@/Application/Components/ImageUploadModal.vue';
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
import ArtSelect from "@/Application/Components/Form/ArtSelect.vue";
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
import InputSelectEnum from "@/Application/Components/Form/InputSelectEnum.vue";
import InputFormPrice from "@/Application/Components/Form/InputFormPrice.vue";
import InputFormSelect from "@/Application/Components/Form/InputFormSelect.vue";
import InputTextarea from "@/Application/Components/Form/InputTextarea.vue";
import Editor from "@/Application/Components/Form/InputHtml.vue";
import InputError from "@/Application/Components/Form/InputError.vue";
import { throttle } from "lodash";
import DialogModal from "@/Application/Components/DialogModal.vue";
import { hasRight,loadAllRights,isRightsReady } from '@/utils/rights';
import { reactive } from "vue";
import Alert from "@/Application/Components/Content/Alert.vue";
// import { console } from "inspector/promises";
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
         InputSelectEnum,
         InputTextarea,
         Editor,
        InputFormTextArea,
        InputFormPrice,
        InputFormSelect,
        InputError,
        DialogModal,
         Alert,
         ArtSelect,
         ImageUploadModal,
    },

    props: {
        isModalOpen: {
            type: Boolean,
            default: false,
        },
        modelValue: {
        type: [String, Number],
    },
    input2:{
        type: [Object,Array],
    },
    xval: {
        type: [String, Number],
        default: 1,
    },
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
        field: Object,
        users_id:{
            type: [Number,String],
            default:0,
        },

    },
    emit: ['update:isOpen', 'close'],

    // DZ
    data() {
        return {
            isModalOpen: false,

            table: reactive({ id: "1" }),// Standardwert setzen, falls leer
        formDatas: {},
        oobj:{},
        sanitizedContent: '',
        uploadedIid: null,
        ItemName: "Beitrag",
        table_x: '',
        aslug: '',
        nf2:'',

        fieldtype: "", // Oder ein sinnvoller Standardwert

        // nf: this.getOF(),
        readingTime: "",
        fileName: '' ,
        sortedOptions: "",
            so: [],
            xsor_alt: {},

        isOpen: true,
        uploadedImageUrl: null,
        csrfToken: document.getElementById('token').value,
        preview_image: {},
            ffo: [],
            ulimage: null,


            //         name: "testname",
            //         type: "text",
            //         value: "valuei"
            // }],
            // formFields:  {},
            ///formFields:[],
            options:    {},
            options_sel: {},
            //   formData: {},
            // field: [{ name: '', label: '', type:'' } ],

            // formData: {},
           // formFields: {}, // FormField-Daten
            //formData: reactive({}), // Dynamisch erstelltes Formular-Objekt
                sdata: {},
            loading: false,
            loadingText: null,
            //
            confirmingTableDeletion: false,
            //

        };
    },
    computed: {



                sortedOptions() {


                }
        // if (!this.options || !Array.isArray(this.options)) return [];



        // const sorted = this.options.map(obj => {
        //     return Object.fromEntries(
        //         Object.entries(obj).map(([outerKey, innerObj]) => {
        //             const rawInnerObj = innerObj;


        //             const sortedInner = Object.fromEntries(
        //                 Object.entries(rawInnerObj)
        //                     .sort(([, a], [, b]) => {

        //                         if (typeof a === 'string' && typeof b === 'string') {
        //                             return a.localeCompare(b);
        //                         } else if (typeof a === 'number' && typeof b === 'number') {
        //                             return a - b;
        //                         }
        //                         return 0;
        //                     })
        //             );

        //             return [outerKey, sortedInner];
        //         })
        //     );
        // });

        // nextTick(() => {
        //     console.log("Nach der Sortierung:", JSON.stringify(sorted, null, 2));
        // });

        // return sorted;


,


    // sortedOptions() {
    //     let options;
    //     if (Array.isArray(this.options)) {
    //         options = [...this.options];  // Kopiere das Array
    //     } else if (typeof this.options === 'object') {
    //         options = Object.entries(this.options).map(([key, value]) => [key, value]);
    //     } else {
    //         options = [];
    //     }
    //     console.log('sortedOptions:', options); // Überprüfe den Inhalt von sortedOptions
    //     console.log(JSON.stringify(this.options));
    //     return options;
    // },
    isRightsReady() {
      return this.$isRightsReady; // Zugriff auf globale Methode
    },
    hasRight() {
      return this.$hasRight; // Zugriff auf globale Methode
    },
    sortedOptions_sel() {
        let options_sel;
        if (Array.isArray(this.options_sel)) {
            options_sel = [...this.options_sel];  // Kopiere das Array
        } else if (typeof this.options_sel === 'object') {
            options_sel = Object.entries(this.options_sel).map(([key, value]) => [key, value]);
        } else {
            options_sel = [];
        }
        //console.log('sortedOptions_sel:',options_sel); // Überprüfe den Inhalt von sortedOptions
        return options_sel;
    },
    fieldValue() {
        return this.field?.value || "";
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
                if (!field.name.includes("_id") && !field.name.includes("_iid"))
                {
                    acc[field.name] = this.formData[field.name] || field.value;
                }

                return acc;
            }, {});
        },
        readingTime() {
            return this.field?.value || 1; // Falls field.value leer ist, dann 0 setzen
        },
    },
    watch:{
        modelValue(newVal) {
    // console.log("modelValue wurde aktualisiert:", newVal);
  },
        ffo: {
            deep: true,
            handler(newFields) {
                const textareaField = Object.values(newFields).find(field =>
                    ["textarea"].includes(field.type)
                );
                this.textareaField = textareaField;
                if (textareaField &&  document.getElementById("reading_time")) {

                    this.readingTime = this.calculateReadingTime(textareaField.value);
                    this.readingTime = this.readingTime  < 1 ? "1" : this.readingTime;
                   // console.log("RT:"+this.readingTime);
                }
                let fod = {};

            }

        },
        'field.value': {
      immediate: true, // Direkt beim Laden ausführen
      handler(newId) {
        if (newId) {
          this.fetchImage(newId,this.tablex);
        }
      }
    },
    field: {
        handler(newField) {
      this.readingTime = newField?.value || 1;
    },
    deep: true, // Falls field ein Objekt ist
    immediate: true // Setzt den Wert direkt nach dem Mounten

        // handler(newField) {
        //     if (Array.isArray(newField) && newField.length > 0) {
        //         this.fieldValue = newField[0]?.value || "";
        //     }
        // },
        // immediate: true, // Führt den Watcher direkt beim Mounten aus

    },



        fieldValue(newValue) {
      this.readingTime = Math.ceil(newValue.trim().split(/\s+/).length / 190);

      if(this.readingTime == "0")
      {
        // this.readingTime = 1;
      }
      //console.log("Berechnete Lesezeit:", this.readingTime);
    },
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
            // console.log("formFields geändert:", newVal);
        },
        form: {
            handler: throttle(function () {
                let query = pickBy(this.form);
                let paramName = "table";
                // const path = window.location.pathname; // Gibt "/admin/tables/show/Example" zurück
                // const segments = path.split("/"); // Teilt den Pfad in Segmente auf
                // let lastSegment = segments[segments.length - 1];
                lastSegment = CleanTable();
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
        modelValue(newValue) {
        this.selectedValue = newValue;
        this.xval = newValue;
    }
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
   if(!$_GET['rl'])
    {
       //location.href = location.href + "?rl=2";
    }
    if($_GET['rl']  == "2")
    {
        let url = location.href.replace(/\?rl=2/g, '');
        history.pushState(null, "", url);
    }


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
        openModal_alt() {
    // console.log("Vor dem Setzen: " + this.isModalOpen);

    this.isModalOpen = !this.isModalOpen;
    if(this.Message)
    {


    this.$nextTick(() => {
      let editor = this.$refs.editor;

      // Falls es ein Array ist (z. B. bei dynamischen Komponenten)
      if (Array.isArray(editor)) {
        editor = editor[0];
      }

      if (!editor || !(editor instanceof HTMLElement)) {
        // console.log("Editor nicht gefunden oder kein HTML-Element:", editor);
        return;
      }

      editor.focus();

      const selection = window.getSelection();
      const range = document.createRange();

      // Cursor ans Ende des Inhalts setzen
      range.selectNodeContents(editor);
      range.collapse(false);

      selection.removeAllRanges();
      selection.addRange(range);
    });
    }
    // console.log("Nach dem Setzen: " + this.isModalOpen);
  },



        handleImageSelect(url) {
      this.$refs.editor.insertImage(url)
    },
        handleFileNameUpdate(fileName) {
      this.fileName = fileName;  // Setze den Wert von fileName
    },
    sanitizeContent(content) {
        if (content.includes('location') || content.includes('ancestorOrigins')) {
            return ''; // Oder einen Standardwert
        }
        return content;
    },
    async getSlug() {
        try {

            const response = await axios.get(`/api/getSlug/${this.xtable}/${this.xid}`);

            return response.data.autoslug || "";
        } catch (error) {
            console.error("No Slug Found");
            return "";
        }
    },
    async getOF() {
        const path = window.location.pathname; // Gibt "/admin/tables/show/Example" zurück
              this.xid = CleanId();
              this.xtable = CleanTable();
      try {
        const response = await axios.get(`/api/images/${this.xtable}/${this.xid}`);
        // alert(this.xid);

        this.nf = response.data;
      //  console.log(`/api/images/${this.xtable}/${this.xid}`);
        if(document.getElementById(this.column) && document.getElementById(this.column).value != "008.jpg"){

            this.nf = document.getElementById(this.column).value;
        }
        else if(this.nf === "[]")
        {
            this.nf = this.ffo[this.column]['value'];
        }
        else
        {
            this.nf = this.ffo[this.column]['value'];
        }
        return this.nf;
      } catch (error){
        console.error("Not fetchable");
      }
    },
        async fetchImage(id,table) {
      try {
        if(!id){
           id = this.imageId;
        }
        const response = await axios.get(`/api/images/${table}/${this.xid}`); // Laravel API-Route
        //console.log(response);
        if (response.data.url) {

          this.ulimage = response.data.url;
        } else {
          console.warn("Keine URL gefunden für ID:", id);
        }
      } catch (error) {
        console.error("Fehler beim Laden des Bildes:", error);
      }

  },
      closeModal() {
      this.isModalOpen = false;
      let previewImage = null;
      this.previewImage = null;
      // Schließe das Modal
    },
    handleInput(event) {
    this.readingTime = event.target.value;
    this.updateFormData();
  },
    handleImageUpload(imageUrl) {
        imageUrl = imageUrl.replace("images/blogs/big/",'').replace("images/images/big/",'').replace("undefined",'');
     console.log("Bild-URL:", imageUrl);
      this.uploadedImageUrl = imageUrl;
      this.nf2 = imageUrl;
      const ima_new = this.nf2;
    //    this.imageId = iid;
    },

        updateReadingTime() {
            if (!Array.isArray(this.ffo) || this.ffo.length === 0) {
                //console.log("FFO ist leer oder kein Array:", this.ffo);
                return;
            }
            if (!this.ffo || this.ffo.length === 0) return;
            // console.log("ft:" + field.type);
            const textareaField = this.ffo.find(field => ['textarea'].includes(field.type));
            if (textareaField) {

                this.readingTime = this.calculateReadingTime(textareaField.value);
            }
        },
        calculateReadingTime(text) {
            if (!text) return 0;
            const wordsPerMinute = 190;
            const words = text.trim().split(/\s+/).length;
            return Math.round(words / wordsPerMinute,1);
        },
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
            if (fieldName.includes("_id") || this.fieldtype == "select"){
            this.formDatas[fieldName] = value;
            }
            if(fieldName.includes("_iid"))
            {
                this.formData[fieldName] = value;
            }
            if(fieldName == "img_x" || fieldName == "img_y")
            {
                this.formData[fieldname] = this.value;
            }
            if(this.fieldtype == "autoslug")
            {
                this.formData[fieldname] = value;
            }
            if(this.fieldname == this.column)
            {
                this.formData[this.column] = value;
            }
            // console.log("aaaaaaaa" + JSON.stringify(this.formDatas,null,2));
        },
        stripslashes(input) {
  if (typeof input === 'string') {
    // Entfernt Backslashes aus dem String
    return input.replace(/\\(.)/g, '$1');
  } else if (Array.isArray(input)) {
    // Falls es ein Array ist, wende die Funktion auf jedes Element an
    return input.map(item => stripslashes(item));
  } else if (typeof input === 'object' && input !== null) {
    // Falls es ein Objekt ist, wende die Funktion rekursiv auf alle Werte an
    let result = {};
    for (let key in input) {
      if (input.hasOwnProperty(key)) {
        result[key] = stripslashes(input[key]);
      }
    }
    return result;
  }
  return input; // Falls es weder ein String noch ein Array noch ein Objekt ist, gebe den Wert unverändert zurück
},
        setFormField(field,name) {

            // Directly setting the value in formData
            // console.log(field);
            // console.log(field.name);
            // console.log(field.type);
            if(field.name == "reading_time")
            {
                 this.formData['reading_time'] = this.readingTime;
            }
            if(field.type == "IID")
            {
                this.formData[field.name] = this.ref2;
            }
            if(field.type === "select_id")
            {

                this.getsel(field.name);

            }
            if(field.type === "select")
            {
                this.getsel_enum(field.name,this.tablex);
               // console.log("sso:" + JSON.stringify(this.options));
            }

            if (field.name.includes("_id")) {
                this.formData[field.name] = this.formDatas[field.name];
            }
            else if(field.type === "IID")
            {
                this.formData[field.name] = this.formDatas[field.name];
            }
            else if(field.type === "select")
            {
                this.formData[field.name] = this.formDatas[field.name];
            }
            else if (field.name == "img_x" || field.name == "img_y" || field.type == "autoslug") {
                this.formData[field.name] = field.value;
            }

            else{
                this.formData[field.name] = field.value || "";
            }

        },
        debugUpdateTableData() {
            // console.log("updateTableData wird aufgerufen!");
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
        getsel(name) {
    var sortedOptions = this.sortedOptions ?? [];
    let sdata = this.sdata ?? {};
    axios
        .get(routes.getselroute(name))
        .then((response) => {
            if (!Array.isArray(this.sortedOptions)) {
                this.sortedOptions = []; // Leeres Array initialisieren
            }

            let input = response.data;


            const output = [];
            if (typeof input === 'object' && !Array.isArray(input)) {
                input = Object.entries(input).map(([key, value]) => value);
                }
            input.sort((a, b) => a.position - b.position);
            this.options2 =  this.options2 ?? [];
            this.options2 = input;

            // Zuerst das Objekt in ein Array umwandeln und die ID/Name-Paare speichern
            Object.entries(input).forEach(([key, value]) => {
                // Entfernen von "sortedOptions" aus dem Key, falls vorhanden
                const cleanedKey = key.replace('.sortedOptions', '');

                // Überprüfen, ob der Key ein String ist und ob er einen Punkt enthält
                if (typeof cleanedKey === 'string' && cleanedKey.includes('.')) {
                    const parts = cleanedKey.split('.'); // Key in zwei Teile aufteilen

                    if (parts.length === 2) {
                        const [prefix, suffix] = parts;
                        const newKey = `${suffix}.${prefix}`; // Reihenfolge umdrehen
                        output.push({ id: newKey, name: value });
                    } else {
                        output.push({ id: cleanedKey, name: value });
                    }
                } else {
                    // Falls der Key keinen Punkt enthält, oder nicht als String vorliegt, Key unverändert lassen
                    output.push({ id: cleanedKey, name: value });
                }
            });

            // Sortiere die Optionen nach 'name'
            output.sort((a, b) => a.name.localeCompare(b.name)); // Sortieren nach Namen

            // Nun haben wir die ID/Name-Paare nach Name sortiert
            const sortedObj = output.map(item => ({
                [item.id]: item.name
            }));

            let obj = JSON.stringify(input,null,2)

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
    .replace(/},\s*{/g, '},')
    .replace(/},/g,"},{");
    // obj = '{\n\"' + name + '": [\n' + obj + '\n]   \n}';
    //console.log("ob: " + obj);
            obj  = "["+obj+"]";
            obj = obj.replace(/[\u0000-\u001F\u007F]/g, '');

            input = obj;
        })
        .catch((error) => {
            console.error("Fehler beim Abrufen der Formulardaten:3", error);
        });
}

,
        getsel_enum(name,table,iscope='getselenumroute')
        {
            var sortedOptions_sel = this.sortedOptions_sel ?? [];
            let sdata_sel = this.sdata_sel ?? {};
            axios
                .get(routes[iscope](table, name))
                .then((response) => {

                    sdata_sel = JSON.stringify(response.data);
                    // console.log(sdata_sel);
                    //sdata = sdata.replace(new RegExp(name, "g"), '');
                    sdata_sel = JSON.parse(sdata_sel);
                    // 1. JSON-String in Objekt umwandeln
                    // const parsedData = JSON.parse(jsonString);

                    // 2. Nur das ".sortedOptions" Objekt extrahieren
                    // const sortedOptionsData = parsedData[".sortedOptions"];

                    // 3. In `sortedOptions` speichern
                    if (!Array.isArray(this.sortedOptions_sel)) {
                        this.sortedOptions_sel = []; // Leeres Array initialisieren
                    }
                    // this.sortedOptions[name] = sortedOptionsData;

                                       // sortedOptions[name] = sortedOptionsData;


                    // Die Struktur umkehren
                    // Object.entries(this.sortedOptions).forEach(([key, value]) => {
                    //     if (value.sortedOptions) {
                    //         sortedOptions[key] = value.sortedOptions;
                    //     }
                    // });

                    const input = (sdata_sel);
                    const output = {};

                    // Durch alle Einträge iterieren und die Keys umwandeln
                    Object.entries(input).forEach(([key, value]) => {
                        // Entfernen von "sortedOptions" aus dem Key, falls vorhanden
                        const cleanedKey = key.replace('.sortedOptions_sel', '');

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

                    this.sortedOptions_sel.push(output);
                    this.options_sel = this.sortedOptions_sel;

                })
                .catch((error) => {
                    console.error(
                        "Fehler beim Abrufen der Formulardaten2:",
                        error,
                    );

                });

        },
        getdefnf(){

             if(document.getElementById(this.column) && document.getElementById(this.column) != "008.jpg")
             {
                 this.nf = document.getElementById(this.column).value;
             }



        },
        fetchFormData() {
    axios
        .get(routes.getform(CleanTable(),CleanId()))
        .then((response) => {
            this.formFields = response.data;
            let formFields_old = response.data;
            // JSON bereinigen
            //console.log("Rohdaten:", JSON.stringify(response.data,null,2));

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
            // obj = "[" + obj + "]";
            // console.log("OBJ: " + (obj));
            obj = obj.replace(/[\u0000-\u001F\u007F]/g, '');
            try {
                obj = JSON.parse(obj);

            } catch (error) {
                console.error("❌ JSON-Fehler:", error.message);
            }
            // obj = JSON.parse(obj);
            this.oobj = obj;
            this.obj2 = obj;
            // console.log(obj);
            this.ffo = obj
            //console.log("ffo: "+JSON.stringify(obj));
            const ffo = this.ffo;
            // 💡 Konvertiere das Objekt in ein Array
            const formFieldsArray = Object.values(formFields_old);

            // console.log("FormFields als Array:", formFieldsArray);

            formFieldsArray.forEach((field) => {
                if (typeof field === "object" && field !== null) {
                    Object.entries(field).forEach(([subKey, subValue]) => {
                        this.setFormField(subValue, subValue.name);
                    });
                }

            });

        })
        .catch((error) => {
            console.error("Fehler beim Abrufen der Formulardaten5:", error);
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
    // console.log("NO ID@" + key);
    // console.log(`${key}: ${value['value']}`);

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
            // console.log(this.formData['content']);



            // console.log("ref: " + this.$refs.blog_images_iid.value);
                       this.formData2 = JSON.stringify(this.remom(this.ffo));

            // const path = window.location.pathname; // Gibt "/admin/tables/show/Example" zurück
            // const segments = path.split("/"); // Teilt den Pfad in Segmente auf
            this.xid = CleanId();
            xid = CleanId();
            tablex = CleanTable();
            let response;
            this.formData = this.formData ?? {};
            // var inputRef = this.$refs.this.column;
            if(this.textareaField &&  document.getElementById("reading_time"))
            {
                this.formData['reading_time'] = this.readingTime;

            }

            Object.keys(this.ffo).forEach(name => {

                const element = document.getElementById(name);
                const element_alt = document.getElementById(name + "_alt");
                if (element_alt?.value) {
                    this.formData[name] = element_alt.value
                        .replace(/\[/g, '%5B')
                        .replace(/\]/g, '%5D');
                }

                else if (element?.value) {
                    this.formData[name] = element.value
                        .replace(/\[/g, '%5B')
                        .replace(/\]/g, '%5D');
                }
                else if(element_alt?.innerHTML)
                {
                    this.formData[name] = element.innerHTML
                        .replace(/\[/g, '%5B')
                        .replace(/\]/g, '%5D');
                }
                else if(element?.innerHTML)
                {
                    this.formData[name] = element.innerHTML
                        .replace(/\[/g, '%5B')
                        .replace(/\]/g, '%5D');
                }

            });

            if(this.ffo['profile_photo_path'] || this.formData['profile_photo_path'])
                {
                    this.formData["profile_photo_path"] = document.getElementById("profile_photo_path").value;
                }
                if(this.ffo['image_path'] || this.formData['image_path'])
                {
                    this.formData["image_path"] = document.getElementById("image_path").value;
                }
                // console.log("ffo:" + JSON.stringify(this.formData,null,2));
              const path = window.location.pathname; // Gibt "/admin/tables/show/Example" zurück
            const segments = path.split("/"); // Teilt den Pfad in Segmente auf
            if(segments[segments.length - 2] == "create")
            {
                response = await axios.post(`/admin/tables/store/${this.tablex}`, {
                formData: this.formData
            });
            }

            else{

                var xid = CleanId();
                var tablex = CleanTable();
                // const formData = {...this.formData };
                response = await axios.post(`/admin/tables/update/${tablex}/${xid}`, {
                formData : this.formData,
            });

        }

        } catch (error) {
            console.error("Fehler beim Absenden:", error);
        }
        console.log("Daten, die gesendet werden:",this.formData);
        // location.href='/admin/tables/show/'+this.tablex;
    },
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
        var tablex = CleanTable();
        var id = CleanId();
        const response = await axios.put(`/admin/tables/update/${tablex}/${id}`,{formData: this.formData});

        if (response.data) {
            this.loading = false;
            // console.log("Daten erfolgreich gespeichert!", response.data);
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
            // console.log("selectTableImage id:", id);
            this.form.table_image_id = id;
        },
        emptyChecker(){
            if(this.formData.length < 1)
            {
                alert("empty");
            }
        },
        getImageUrl()
        {
            const id = CleanId();
            let table = CleanTable();
            this.ttable = table
//console.log(`/api/get-image-id/${table}/${id}`);
        // Axios Anfrage
        axios.get(`/api/get-image-id/${table}/${id}`)
             .then(response => {
                // Die Antwort enthält die URL des Bildes
                const imageId = response.data.iid;
                this.imageId = imageId;
                const imageUrle = response.data.url;
                this.imageUrle = imageUrle;
                //console.log(this.imageUrle);
                return imageUrle;
            })
            .catch(error => {
                console.error("Fehler beim Abrufen der URL:", error);
            });

    },

    },
    async mounted() {
         //this.fetchDataX();

         this.settings = await GetSettings();
         this.xid = CleanId();
        this.xtable = CleanTable();
        const path = window.location.pathname;
        if (path.includes("create") && (!hasRight('view', this.xtable) || !hasRight('add', this.xtable))) {
            location.href = "/no-rights";
        }
        else if (path.includes("edit") && (!hasRight('view', this.xtable) || !hasRight('edit', this.xtable))) {
            location.href = "/no-rights";
        }
        this.column =  this.settings.impath?.[this.xtable] ?? this.settings.impath?.['default'];

        // console.log("col:" + this.column);
        this.table_alter = this.settings.impath?.[this.xtable] ? '' : "/images/"+this.tablex+"/thumbs/";
        this.table_older = this.settings.impath?.[this.xtable] ? "" : "/images/"+this.tablex+"/thumbs/";
         this.getImageUrl();

        this.fetchFormData();
        this.updateData();
        this.emptyChecker();
        this.updateReadingTime();

        this.aslug = await this.getSlug();
        if(!this.nf)
        {
            this.nf = this.getdefnf();
        }
        this.table_image = "images";
        // const inputRef = this.$refs.blog_images_iid?.value;
        // console.log("iR:" + inputRef);
        //     if (Array.isArray(inputRef) && inputRef.length > 0) {
        //         this.ref2 = inputRef[1]._value;
        //

        this.fetchImage(this.ref3,this.table_image);
        // alert("yes");
    //     console.log("sortedOptions:", this.sortedOptions);
    // console.log("field.name:", this.field?.name);
    // console.log("sortedOptions[field.name]:", this.sortedOptions[this.field.name]);
    // console.log("field.name:", this.field?.name);
    // console.log(this.ffo[this.column].value);
    this.nf2 = this.ffo[this.column]?.value;
    },
    created() {
        this.updateReadingTime();
        // this.fetchFormData();
        // console.log("FIELD:", this.field); // 👀 Prüfen, ob es existiert
    },
});
</script>
<style scoped>
select,datetime-local   {
    max-width:560px !important;
}
.editor a:link,.editor a:visited,.editor a:active,.editor a {
  color: #2563eb !important; /* z. B. Tailwind blue-600 */
  text-decoration: underline;
}
@media (min-width: 1024px) {
    /* .w-full {
        width: 100% !important;
    } */
}
</style>
