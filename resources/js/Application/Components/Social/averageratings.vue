<template>
    <div class="average-rating">
      <!-- Sterne -->
    <div class="stars">
      <Star
        v-for="(star, index) in starsArray"
        :key="index"
        :starValue="index + 1"
        :isFilled="star === 'full'"
        :isHalf="star === 'half'"
      />
    </div>

      <!-- Durchschnittliche Bewertung -->
      <p class="rating-text" v-if="averageRating">
        Durchschnitt: {{ averageRating.toFixed(1).replace(".0", '') }} Sterne <br />
        ({{ totalVotes }} Bewertungen)
      </p>
      <p v-else>
        Noch keine Sterne vergeben
    </p>
    </div>
  </template>

  <script>
  import axios from "axios";
  import Star from "@/Application/Components/Social/Star.vue";
  import { CleanTable } from '@/helpers';

  export default {
    components: { Star },

    props: {
      postId: Number,
    },

    data() {
      return {
        averageRating: 0,
        totalVotes: 0,
      };
    },

    async mounted() {
      await this.fetchAverageRating();
    },

    computed: {
        starsArray() {
    // console.log("⭐ Durchschnittliche Bewertung:", this.averageRating);

    if (this.averageRating <= 0) {
      return Array(5).fill("empty");  // 5 leere Sterne, wenn der Wert 0 ist
    }

    const fullStars = Math.floor(this.averageRating);  // Volle Sterne (ganzzahlige Bewertung)
    const hasHalfStar = this.averageRating % 1 >= 0.5; // Prüfen, ob der halbe Stern angezeigt werden soll
    const emptyStars = 5 - fullStars - (hasHalfStar ? 1 : 0); // Restliche leere Sterne

    const starArray = [
      ...Array(fullStars).fill("full"),     // Füllen mit vollen Sternen
      ...(hasHalfStar ? ["half"] : []),     // Einen halben Stern hinzufügen, wenn benötigt
      ...Array(emptyStars).fill("empty"),   // Die restlichen Sterne mit leer füllen
    ];

    // console.log("⭐ Sterne Array:", starArray);

    return starArray;
  },
    },

    methods: {
      async fetchAverageRating() {
        try {
          const table = CleanTable();
          const response = await axios.get(`/get-average-rating/${table}/${this.postId}`);

          // Debugging
        //   console.log("API-Antwort:", response.data);

          if (response.data && response.data.average !== undefined) {
            this.averageRating = parseFloat(response.data.average);
            this.totalVotes = response.data.total || 0;
          }
        } catch (error) {
          console.error("Fehler beim Laden der Durchschnittsbewertung:", error);
        }
      },
    },
  };
  </script>

  <style scoped>
  .stars {
    display: flex;
    gap: 5px;
  }

  .rating-text {
    margin-top: 5px;
    font-size: 14px;
    color: #facc15; /* Gelb */
  }
  </style>
