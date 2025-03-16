<template>
    <layout>
        <div v-if="ocont.id" class="p-4 bg-layout-sun-200 dark:bg-layout-night-200">
        <hgroup>
            <h1 class="text-2xl font-bold">{{ decodeEntities(ocont.slug) }}</h1>
            <h4>{{decodeEntities(ocont.description).replace("fx_year()",new Date().getFullYear())}}</h4>
        </hgroup>
      </div>
      <div>
        <div
                class="p-2 md:p-4"
                v-if="entries.length == 0 && !form.search"
            >
                <alert type="warning">
                    Zurzeit liegen keine Bilder vor!
                </alert>
            </div>
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
                        <div class="flex justify-between items-center">
                    <search-filter
                        v-model="form.search"
                        class="w-full"
                        @reset="reset"
                    >
                    </search-filter>
                </div>

                <div v-if="entries.length == 0 && form.search">
                    <alert type="warning">
                        Für den vorgegebenen Suchbegriff wurden keine
                        Blogartikel gefunden.
                    </alert>
                </div>
                        <div v-for="entry in entries" :key="entry.id"
    class="block max-w-sm gap-3 mx-auto sm:max-w-full group mb-4
           lg:grid lg:grid-cols-12 bg-layout-sun-100 dark:bg-layout-night-100
           border-2 border-layout-sun-300 dark:border-layout-night-300 p-4"

>
      <!-- Linke Spalte: Thumbnail -->
      <div class="relative lg:col-span-3">
        <img
          :src="'/images/images/thumbs/' + entry.image_path"
          :alt="entry.title"
          class="w-full  rounded bg-layout-sun-500 dark:bg-layout-night-500 imgprev"
        />
      </div>

      <!-- Mittlere Spalte: Überschrift, Beschreibung und Kommentar-Slot -->
      <div class="p-6 space-y-2 lg:col-span-6">
        <h2 class="text-xl font-semibold sm:text-2xl font-title whitespace-pre-line">
          {{ formatText(decodeEntities(entry.headline)) }}
        </h2>

        <p class="text-layout-sun-700 dark:text-layout-night-700 whitespace-pre-line">
          {{ formatText(decodeEntities(entry.message)) }}</p>
          <p v-html="text"></p>



        <slot name="comments">
            <Comments :postId="entry.id" />
        </slot>
    </div>
      <!-- Rechte Spalte: Kurzinfos, Bewertungs-Slot, Datum und optionale Kameraangabe -->
      <div class="p-6 space-y-2 lg:col-span-3">
        <div class="text-sm font-semibold text-layout-sun-800 dark:text-layout-night-800">
          <h3>Kurzinfos</h3>
        </div>

        <slot name="rating">rating</slot>
        <span v-if="editOn || deleteOn" class="flex space-x-2">
        <!-- Edit Icon -->
        <span v-if="editOn"
                class="np-dl-td-edit inl"
                @click.prevent="editDataRow(entry.id)">
            <icon-pencil class="w-6 h-6" v-tippy />
            <tippy>{{ editDescription }}</tippy>
        </span>

        <!-- Delete Icon -->
        <span v-if="deleteOn"
                class="np-dl-td-edit inl"
                @click="deleteDataRow(entry.id)">
            <icon-trash class="w-6 h-6" v-tippy />
            <tippy>{{ deleteDescription }}</tippy>
        </span>
        </span>

        <div class="text-xs text-layout-sun-600 dark:text-layout-night-600">
          <display-date :value="entry.created_at" :time-on="false" />
          </div>

        <div v-if="entry.camera" class="text-xs text-layout-sun-600 dark:text-layout-night-600">
          <IconCamera />&nbsp;&nbsp;{{ entry.camera }}
        </div>
      </div>
    </div>
    </layout>
</template>



<script>
import Layout from "@/Application/Homepage/Shared/Layout.vue";
import IconPlusCircle from "@/Application/Components/Icons/PlusCircle.vue";
import IconPencil from "@/Application/Components/Icons/Pencil.vue";
import Comments from "@/Application/Components/Social/comments.vue";
import SearchFilter from "@/Application/Components/Lists/SearchFilter.vue";
import IconCamera from "@/Application/Components/Icons/Camera.vue";
import { throttle } from 'lodash';
import mapValues from "lodash/mapValues";
import pickBy from "lodash/pickBy";
import IconEye from "@/Application/Components/Icons/Eye.vue";
import IconTrash from "@/Application/Components/Icons/Trash.vue";
import DisplayDate from "@/Application/Components/Content/DisplayDate.vue";
import he from "he";
import { route } from 'ziggy-js';

  export default {
    components: { Layout,DisplayDate,IconPencil,IconPlusCircle,IconTrash,IconCamera,SearchFilter,Comments },
    data() {
        return {
            form: {
                search: this.filters.search,
            },
        routeCreate: "/admin/tables/create/images" ,
        routeDelete: "/admin/tables/delete/images/",
        routeEdit: "admin.tables.edit" ,

        };
    },
    watch: {
        form: {
            handler: throttle(function () {
                let query = pickBy(this.form);
                //
                const path = window.location.pathname; // Gibt "/admin/tables/show/Example" zurück
                const segments = path.split("/"); // Teilt den Pfad in Segmente auf
                var tablezz  = segments[segments.length - 1];
                this.$inertia.get(
                    this.route("home.images.gallery.search", { slug:tablezz }), // Table als Parameter übergeben
                    Object.keys(query).length ? query : { remember: "forget" },
                    {
                        preserveState: true,
                    }
                );
            }, 150),
            deep: true,
        },
    },
    props: {
        filters: {
            type: Object,
            default: () => ({}),
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
        entries: {
        type: [Array],
        default: () => [], // Standardwert setzen, falls keine Daten kommen
      },
      ocont: {
        type: [Array,Object],
        default: () => [], // Standardwert setzen, falls keine Daten kommen
      },
      editOn:{
        default: true,
      },
      deleteOn:{
        default: true,
      },
      createOn:{
        default: true,
      },
      deleteDescription:{
        default: "Eintrag Löschen",
      },
      editDescription:{
        default: "Eintrag bearbeiten",
      },
    },
    methods: {
        reset() {
            this.form = mapValues(this.form, () => null);
        },
        formatText(text) {
    return text.replace(/\n/g, '<br />');
  },
      decodeEntities(text) {

        if(text){
            text = text?.replace(/<br\s*\/?>/g, '\n'); // Wandelt HTML-Entitäten in Zeichen um
            // text text?.replace(/\n',<br\s*\/?>)
            return he.decode(text);
        }
        else{
            return "";
        }


      },
      deleteDataRow(id) {

            if (confirm("Wollen Sie diesen Beitrag wirklich löschen?")) {
                axios
                    .delete(this.routeDelete + id)
                    .then(() => {
                        this.$emit("deleted"); // Event nach erfolgreichem Löschen
                       // console.log(this.routeDelete + id);
                        location.reload();
                    })
                    .catch((error) => {
                        console.error("Fehler beim Löschen:", error);
                    });
            }
        },
        editDataRow(id) {
            const path = window.location.pathname; // Gibt "/admin/tables/show/Example" zurück
            const segments = path.split("/"); // Teilt den Pfad in Segmente auf
            const table = segments[segments.length - 1];

            var rt = `/admin/tables/edit/${id}/images`;

            location.href=rt;
        },
    },
  };
  </script>

  <style scoped>
.imgprev{

height:260px;
object-fit:cover;
width:auto;

}
.inl{
border:0;
}
/* Optional: Füge hier benutzerdefinierte Styles hinzu */
  </style>
