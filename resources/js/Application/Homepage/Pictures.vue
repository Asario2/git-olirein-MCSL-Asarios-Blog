<template>
    <layout :header-title="'Bilder - ' + ocont.slug">
        <div @click="handleBodyClick">
        <div v-if="ocont.id" class="p-4 bg-layout-sun-200 dark:bg-layout-night-200">
        <hgroup>
            <h1 class="text-2xl font-bold">{{ decodeEntities(ocont.slug) }}</h1>
            <h4 v-html="ocont.description.replace('fx_year()', new Date().getFullYear()).replace(/\n/g, '<br />')"></h4>


        </hgroup>
        <input-icon-hyperlink
    v-if="createOn"
    :href="routeCreate"
    display_type="table"
>
    <template #icon>
        <icon-plus-circle class="button_icon"></icon-plus-circle>
        Erstelle
    </template>
</input-icon-hyperlink>

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

                <div v-if="entries.data.length == 0 && form.search">
                    <alert type="warning">
                        Für den vorgegebenen Suchbegriff wurden keine
                        Blogartikel gefunden.
                    </alert>
                </div>
                        <div id="gallery" v-for="entry in entries.data" :key="entry.id"
    class="w-full block max-w-sm gap-3 mx-auto sm:max-w-full group mb-4
        lg:grid lg:grid-cols-12 bg-layout-sun-100 dark:bg-layout-night-100
        border-2 border-layout-sun-300 dark:border-layout-night-300 p-4"

>
    <!-- Linke Spalte: Thumbnail -->
    <div class="relative lg:col-span-3">
        <a
  :href="'/images/images/big/' + entry.image_path"
  :data-pswp-width="entry.img_x"
  :data-pswp-height="entry.img_y"
>
 <ZoomImage
  :src="'/images/images/thumbs/' + entry.image_path"
  :alt="entry.title"
  :title="entry.title"
  :width="300"
  :height="300"
  class="imgprev"
/>
</a>
    </div>

    <!-- Mittlere Spalte: Überschrift, Beschreibung und Kommentar-Slot -->
    <div class="p-6 space-y-2 lg:col-span-6 ml-6">
        <h2 class="text-xl font-semibold sm:text-2xl font-title whitespace-pre-line">
        <p v-html="entry.headline"></p>
        </h2>

        <div class="text-layout-sun-700 dark:text-layout-night-700 whitespace-pre-line">
            <p v-html="entry.message"></p>
        </div>


            <SocialButtons :postId="entry.id" />
</div>


    <!-- Rechte Spalte: Kurzinfos, Bewertungs-Slot, Datum und optionale Kameraangabe -->
    <div class="p-6 space-y-2 lg:col-span-3">
        <div class="text-sm font-semibold text-layout-sun-800 dark:text-layout-night-800">
        <h3>Kurzinfos</h3>
        </div>
        <div v-if="entry.Format">
        <b>Format:</b> {{ entry.Format }}
        </div>
        <averageRating :postId="entry.id"  :av="parseFloat(ratings['original'][entry.id]?.average) || 0" :tot="ratings['original'][entry.id]?.total || 0"/>
        <span v-if="hasRight('delete', 'images') || hasRight('edit', 'images') " class="flex space-x-2">
        <!-- Edit Icon -->
        <span v-if="hasRight('edit', 'images') "
                class="inl"
                @click.prevent="editDataRow(entry.id)">
            <icon-pencil class="w-6 h-6 cursor-pointer" v-tippy />
            <tippy>{{ editDescription }}</tippy>
        </span>

        <!-- Delete Icon -->
        <span v-if="hasRight('delete', 'images') "
                class="inl"
                @click="deleteDataRow(entry.id)">
            <icon-trash class="w-6 h-6 cursor-pointer" v-tippy />
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
<!-- Pagination -->
<div class="flex items-center justify-center flex-wrap mt-6 -mb-1 text-xs md:text-base bg-transparent text-layout-sun-700 dark:text-layout-night-700">
                    <template v-for="(link, index) in entries.links" :key="index">
                        <!-- Deaktivierte Links -->
                        <div
                            v-if="!link.url"
                            class="flex items-center px-3 py-0.5 mx-1 mb-1 rounded-md cursor-not-allowed"
                        >
                            <span v-html="link.label"></span>
                        </div>

                        <!-- Aktive Seite -->
                        <a
                            v-else-if="link.active"
                            :href="link.url"
                            class="flex items-center px-2.5 py-0.5 mx-1 mb-1 h-7 transition-colors duration-200 transform rounded-md border border-primary-sun-500 text-primary-sun-900 dark:border-primary-night-500 dark:text-primary-night-900 hover:bg-layout-sun-200 hover:text-layout-sun-800 dark:hover:bg-layout-night-200 dark:hover:text-layout-night-800 font-bold"
                        >
                            <span v-html="link.label"></span>
                        </a>

                        <!-- Normale Links -->
                        <a
                            v-else
                            :href="link.url"
                            class="flex items-center px-2.5 py-0.5 mx-1 mb-1 h-7 transition-colors duration-200 transform rounded-md border hover:bg-layout-sun-200 hover:text-layout-sun-800 dark:hover:bg-layout-night-200 dark:hover:text-layout-night-800"
                        >
                            <span v-html="link.label"></span>
                        </a>
                    </template>
                </div>
</div>

    </layout>
</template>




<script>
import Layout from "@/Application/Homepage/Shared/Layout.vue";
import IconPlusCircle from "@/Application/Components/Icons/PlusCircle.vue";
import averageRating from "@/Application/Components/Social/averageratings.vue";
import IconPencil from "@/Application/Components/Icons/Pencil.vue";
import InputIconHyperlink from "@/Application/Components/Form/InputIconHyperlink.vue";
import SocialButtons from "@/Application/Components/Social/socialButtons.vue";
import ZoomImage from "@/Application/Components/Content/ZoomImage.vue";
import Share from "@/Application/Components/Social/share.vue";
//import PswpTemplate from "@/Application/Components/Content/pswptemplate.vue";
import AddRating from "@/Application/Components/Social/addrating.vue";
import SearchFilter from "@/Application/Components/Lists/SearchFilter.vue";
import IconCamera from "@/Application/Components/Icons/Camera.vue";
import IconComment from "@/Application/Components/Icons/IconComment.vue";
import { throttle } from "lodash";
import mapValues from "lodash/mapValues";
import pickBy from "lodash/pickBy";
import IconEye from "@/Application/Components/Icons/Eye.vue";
import IconTrash from "@/Application/Components/Icons/Trash.vue";
import DisplayDate from "@/Application/Components/Content/DisplayDate.vue";
//import PhotoSwipeLightbox from "photoswipe/dist/photoswipe-lightbox.esm.js";
// import PhotoSwipeLightbox from "photoswipe/dist/photoswipe-lightbox.esm.js";
import PhotoSwipeLightbox from 'photoswipe/lightbox';
import 'photoswipe/style.css';
import { CleanTable, CleanId } from '@/helpers';
// import 'photoswipe/src/photoswipe.css';
import he from "he";
import { nextTick } from "vue";
import { route } from "ziggy-js";
import IconShare from "@/Application/Components/Icons/IconShare.vue";
import IconStar from "@/Application/Components/Icons/IconStar.vue";
import { hasRight,loadAllRights,isRightsReady } from '@/utils/rights';
export default {
components: {
    Layout,
    DisplayDate,
    IconPencil,
    IconPlusCircle,
    IconTrash,
    IconCamera,
    SearchFilter,
    Share,
    // PhotoSwipeLightbox,
    AddRating,
    IconComment,
    IconShare,
    IconStar,
    InputIconHyperlink,
    averageRating,
    SocialButtons,
    ZoomImage,
},
data() {
    return {
        form: {
            search: this.filters.search,
        },
        routeCreate: "/admin/tables/create/images",
        routeDelete: "/admin/tables/delete/images/",
        routeEdit: "admin.tables.edit",
        showShareBox: {},
        showStarBox: {},
        showComments: {}, // Zustand für die Anzeige der Kommentarfunktion
        entry: { id: null },
        lightbox: null,
        rightsData: {},
        rightsReady: false,
        editOn: false,
        deleteOn: false,
    };
},
watch: {
    form: {
        handler: throttle(function () {
            let query = pickBy(this.form);
            var tablezz = CleanTable();
            this.$inertia.get(
                this.route("home.images.gallery.search", { slug: tablezz }),
                Object.keys(query).length ? query : { remember: "forget" },
                {
                    preserveState: true,
                }
            );
        }, 150),
        deep: true,
    },
},
computed:{

        isRightsReady() {
      return this.$isRightsReady; // Zugriff auf globale Methode
    },
    hasRight() {
      return this.$hasRight; // Zugriff auf globale Methode
    },
},
props: {
    filters: {
        type: Object,
        default: () => ({}),
    },
    ratings:{
        type:Object,
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
        default: () => [],
    },
    ocont: {
        type: [Array, Object],
        default: () => [],
    },

    createOn: {
        default: true,
    },
    deleteDescription: {
        default: "Eintrag Löschen",
    },
    editDescription: {
        default: "Eintrag bearbeiten",
    },
},
methods: {
    async hasRight(right, table) {
    if (!this.rightsData[`${right}_${table}`] && table) {
      await this.checkRight(right, table);
    }
    return this.rightsData[`${right}_${table}`] === 1;
},

  async checkRight(right, table) {
    // Lade die Rechte für den User
    const value = await GetRights(right, table);
    // Speichere die geladenen Rechte im rightsData-Objekt
    this.rightsData[`${right}_${table}`] = value;

  },


    handleBodyClick(event) {
        this.$nextTick(() => {
            const box = document.getElementById("commentBox");
            if (box && !box.contains(event.target)) {
                this.showComments = null;
            }
        });
    },
    // openComments(id) {
    //     this.showComments = this.showComments === id ? null : id;
    //     console.log("showComments:", this.showComments);
    //     const ti = document.getElementById('teaser-img');
    //     if(ti.style.overflow !== "hidden")
    //     {

    //         ti.style.overflow = "clip";
    //     }
    //     else
    //     {
    //         ti.style.overflow = "hidden";
    //     }
    // },
    closeComments() {
        this.showComments = null;
    },

    reset() {
        this.form = mapValues(this.form, () => null);
    },
    toggleStarBox(id) {
    // console.log(`toggleStarBox wurde für ID ${id} aufgerufen`);

    // Sicherstellen, dass showShareBox existiert
    if (!this.showStarBox) {
        this.showStarBox = {};
    }

    this.showStarBox[id] = !this.showStarBox[id];

    },
    toggleShareBox(id) {
    // console.log(`toggleShareBox wurde für ID ${id} aufgerufen`);

    // Sicherstellen, dass showShareBox existiert
    if (!this.showShareBox) {
        this.showShareBox = {};
    }

    this.showShareBox[id] = !this.showShareBox[id];

    // console.log("showShareBox:", this.showShareBox);

    if (this.showShareBox[id]) {
        this.$nextTick(() => {
            const shariffRef = this.$refs['shariff_' + id];
            if (!shariffRef) {
                console.error(`Shariff-Element für ID ${id} nicht gefunden.`);
                return;
            }
            // console.log(`Shariff für ID ${id} wird initialisiert...`);
            this.initShariff(id);
        });
    } else {
        this.$nextTick(() => {
            const shariffRef = this.$refs['shariff_' + id];
            if (shariffRef) {
                // console.log(`Shariff-Inhalt für ID ${id} wird geleert.`);
                shariffRef.innerHTML = "";
            }
        });
    }
},

        initShariff(id) {
    nextTick(() => {
        const shariffRef = this.$refs['shariff_' + id];
        if (!shariffRef) {
            console.error(`Shariff-Element für ID ${id} nicht gefunden`);
            return;
        }

        // console.log(`Shariff wird für ID ${id} initialisiert`, shariffRef);
        new Shariff(shariffRef, {
            services: ["facebook", "telegram", "whatsapp", "xing", "twitter"],
            theme: "classic",
            orientation: "horizontal",
        });
    });


    },

    toggleCommentBox(postId) {
        this.showComments = this.showComments === postId ? null : postId;
    },

    decodeEntities(text) {
        if (text) {
            text = text?.replace(/<br\s*\/?>/g, "\n");
            return he.decode(text);
        } else {
            return "";
        }
    },

    deleteDataRow(id) {
        if (confirm("Wollen Sie diesen Beitrag wirklich löschen?")) {
            axios
                .delete(this.routeDelete + id)
                .then(() => {
                    this.$emit("deleted");
                    this.$inertia.reload();
                })
                .catch((error) => {
                    console.error("Fehler beim Löschen:", error);
                });
        }
    },

    editDataRow(id) {
       const table = CleanTable();

        var rt = `/admin/tables/edit/${id}/images`;

        location.href = rt;
    },

onClick() {
      if (this.lightbox) {
        this.lightbox.open(0); // 0 = Erstes Bild
      } else {
        console.error('PhotoSwipeLightbox wurde nicht initialisiert!');
      }
    }
},
async mounted() {
    document.body.addEventListener("click", this.handleBodyClick);
    this.lightbox = new PhotoSwipeLightbox({
        gallery: '#gallery',
        children: 'a',
        zoom: true, // Zoom aktivieren
        secondaryZoomLevel: 2, // Maximale Zoom-Stufe
        maxZoomLevel: 4, // Manuell festlegen
        initialZoomLevel: "fit", // Standard-Zoom-Ansicht
        wheelToZoom: true, // Zoomen per Mausrad aktivieren
        barsSize: { top: 50, bottom: 50 },
        padding: { top: 20, bottom: 20, left: 20, right: 20 },
        zoomButton: true, // Zoom-Button aktivieren
        shareButton: true, // Share-Button aktivieren
        fullscreenButton: true, // Fullscreen aktivieren
        bgOpacity: 0.8, // Hintergrundtransparenz
      pswpModule: () => import('photoswipe')
    });

    this.lightbox.init();


    const waitUntilReady = () => new Promise((resolve) => {
    const check = () => {
      if (window.isRightsReady && window.isRightsReady()) {
        resolve();
      } else {
        setTimeout(check, 50);
      }
    };
    check();
  });

  await waitUntilReady();

  // Rechte prüfen
  this.editOn = hasRight("edit", "images");
  this.deleteOn =
  //console.log(this.deleteOn,this.editOn);

    await loadAllRights(); // aus utils/rights.js
    this.rightsReady = true;
},
beforeUnmount() {
    if (this.lightbox) {
      this.lightbox.destroy();
    }
  },
beforeDestroy() {
    document.body.removeEventListener("click", this.handleBodyClick);
},
};
</script>

<style scoped>
.imgprev{

height:260px;
object-fit:cover;
width:auto;

}
.inline{
    /* display:inline-block; */
    margin-right: 8px;
}
.icon{
max-width:50px;
max-height:50px;
}
.pra{
    padding-right:25px;
}

.shariff {
    display: flex;
flex-direction: column; /* Macht die Buttons untereinander */
gap: 5px;
}
@media (max-width: 760px) {
.leftpad{

    margin-left:-42px !important;
    text-align:center !important;
}
}
.we300{
    max-width:350px !important;
}
/* Optional: Füge hier benutzerdefinierte Styles hinzu */
</style>
