<template>
    <layout>
        <div @click="handleBodyClick">
        <div v-if="ocont.id" class="p-4 bg-layout-sun-200 dark:bg-layout-night-200">
        <hgroup>
            <h1 class="text-2xl font-bold">{{ decodeEntities(ocont.slug) }}</h1>
            <h4 v-html="ocont.description.replace('fx_year()', new Date().getFullYear()).replace(/\n/g, '<br />')"></h4>


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
        :src="'/images/images/thumbs/' + entry.image_path"  loading="lazy"
        :alt="entry.title"
        :title="entry.title"
        class="w-full  rounded bg-layout-sun-500 dark:bg-layout-night-500 imgprev"
        />
    </div>

    <!-- Mittlere Spalte: Überschrift, Beschreibung und Kommentar-Slot -->
    <div class="p-6 space-y-2 lg:col-span-6">
        <h2 class="text-xl font-semibold sm:text-2xl font-title whitespace-pre-line">
        <p v-html="entry.headline"></p>
        </h2>

        <p class="text-layout-sun-700 dark:text-layout-night-700 whitespace-pre-line">
            <p v-html="entry.message"></p>
            </p>


            <div class="flex items-center gap-4 relative">
    <!-- Kommentare -->
    <div class="comment-button relative leftpad">
        <div class="relative grid place-items-center">
        <table cellspacing="7" cellpadding="4" width="250" align="center" class="border-collapse">
            <tr>
                <td>
            <button @click.stop="openComments(entry.id)"
                class="flex items-center gap-2 px-1 py-1 rounded-lg font-semibold bg-blue-500 text-white hover:bg-blue-600
                    dark:bg-blue-600 dark:hover:bg-blue-700 dark:text-white text-center">
                <icon-comment /> Kommentare
            </button></td>
        <td>

            <button @click="toggleShareBox(entry.id)"
                class="flex items-center gap-2 px-1 py-1 rounded-lg font-semibold bg-blue-500 text-white hover:bg-blue-600
                    dark:bg-blue-600 dark:hover:bg-blue-700 dark:text-white text-center">
                <icon-share /> Teilen
            </button>
        </td>
        <td>
            <button @click="toggleStarBox(entry.id)"
                class="flex items-center gap-2 px-1 py-1 rounded-lg font-semibold bg-blue-500 text-white hover:bg-blue-600
                    dark:bg-blue-600 dark:hover:bg-blue-700 dark:text-white text-center">
                <icon-star /> Bewerten
            </button>
        </td>
        </tr>

        <tr>
            <td colspan="3" v-if="showComments == entry.id">

        <!-- Kommentarbox (Fix: Ist jetzt direkt mit dem Post verbunden) -->
        <div
        ref="commentBox"
        :id="commentBox + entry.id"
        @click.stop
        class="relative absolute left-0 top-full mt-2 w-[300] we300 border-gray-300 p-4 rounded-lg shadow-sm bg-white dark:bg-gray-800 z-40">
    <!-- Schließen Button -->
    <button @click="closeComments"
            class="absolute top-2 right-2 text-red-500 text-xl">
       <b> &times;</b>
    </button>

    <Comments :postId="entry.id" :showComments="this.showComments"/>
    </div>
</td>
</tr>
<tr>
    <td colspan="3">

    <!-- Teilen -->
    <div class="share-button w-full">
        <div class="w-full mt-2">
            <div v-if="showShareBox[entry.id]" :ref="'shariff_' + entry.id" id="shariff-container" class="shariff w-full" data-button-style="icon" ></div>
        </div>
    </div>
</td>
</tr>
<tr>

    <td colspan="3" v-if="showStarBox[entry.id]">
    <!-- Bewertung -->
    <div class="rate-button">
        <AddRating :postId="entry.id" :table="this.tablex"/>
    </div>
</td>
</tr>
</table>
</div>
</div>
</div>
</div>

    <!-- Rechte Spalte: Kurzinfos, Bewertungs-Slot, Datum und optionale Kameraangabe -->
    <div class="p-6 space-y-2 lg:col-span-3">
        <div class="text-sm font-semibold text-layout-sun-800 dark:text-layout-night-800">
        <h3>Kurzinfos</h3>
        </div>

        <averageRating :postId="entry.id"/>
        <span v-if="editOn || deleteOn" class="flex space-x-2">
        <!-- Edit Icon -->
        <span v-if="editOn"
                class="inl"
                @click.prevent="editDataRow(entry.id)">
            <icon-pencil class="w-6 h-6" v-tippy />
            <tippy>{{ editDescription }}</tippy>
        </span>

        <!-- Delete Icon -->
        <span v-if="deleteOn"
                class="inl"
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
</div>
    </layout>
</template>




<script>
import Layout from "@/Application/Homepage/Shared/Layout.vue";
import IconPlusCircle from "@/Application/Components/Icons/PlusCircle.vue";
import averageRating from "@/Application/Components/Social/averageratings.vue";
import IconPencil from "@/Application/Components/Icons/Pencil.vue";
import Comments from "@/Application/Components/Social/comments.vue";
import Share from "@/Application/Components/Social/share.vue";
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
import he from "he";
import { nextTick } from "vue";
import { route } from "ziggy-js";
import IconShare from "@/Application/Components/Icons/IconShare.vue";
import IconStar from "@/Application/Components/Icons/IconStar.vue";

export default {
components: {
    Layout,
    DisplayDate,
    IconPencil,
    IconPlusCircle,
    IconTrash,
    IconCamera,
    SearchFilter,
    Comments,
    Share,
    AddRating,
    IconComment,
    IconShare,
    IconStar,
    averageRating,
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
    };
},
watch: {
    form: {
        handler: throttle(function () {
            let query = pickBy(this.form);
            const path = window.location.pathname;
            const segments = path.split("/");
            var tablezz = segments[segments.length - 1];
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
        default: () => [],
    },
    ocont: {
        type: [Array, Object],
        default: () => [],
    },
    editOn: {
        default: true,
    },
    deleteOn: {
        default: true,
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
    handleBodyClick(event) {
        this.$nextTick(() => {
            const box = document.getElementById("commentBox");
            if (box && !box.contains(event.target)) {
                this.showComments = null;
            }
        });
    },
    openComments(id) {
        this.showComments = this.showComments === id ? null : id;
        console.log("showComments:", this.showComments);
    },
    closeComments() {
        this.showComments = null;
    },

    reset() {
        this.form = mapValues(this.form, () => null);
    },
    toggleStarBox(id) {
    console.log(`toggleStarBox wurde für ID ${id} aufgerufen`);

    // Sicherstellen, dass showShareBox existiert
    if (!this.showStarBox) {
        this.showStarBox = {};
    }

    this.showStarBox[id] = !this.showStarBox[id];

    },
    toggleShareBox(id) {
    console.log(`toggleShareBox wurde für ID ${id} aufgerufen`);

    // Sicherstellen, dass showShareBox existiert
    if (!this.showShareBox) {
        this.showShareBox = {};
    }

    this.showShareBox[id] = !this.showShareBox[id];

    console.log("showShareBox:", this.showShareBox);

    if (this.showShareBox[id]) {
        this.$nextTick(() => {
            const shariffRef = this.$refs['shariff_' + id];
            if (!shariffRef) {
                console.error(`Shariff-Element für ID ${id} nicht gefunden.`);
                return;
            }
            console.log(`Shariff für ID ${id} wird initialisiert...`);
            this.initShariff(id);
        });
    } else {
        this.$nextTick(() => {
            const shariffRef = this.$refs['shariff_' + id];
            if (shariffRef) {
                console.log(`Shariff-Inhalt für ID ${id} wird geleert.`);
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

        console.log(`Shariff wird für ID ${id} initialisiert`, shariffRef);
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
                    location.reload();
                })
                .catch((error) => {
                    console.error("Fehler beim Löschen:", error);
                });
        }
    },

    editDataRow(id) {
        const path = window.location.pathname;
        const segments = path.split("/");
        const table = segments[segments.length - 1];

        var rt = `/admin/tables/edit/${id}/images`;

        location.href = rt;
    },
},

mounted() {
    document.body.addEventListener("click", this.handleBodyClick);
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
