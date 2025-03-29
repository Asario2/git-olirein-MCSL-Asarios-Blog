<template>
            <div v-if="showComments" class="w-full" :style="{ display: showComments ? 'block' : 'none' }"
            @click.stop.prevent="dummy">
            <div v-if="comments.length > 0" class="space-y-4">
                <div v-for="comment in comments" :key="comment.id"
                class="flex items-start p-2 pra mt-4 rounded-lg bg-layout-sun-200 dark:bg-layout-night-200 border border-layout-sun-300 dark:border-layout-night-300"  style="word-wrap: break-word;"
            >
            <div :id="'commentBox_' + comment.id" class="flex items-start space-x-4">
            <!-- Profilbild -->
            <img
                :src="comment.profile_photo_path ? `/${comment.profile_photo_path}` : defaultAvatar"
                alt="Profilbild"
                class="w-[50px] h-[50px] object-cover rounded-full bg-gray-300 dark:bg-gray-600"
            />

            <!-- Kommentarinhalt -->
            <div class="flex-1 pr-14">
                <p class="text-sm flex items-center gap-2">
                    {{ comment.author }}
                    <span @click="confirmDelete(comment.id)" class="text-red-500 cursor-pointer hover:text-red-700">
                        <IconTrash class="w-4 h-4" />
                    </span>
                </p>
                <p class="text-layout-sun-700 dark:text-layout-night-600 w-[190px] max-w-[190px]">
                    {{ comment.content }}
                </p>
                <small class="text-xs text-layout-sun-600 dark:text-layout-night-500">
                    <display-date :value="comment.created_at" :time-on="false" />
                </small>
            </div>
        </div>


        <!-- Kommentar-Eingabefeld -->

    </div>
        </div>

            <!-- <p v-else class="text-center text-sm text-layout-sun-600 dark:text-layout-night-500">
            Keine Kommentare vorhanden.
            </p> -->
        </div>
        <div v-if="this.showComments" class="mb-4 p-4  rounded-lg bg-gray-100 dark:bg-gray-800">
        <textarea @click.stop
            v-model="newComment"
            class="w-full p-2 rounded-lg dark:bg-gray-900 dark:text-white"
            placeholder="Schreibe einen Kommentar..."
        ></textarea>
        <button
            @click="submitComment"
            class="mt-2 px-4 py-2 bg-blue-500 text-white rounded-lg hover:bg-blue-600 dark:bg-blue-600 dark:hover:bg-blue-700"
        >
            Kommentar senden
        </button>
        </div>

        </template>

        <script>
        import axios from "axios";
        import IconComment from "@/Application/Components/Icons/IconComment.vue";
        import DisplayDate from "@/Application/Components/Content/DisplayDate.vue";
        import IconTrash from "@/Application/Components/Icons/Trash.vue";
        import { CleanTable, CleanId } from '@/helpers';
        export default {

            components: {
            IconComment,
            IconTrash,

        },


            props: {
                showComments: Number,
            postId: Number,
             // Die ID des Posts, zu dem Kommentare geladen werden
            },
            data() {
            return {
                comments: [],
                newComment: "", // Eingabefeld für neuen Kommentar
                defaultAvatar: "/images/default-avatar.png", // Fallback-Profilbild
            };
            },
            async mounted() {
            await this.fetchComments();
            document.querySelectorAll("textarea").forEach((textarea) => {
            textarea.addEventListener("click", function(event) {
                event.stopPropagation(); // Verhindert, dass der Link ausgelöst wird
            });

            textarea.addEventListener("keydown", function(event) {
                event.stopPropagation();
                if (event.key === "Enter") {
                    event.preventDefault(); // Verhindert Absenden mit Enter
                }
            });
            });
            },
            methods: {
                async confirmDelete(commentId) {
                    if (!confirm("Möchtest du diesen Kommentar wirklich löschen?")) return;

                    try {
                    await axios.delete(`/comments/delete/${commentId}`);
                    this.comments = this.comments.filter(comment => comment.id !== commentId); // Kommentar aus Liste entfernen
                    } catch (error) {
                    console.error("Fehler beim Löschen des Kommentars:", error);
                    }
                },
                cleanPath() {
                    const searchableTables = ["images", "blogs", "didyouknow","shortpoems"]; // Dein `Settings::searchable`
                    const parts = window.location.pathname.split("/"); // Teile die URL in Segmente auf

                    let table = null;
                    let table_alt = null;

                    for (const ta of searchableTables) {
                        if (parts.includes(ta)) {
                            table = ta;
                            table_alt = ta;

                            // GET-Parameter setzen
                            const urlParams = new URLSearchParams(window.location.search);

                            // console.log("Gefunden:", table);
                            return table;
                        }
                    }

                },

                // Beispiel
                // const path = "/admin/tables/show/Example/123/create/456/search";
                // const cleanedPath = cleanPath(path);

                // console.log(cleanedPath); // Ausgabe: "/Example"

                async fetchComments() {
                    try {
                        var table = CleanTable();
                        const response = await axios.get(`/comments/${table}/${this.postId}`);
                        this.comments = Array.isArray(response.data) ? response.data : []; // Sicherstellen, dass es ein Array ist
                    } catch (error) {
                        console.error("Fehler beim Laden der Kommentare:", error);
                    }
                },
    toggleCommentBox(){
        this.showComments = !this.showComments;
        this.imageRemove(this.postId);
    },

    async submitComment() {
        if (!this.newComment.trim()) return; // Leere Kommentare verhindern

        try {
            var table = CleanTable();
            const response = await axios.post(`/comments/store/${table}/${this.postId}`, {
            post_id: this.postId,
            comment: this.newComment,
            _token: document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
            });
            // console.log(response.data['status'] == 'success');
            if (response.data['status'] == 'success') {
            this.comments.unshift(response.data.comment); // Direkt ins Array einfügen
            this.fetchComments();
            this.newComment = ""; // Eingabefeld leeren
            }
        } catch (error) {
            console.error("Fehler beim Speichern des Kommentars:", error);
        }
        },
    },
    };
        </script>
<style scoped>
.object-cover{
    object-fit:cover;
    width:48px;
    height:48px;
    max-height:48px;
    max-width:48px;
    min-width:48px;
    min-height:48px;
}
.shariff {
    display: block; /* Stellt sicher, dass die Buttons untereinander erscheinen */
    margin-top: 10px; /* Abstand nach oben */
}
</style>
