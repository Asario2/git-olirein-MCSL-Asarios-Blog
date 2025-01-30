        <!-- <template> -->
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
                        'Tabelle {{ tablez  }}': route('admin.tables.show',{table_alt:table_alt,id:rows.id}),
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
                    <template style="display: inline-block">
                        <div>


                            <form @submit.prevent="submitForm">

                                <div v-for="field in formFields" :key="field.id">
                                    <input-group>
                                    <!-- Dynamische Felder basierend auf Feldtyp -->
                                <div v-if="field && field.type === 'text'">
                                <InputFormText
                                    :id="field.id || field.name"
                                    :name="field.name"
                                    :value="field.value"
                                    v-model="field.name"
                                    :ref="field.name"
                                    :placeholder="field.placeholder || ''"
                                >
                                    <template #label>{{ field.label }}</template>
                                </InputFormText>
                                </div>
                                </input-group>
                                <div v-if="field && field.type === 'datetime'">
                                    <InputFormDateTime
                                    :id="field.id"
                                    :name="field.name"
                                    :value="field.value"
                                    :ref="field.name"
                                    v-model="field.name"
                                    :placeholder="field.placeholder || ''"
                                    :class="field.class"
                                >
                                    <template #label>{{ field.label }}</template>
                                </InputFormDateTime>
                                </div>

                                <div v-if="field && field.type === 'textarea_short'">
                                    <InputFormTextArea
                                    :id="field.id"
                                    :name="field.name"
                                    v-model="field.name"
                                    :value="field.value"
                                    :ref="field.name"
                                    :placeholder="field.placeholder || ''"
                                    :class="field.class"
                                >{{ field.value }}
                                    <template #label>{{ field.label }}</template>
                                </InputFormTextArea>
                            </div>
                            </div>
                            <button type="submit" class="bg-blue-500 text-white p-2 rounded">Absenden</button>
                            </form>
                        </div>
                        </template>
                                <!-- <div v-for="field in formFields" :key="field.name">
                                <label :for="field.name">{{ field.label }}</label>
                                <div v-if="field && field.type === 'text'">
                                    <input
                                        type="text"
                                        :id="field.name"
                                        :name="field.name"
                                        :value="field.value"

                                        :placeholder="field.placeholder || ''"
                                        class="w-full
                                                p-2.5
                                                text-sm
                                                rounded-lg
                                                block
                                                border
                                                focus:ring-3
                                                focus:ring-opacity-75

                                                bg-layout-sun-0
                                                text-layout-sun-900
                                                border-primary-sun-500
                                                focus:border-primary-sun-500
                                                focus:ring-primary-sun-500
                                                placeholder:text-layout-sun-400

                                                selection:bg-layout-sun-200
                                                selection:text-layout-sun-1000

                                                dark:bg-layout-night-0
                                                dark:text-layout-night-900
                                                dark:border-primary-night-500
                                                dark:focus:border-primary-night-500
                                                dark:focus:ring-primary-night-500
                                                placeholder:dark:text-layout-night-400

                                                dark:selection:bg-layout-night-200
                                                dark:selection:text-layout-night-1000"
                                        />
                                </div>
                            </div>-->
                            <pre>{{ formData }}</pre>
                        <pre>{{ formFields }}</pre>
                        <pre>{{ datax }}</pre>


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
import { onMounted } from 'vue'

const data = ref(null)
const loading = ref(true)
const error = ref(null)

const fetchData = async () => {
loading.value = true
error.value = null
try {
const response = await fetch("tables/form_data/"+table+"/" + id)
if (!response.ok) {
throw new Error('Network response was not ok')
}
datax.value = await response.json()
console.log("asd:" + datax);
} catch (err) {
error.value = err.message
} finally {
loading.value = false
}
}

onMounted(() => {
fetchData()
})



    const path = window.location.pathname; // Gibt "/admin/tables/show/Example" zurück
    const segments = path.split('/'); // Teilt den Pfad in Segmente auf
    const lastSegment = segments[segments.length - 2];
    const id = segments[segments.length - 1];
    const table = segments[segments.length - 2];
    let table_z = lastSegment;
    let table_alt = table_z;
    import { defineComponent } from "vue";
    import { ref } from 'vue';



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
    import { throttle } from 'lodash';
    import DialogModal from "@/Application/Components/DialogModal.vue";
    import { reactive } from 'vue';
    import Alert from "@/Application/Components/Content/Alert.vue";

    export default defineComponent({
        name: "Admin_TableForm",

        components: {
            Layout,
            Breadcrumb,
            SmoothScroll,
            PageTitle,
            InputFormDateTime,
            InputFormText,
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
            InputFormTextArea,
            InputError,
            DialogModal,
            Alert,
        },

        props: {
            table: {
                type: Object,
                default: () => ({}),
            },
            formFields:{
                type: Object,
                default: () => ({}),
            },
            editstate: {
                type: String,
                default:''
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
        formData:{
            type: Array,
            default: [],
        },
        },

        data() {
            return {

            //     formFields: [{

            //         name: "testname",
            //         type: "text",
            //         value: "valuei"
            // }],
            ///formFields:[],
            formFields:  {
                "idField": {
                "name": "id",
                "type": "text",
                "label": "ID",
                "value": "2",
                "id": "2",
                "class": "disabled",
                "rows": "8"
            },
                "nameField": {
                "name": "name",
                "type": "text",
                "label": "Name",
                "value": "Devlog",
                "id": "2",
                "class": "text",
                "rows": "8"
            },
                "summaryField": {
                "name": "summary",
                "type": "textarea_short",
                "label": "Kurzfassung",
                "value": "short description of this one",
                "id": "2",
                "class": "textarea_short",
                "rows": "4"
            },
                "created_atField": {
                "name": "created_at",
                "type": "datetime",
                "label": "Erstellt am:",
                "value": "2025-01-22 09:02:27",
                "id": "2",
                "class": "datetime",
                "rows": "8"
            }

    },
        //   formData: {},
            // formData: [{ name: '', label: '', type:'' } ],

            formData: {


        },


    formData : {},







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
            formData() {
                return this.$page.props.formData;
            },
            formFields() {
                return this.$page.props.formFields
            },
        },
    watch: {

    formFields(newVal) {
        console.log("formFields geändert:", newVal);
    },
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
    setup() {




        // Instead of using $set, just update directly
        // formData.field1 = 'new value';

        return {
        ///  formData
        };
    },
        methods: {


            setFormField(field) {
        // Directly setting the value in formData
        this.formData[field.name] = field.value || '';
            },
            confirmTableDeletion() {
                this.confirmingTableDeletion = true;
            },
            cleanArray(array) {
                return array.filter(value =>
                    (typeof value === "string" && value.trim().length > 0) || typeof value === "number"
                );
            },
            async fetchFormData() {
            try {

            const response = await axios.get(route("GetTableForm", [table, id]));
            response=>response.json();
            console.log("tables/form-data/"+ table +"/" + id);
            // console.log(response.data);
            this.formFields = response.data;
            var formFields_old = response.data;
            var obj = JSON.stringify(this.formFields,null,2);
            obj = obj.replace(/"formFields": \[.*\]/, '');
            obj =  obj.replace(/^\{|\}$/g, '');

            obj = obj.replace(/}\s*,\s*\n\s*}/g, "},").replace(/[\[\]]/g, '').replace(/\[|\]$/, '');
            // obj = obj.replace(/},/g, "");
            obj = obj.replace(/,\s*\n\s*{/g, ',');

            //     console.log("new:"+JSON.stringify(obj, null, 2));
            obj = obj.replace(/\s*\}(?!,)\s*/g, '}');;
            obj = obj.replace(/}},/g, '\n   },');
            obj = obj.replace(/}}/g, '\n   }\n  }');

            this.formFields = obj;
            var fields = obj;
            console.log(this.formFields);

            formFields_old.forEach((field) => {
            //this.$set(this.formData, field.name, field.value || '');
            this.setFormField(field);

            console.log(field);
            });
            // Initialisiere das Formular-Daten-Objekt
            // this.formFields.forEach(field => {
            //     this.formData[field.name] = "";
            // });
        } catch (error) {
            console.error("Fehler beim Abrufen der Formulardaten:", error);
        }
        },
        submitForm() {
            console.log(JSON.stringify(this.formData,null,2)); // Formular-Daten absenden
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
                    }
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
                    }
                );
            },

            selectTableImage(id) {
                console.log("selectTableImage id:", id);
                this.form.table_image_id = id;
            },
        },
        mounted() {
            // API-Anfrage zum Abrufen der Daten
            axios.get(route("GetTableForm", [table, id]))  // Ersetze dies durch die tatsächliche API-URL
        .then(response => {
        //    this.formFields = response.data.formFields;  // Setze die abgerufenen Daten in den lokalen Zustand
        })
        .catch(error => {
            console.error('Fehler beim Abrufen der Daten:', error);
        });

    this.fetchFormData();


    },
    created() {
        var formData = [];
        if (typeof this.formFields === 'object' && !Array.isArray(this.formFields)) {
        const fieldsArray = Object.values(this.formFields);
        fieldsArray.forEach(field => {
        if (field.name) {

                formData[field.name] = field.value || '';

        }
        });
        }
    }
        });

    </script>
