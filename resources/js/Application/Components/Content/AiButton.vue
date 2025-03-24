<template>
    <div :class="'absolute bottom-0 right-4 z-10 ai-button ' + big + '_alt'"  @click.stop >
      <a href="/home/ai">
        <!-- Verwende den Standardwert 'dark', falls 'theme' nicht im localStorage gespeichert ist -->
        <img :src="'/images/icons/ai-' + (dma || 'dark') + '.png'"
             alt="Made with AI"
             title="Made with AI"
             :class="'object-contain ai-button x64 ai-button-image MBo ' + big"
             @error="handleImageError" />
      </a>
    </div>
  </template>

  <script>
  export default {
    name: "AiButton",
    props: {
      blog: {
        type: Object,
      },
      aiOverlayImage: {
        type: String,
      },
      dma: {
        type: String,
      },
      big: String,
    },
    data() {
      return {
        // Falls keine Theme im localStorage gefunden wird, 'dark' als Standardwert setzen
        dma: localStorage.getItem('theme') || 'dark',
      };
    },
    methods:{
        handleImageError(event) {
        console.error('Bild konnte nicht geladen werden:', event.target.src);
    }
    },
    mounted() {
      // Optional: Hier kannst du auch das Bild neu setzen, falls nötig.
    },
  };
  </script>

  <style scoped>
  .ai-button{
    bottom:-4px;
    right:15px;
  }
  .ai-button-image {
  position: relative;
  bottom: 4px;
  right: -16px;
  z-index: 10000;
  width: 64px;
    height: 64px;
}
.big{
    position:relative;
     bottom:-17px;
    right:-16px;
    float:left;
}
.big_alt{
    position:relative;
    top:-82px;
    right:-560px;
    width:64px;
    height:64px;
}

.table-class {
  position: relative;
  z-index: 1; /* Tabelle hat einen niedrigeren z-index */
}
.MBo{
    
}
</style>
