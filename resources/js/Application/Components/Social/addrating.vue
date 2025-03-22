<template>
    <div>
      <div class="rating-stars">
        <IconStar
          v-for="star in 5"
          :key="star"
          :index="star"
          :rating="currentRating"
          :hoverRating="hoverRating"
          :onHover="handleHover"
          :onRate="handleRate"
        />
      </div>
      <p v-if="currentRating > 0">Du hast {{ currentRating }} Sterne bewertet</p>
    </div>
  </template>

  <script>
  import axios from 'axios';
  import Star from './Star.vue';
  import IconStar from "@/Application/Components/Icons/IconStar.vue";
  export default {
    components: {
      Star,
      IconStar,
    },
    data() {
      return {
        currentRating: 0, // Aktuelle Bewertung
        hoverRating: 0,   // Hover-Bewertung
      };
    },
    methods: {
      handleHover(rating) {
        this.hoverRating = rating;
      },
      handleRate(rating) {
        this.currentRating = rating;
        this.saveRating(rating); // Speichern der Bewertung
      },
      async saveRating(rating) {
        try {
          const response = await axios.post('/save-rating', {
            rating: rating,
            postId: this.$route.params.id, // Hier musst du die Post-ID entsprechend anpassen
            _token: document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
          });

          if (response.data.status === 'success') {
            console.log('Bewertung gespeichert');
          }
        } catch (error) {
          console.error('Fehler beim Speichern der Bewertung:', error);
        }
      },
    },
  };
  </script>

  <style scoped>
  .rating-stars {
    display: flex;
    gap: 5px;
  }
  </style>
