<template>


    <span class="star" :class="{ filled: isFilled }">★</span>
  </template>
<script>

  export default {
    props: {
      isFilled: Boolean, // Gibt an, ob der Stern gelb sein soll oder nicht
    },
    data() {
      return {
        stars: [1, 2, 3, 4, 5],
        rating: 0,  // Die Bewertung des Benutzers
        hoverRating: 0  // Für Hover-Effekte
      };
    },
    methods: {
      handleRate(star) {
        this.rating = star;
        this.$emit('update:rating', this.rating);  // Event für die Eltern-Komponente
        this.saveRating(star);  // Rating speichern (optional)
      },
      handleHover(star) {
        this.hoverRating = star;
      },
      handleMouseLeave() {
        this.hoverRating = 0;
      },
      async saveRating(star) {
        // Beispiel für das Speichern der Bewertung über AJAX
        try {
          const response = await axios.post('/save-rating', {
            rating: star,
            postId: this.postId, // Falls du die Post-ID hast
          });
          if (response.data.status === 'success') {
            console.log('Bewertung gespeichert');
          }
        } catch (error) {
          console.error('Fehler beim Speichern der Bewertung:', error);
        }
      }
    }
  };
  </script>
<style scoped>
.star {
  font-size: 30px;
  color: gray; /* Standardmäßig graue Sterne */
}
.star.filled {
  color: yellow; /* Gelb für gefüllte Sterne */
}
</style>
