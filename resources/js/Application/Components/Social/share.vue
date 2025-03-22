<template>
    <div>


      <div v-if="showShareBox" class="share-box">
        <div style="width: 100%; margin-top: 10px;">
        <div ref="shariff" id="shariff-container" class="shariff" data-button-style="icon"></div>
        </div>
      </div>
    </div>
  </template>

  <script>
  import { nextTick } from 'vue';
  import { parse } from 'url';
  import IconShare from "@/Application/Components/Icons/IconShare.vue";
  export default {
    components: {
            IconShare,

        },
    data() {
      return {
        showShareBox: false,
      };
    },
    methods: {
        toggleShareBox() {
            this.showShareBox = !this.showShareBox;
            if (this.showShareBox) {
            this.initShariff();
            }
        },
        initShariff() {
      nextTick(() => {
        if (this.$refs.shariff) {
            console.log('Shariff Element:', this.$refs.shariff);
            const shariffElement =  this.$refs.shariff;

        if (shariffElement) {
        new Shariff(shariffElement, {
            services: ['facebook', 'twitter', 'xing', 'whatsapp'],  // Deine gewünschten Dienste
            theme: 'classic', // Oder ein anderes Thema
            orientation: 'horizontal', // Oder 'vertical'
        });
        }
    }
        else {
          console.error('Shariff Element nicht gefunden');
        }
      });
    },

    toggleShareBox() {
      this.showShareBox = !this.showShareBox;
      if (this.showShareBox) {
        this.initShariff();
      }
    },
  },
  };
  </script>
  <style>
</style>
