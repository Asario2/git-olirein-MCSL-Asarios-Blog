<template>
    <div v-if="comments.length" class="space-y-4">
      <div
        v-for="comment in comments"
        :key="comment.id"
        class="flex items-start p-4 rounded-lg bg-layout-sun-200 dark:bg-layout-night-200 border border-layout-sun-300 dark:border-layout-night-300"
      >
        <!-- Profilbild -->
        <img
          :src="comment.profile_photo_path ? `/images/${comment.profile_photo_path}` : defaultAvatar"
          alt="Profilbild"
          class="w-12 h-12 rounded-full bg-gray-300 dark:bg-gray-600 mr-4"
        />

        <!-- Kommentarinhalt -->
        <div class="flex-1">

          <p class="text-layout-sun-700 dark:text-layout-night-600">
            {{ comment.content }}
          </p>
          <small class="text-xs text-layout-sun-600 dark:text-layout-night-500">
            <display-date :value="comment.created_at" :time-on="false" />
          </small>
        </div>
      </div>
    </div>
    <p v-else class="text-center text-sm text-layout-sun-600 dark:text-layout-night-500">
      Keine Kommentare vorhanden.
    </p>
  </template>

  <script>
  import axios from "axios";

  export default {
    props: {
      postId: Number, // Die ID des Posts, zu dem Kommentare geladen werden
    },
    data() {
      return {
        comments: [],
        defaultAvatar: "/images/default-avatar.png", // Fallback-Profilbild
      };
    },
    async mounted() {
      await this.fetchComments();
    },
    methods: {
      async fetchComments() {
        try {
            const path = window.location.pathname; // Gibt "/admin/tables/show/Example" zurück
            const segments = path.split("/"); // Teilt den Pfad in Segmente auf
            const table = segments[segments.length - 1];
            console.log(this.postId);
          const response = await axios.get(`/comments/` + this.postId, {
            params: { post_id: this.postId,
                    table:table,
                     },
          });
          this.comments = response.data;
        } catch (error) {
          console.error("Fehler beim Laden der Kommentare:", error);
        }
      },
    },
  };
  </script>
