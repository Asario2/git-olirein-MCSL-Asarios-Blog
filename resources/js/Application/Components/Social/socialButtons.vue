<template>
        <!-- **Tabelle direkt unterhalb des Blog-Containers (fixiert)** -->
        <div class="w-full mt-2">
            <table class="w-full border-collapse rounded-lg shadow-sm table-class" style="max-width:300px;" @click.stop>
                <tbody>
                    <tr>
                        <td class=" text-center">
                            <button  @click.stop.prevent="openComments(postId)"
                                class="flex items-center gap-2 px-2 py-1 rounded-lg font-semibold bg-blue-500 text-white hover:bg-blue-600
                                    dark:bg-blue-600 dark:hover:bg-blue-700 dark:text-white text-center tog-tab">
                                <icon-comment /> Kommentare
                            </button>
                        </td>

                        <td class="p-1.5 text-center">
                            <button @click.stop.prevent="toggleShareBox(postId)"
                                class="flex items-center gap-2 px-2 py-1 rounded-lg font-semibold bg-blue-500 text-white hover:bg-blue-600
                                    dark:bg-blue-600 dark:hover:bg-blue-700 dark:text-white text-center tog-tab">
                                <icon-share /> Teilen
                            </button>
                        </td>

                        <td class=" text-center">
                            <button  @click.stop.prevent="toggleStarBox(postId)"
                                class="flex items-center gap-2 px-2 py-1 rounded-lg font-semibold bg-blue-500 text-white hover:bg-blue-600
                                    dark:bg-blue-600 dark:hover:bg-blue-700 dark:text-white text-center tog-tab">
                                <icon-star /> Bewerten
                            </button>
                        </td>
                    </tr>

                    <!-- Kommentarbox -->

                    <tr v-if="showComments == postId">
                        <td colspan="3" class="p-4" style="z-index:1000;"  :id="'commentBox_' + postId">

                            <div style="z-index:1000;" class="w300 relative border border-gray-300 p-4 rounded-lg shadow-sm bg-white dark:bg-gray-800">
                                <button @click.stop.prevent="closeComments(this.postId)" class="absolute top-2 right-2 text-red-500 text-xl bold">
                                    <b>&times;</b>
                                </button>
                                <Comments :postId="postId" :showComments="this.showComments" />
                            </div>


                        </td>
                    </tr>

                    <!-- Teilen -->
                    <tr v-if="showShareBox[postId]">
                        <td colspan="3" class="p-4">
                            <div align="center" :ref="'shariff_' + postId" id="shariff-container" class="shariff w-full w300 relative border border-gray-300 p-4 pb-2 rounded-lg shadow-sm bg-white dark:bg-gray-800" data-button-style="icon"></div>
                        </td>
                    </tr>

                    <!-- Bewertung -->
                    <tr v-if="showStarBox[postId]">
                        <td colspan="3" class="p-4">
                            <AddRating :postId="postId" :table="this.tablex" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

</template>

<script>
// document.addEventListener('DOMContentLoaded', () => {
//   const buttons = document.getElementsByClassName('tog-tab');
//   if (buttons.length > 0) {
//     Array.from(buttons).forEach(button => {
//       button.addEventListener('click', function() {
//         const table = document.getElementById('toggle-table');
//         const aiImage = document.querySelector('.ai-button-image');

//         // Stelle sicher, dass das Bild immer sichtbar bleibt
//         aiImage.style.position = 'relative';
//         if(this.showCommments)
//         {
//             aiImage.style.marginBottom = '236px';
//             aiImage.style.right = '-16px';
//         }


//         // Toggle die Tabelle sichtbar
//         //table.style.display = table.style.display === 'none' ? 'block' : 'none';

//         // Optional: Überprüfen, ob das 'ai-dark' Bild verwendet werden soll
//         const theme = localStorage.getItem('theme') || 'dark';
//         aiImage.src = `images/icons/ai-${theme}.png`;
//       });
//     });
//   } else {
//     console.error('Element not found!');
//   }
// });

document.addEventListener('DOMContentLoaded', () => {
  const buttons = document.getElementsByClassName('tog-tab');
  if (buttons.length > 0) {
    Array.from(buttons).forEach(button => {
      button.addEventListener('click', function() {
        const postId = this.postId; // Hole die ID aus data-post-id
        const commentBox = document.getElementById(`commentBox_${postId}`);
        const aiImage = document.querySelector('.ai-button-image');

        if (!commentBox) {
          console.error(`commentBox_${postId} nicht gefunden!`);
          return;
        }

        // Sichtbarkeit der Comment-Box toggeln
        if (commentBox.style.display === 'none' || commentBox.style.display === '') {
        //   commentBox.style.display = 'block';
        //   aiImage.style.marginBottom = '236px';
        //   aiImage.style.right = '-16px';
        } else {
        //   commentBox.style.display = 'none';
        //   aiImage.style.marginBottom = '0';
        //   aiImage.style.right = '0';
        }

        // Optional: Ändere das AI-Bild basierend auf dem Theme
        const theme = localStorage.getItem('theme') || 'dark';
        aiImage.src = `images/icons/ai-${theme}.png`;
      });
    });
  } else {
    console.error('Buttons nicht gefunden!');
  }
});




// document.getElementById('toggle-table').addEventListener('click', function() {
//   const table = document.getElementById('toggle-table');
//   const aiImage = document.querySelector('.ai-button-image');

//   // Stelle sicher, dass das Bild immer sichtbar bleibt
//   aiImage.style.position = 'fixed';
//   aiImage.style.bottom = '16px';
//   aiImage.style.right = '16px';

//   // Toggle die Tabelle sichtbar
//   table.style.display = table.style.display === 'none' ? 'block' : 'none';
// });
import { Link } from "@inertiajs/vue3";
import IconPlusCircle from "@/Application/Components/Icons/PlusCircle.vue";
import averageRating from "@/Application/Components/Social/averageratings.vue";
import IconPencil from "@/Application/Components/Icons/Pencil.vue";
import Comments from "@/Application/Components/Social/comments.vue";
import Share from "@/Application/Components/Social/share.vue";
import AddRating from "@/Application/Components/Social/addrating.vue";
import SearchFilter from "@/Application/Components/Lists/SearchFilter.vue";
import IconCamera from "@/Application/Components/Icons/Camera.vue";
import editbtns from "@/Application/Components/Form/editbtns.vue";
import IconComment from "@/Application/Components/Icons/IconComment.vue";
import { throttle } from "lodash";
import { CleanTable, CleanId } from '@/helpers';
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
    name: "SocialButtons",
    //
    components: {
        Link,
    DisplayDate,
    IconPencil,
    IconPlusCircle,
    editbtns,
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

    props: {
        blog: {
            type: Object,
        },
        aiOverlayImage: {
            type: String,
        },
        postId:{
            type: [Number,String]
        },
    },
    data() {
    return {
        dma: localStorage.getItem('theme'),
        showShareBox: {} ,
        showStarBox: {}, // Wert aus localStorage speichern
        showComments: null, // Zustand für die Anzeige der Kommentarfunktion
    };
},
methods:{
    handleBodyClick(event) {
        this.$nextTick(() => {
            const box = document.getElementById("commentBox_" + this.postId);
            if (box && !box.contains(event.target)) {
                this.showComments = null;
            }
        });
    },
    openComments(id) {
        this.imageRemove(id);
        event.stopPropagation();
        this.showComments = this.showComments === id ? null : id;
        console.log("showComments_alt2:", this.showComments);
        const ti = document.getElementById('teaser-img');
        if(ti)
        {
            const ti2 = document.getElementById('teaser-img2');
            if (ti.style.overflow === "hidden" || this.showStarBox || this.showShareBox ) {
                ti.style.overflow = "visible";
                ti2.style.overflow = "visible";
            } else {
                ti.style.overflow = "hidden";
                ti2.style.overflow = "hidden";
            }
        }


    },
    imageRemove(id){
        window.addEventListener('load', function () {
        const commentBox = document.getElementById("commentBox_" + id);
        if (commentBox) {
            const computedHeight = window.getComputedStyle(commentBox).height;
            console.log(computedHeight); // Gibt die Höhe des Elements aus
        } else {
            //console.error("Element nicht gefunden! commentBox_"+id);
        }
    });

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
    const ti = document.getElementById('teaser-img');
    if(ti)
    {
        const ti2 = document.getElementById('teaser-img2');
        if (ti.style.overflow === "hidden" || this.showShareBox || this.showComments) {
            ti.style.overflow = "visible";
            ti2.style.overflow = "visible";
        } else {
            ti.style.overflow = "hidden";
            ti2.style.overflow = "hidden";
        }
    }

    },
    toggleShareBox(id) {

    console.log(`toggleShareBox wurde für ID ${id} aufgerufen`);

    // Sicherstellen, dass showShareBox existiert
    if (!this.showShareBox) {
        this.showShareBox = {};
    }
    const ti = document.getElementById('teaser-img');
    if(ti){

        const ti2 = document.getElementById('teaser-img2');
        if (ti.style.overflow === "hidden" || this.showStarBox || this.showComments) {
            ti.style.overflow = "visible";
            ti2.style.overflow = "visible";
        } else {
            ti.style.overflow = "hidden";
            ti2.style.overflow = "hidden";
        }
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
        this.imageRemove(postId);
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
        const table = CleanTable();

        var rt = `/admin/tables/edit/${id}/images`;

        location.href = rt;
    },
},
mounted(){

this.imageRemove(this.postId);
},
showComments(newVal, oldVal) {
        if (newVal !== oldVal) {
            // Hier rufst du die Methode auf, wenn sich der Wert von `showComments` ändert
            this.imageRemove(this.postId);
            alert(this.postId);
        }
    }
};
</script>
<style scoped>
#commentBox{
    max-width:300px !important;
    width:300px !important;
}


.shariff{
    margin-top:-11px;
    z-index:10000;
}
.w300{
    max-width:300px;
}
</style>
