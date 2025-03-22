<template>
    <span
      :class="['star', { filled: isFilled }]"
      @mouseenter="onMouseEnter"
      @mouseleave="onMouseLeave"
      @click="onClick"
      :style="starStyle"
    >
      &#9733;
    </span>
  </template>

  <script>
  export default {
    props: {
      index: Number,  // Index des Sterns (1 bis 5)
      rating: Number, // Aktuelle Bewertung des Benutzers
      hoverRating: Number, // Hover-Rating während der Interaktion
      onHover: Function, // Callback für Hover-Event
      onRate: Function, // Callback für Klick-Event
    },
    computed: {
      isFilled() {
        return this.index <= (this.hoverRating || this.rating);
      },
      starStyle() {
        return {
          cursor: 'pointer',
          fontSize: '30px',
          color: this.isFilled ? 'yellow' : '#d3d3d3',
        };
      },
    },
    methods: {
      onMouseEnter() {
        this.onHover(this.index);
      },
      onMouseLeave() {
        this.onHover(0); // Zurücksetzen des Hover-Ratings
      },
      onClick() {
        this.onRate(this.index); // Wert speichern
      },
    },
  };
  </script>

  <style scoped>
  .star {
    transition: color 0.3s ease;
    user-select: none;
  }
  .star.filled {
    color: yellow;
  }
  </style>
    