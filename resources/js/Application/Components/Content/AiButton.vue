<template>
    <div :class="'absolute bottom-0 right-4 z-10 ai-button ' + big + '_alt'"  @click.stop >
      <a href="/home/ai">
        <!-- Verwende den Standardwert 'dark', falls 'theme' nicht im localStorage gespeichert ist -->
        <img :src="'/images/icons/ai-' + (dma || 'dark') +  '.png'"
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
      full:{
        type:String,
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
@media screen and (min-width: 1023px) {
.big{
    position:relative;
     bottom:-17px;
    right:-16px;
    float:left;
}
}
@media screen and (max-width: 1023px) {
    .big{
        bottom:-4px;
    right:15px;
        position: relative;
  bottom: -16px;
  right: -16px;
  z-index: 10000;
  width: 64px;
    height: 64px;
    }
}
@media screen and (min-width: 1023px) {
.big_alt{
    position:relative;
    top:-81px;
    right:-560px;
    width:64px;
    height:64px;
}
}
@media screen and (max-width: 1023px) {
.big_alt{
    position: relative;
  bottom: 80px;
  right: -263px;
  z-index: 10000;
  width: 64px;
    height: 64px;
}
.full_alt{
    position: relative;
  bottom: 60px;
  right: -239px;
  z-index: 10000;
  width: 64px;
    height: 64px;
}
}
@media screen and (min-width: 1023px) {
.full
{
right:-957px;
width:64px;
height:64px;
top:-68px;
}
}
.table-class {
  position: relative;
  z-index: 1; /* Tabelle hat einen niedrigeren z-index */
}
</style>
