<template>
    <div id="photoswipe-gallery" class="w-full grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-6 mt-6">
      <a
        v-for="(image, index) in images"
        :key="index"
        :href="`${basePath}/big/${image.filename}`"
        :data-pswp-width="image.width"
        :data-pswp-height="image.height"
        target="_blank"
        rel="noopener noreferrer"
        class="w-full bg-layout-sun-0 border border-layout-sun-1000 dark:border-layout-night-1050 rounded-lg shadow text-center bg-layout-sun-2050 dark:bg-layout-night-0"
      >
        <img
          class="rounded-lg  w-full aspect-[4/3] object-cover cursor-pointer no-bra"
          :src="`${basePath}/thumbs/${image.filename}`"
          :alt="image.label"
          :title="image.label"
        />
        <div v-if="image.label" v-html="image.label" class="text-sm mt-2 text-layout-sun-1000 dark:text-layout-night-1000 dark:bg-layout-night-0 rounded-lg pt-0 p-2">

        </div>
      </a>
    </div>
  </template>



<script>
import PhotoSwipeLightbox from 'photoswipe/lightbox'
import 'photoswipe/style.css'

export default {
  name: 'PhotoSwipeGallery',
  props: {
    basePath: {
      type: String,
      required: true,
    },
    images: {
      type: Array,
      required: true,
    },
  },
  mounted() {
    this.initLightbox()
  },
  beforeUnmount() {
    if (this.lightbox) {
      this.lightbox.destroy()
      this.lightbox = null
    }
  },
  methods: {
    initLightbox() {
      this.lightbox = new PhotoSwipeLightbox({
        gallery: '#photoswipe-gallery',
        children: 'a',
        pswpModule: () => import('photoswipe')
      })

      this.lightbox.init()
    }
  }
}
</script>
<style>
.no-bra{
    border-bottom-right-radius: 0 !important;
    border-bottom-left-radius: 0 !important;
}
</style>
