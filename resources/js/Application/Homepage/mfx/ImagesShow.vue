<template>
    <layout header-title="Galerie" :header-url="$page.props.saas_url + '/'">
      <page-content>
        <template #content>
          <page-title>
            <template #title>
              <span class="dark:text-layout-night-1050 text-layout-sun-1000 inline">
                Bildergalerie: {{ images.headline }} <editbtns style="float:left;" :id="CleanId()" table="images" />
              </span>
            </template>
          </page-title>

          <div v-if="!Object.keys(im_cont || {}).length" class="text-layout-sun-1000 dark:text-layout-night-1000">
            <p>Keine Bilder gefunden.</p>
          </div>

          <div v-else class="">
            <photoswipe :images="im_cont" :basePath="'/images/_mfx/images/imgdir_content/' + def">

            </photoswipe>
        </div>
        </template>
      </page-content>
    </layout>
  </template>

  <script>
  import { defineComponent } from "vue";
  import photoswipe from "@/Application/Components/photoswipe.vue";
  import Layout from "@/Application/Homepage/Shared/mfx/Layout.vue";
  import PageContent from "@/Application/Components/Content/PageContent.vue";
  import PageTitle from "@/Application/Components/Content/PageTitle.vue";
  import PageParagraph from "@/Application/Components/Content/PageParagraph.vue";
  import { CleanId } from '@/helpers';
  import emailview from "@/Application/Components/Form/email.vue";
  import editbtns from "@/Application/Components/Form/editbtns.vue";

  export default defineComponent({
    name: "Homepage_ImageShow",
    components: {
      Layout,
      PageContent,
      PageTitle,
      PageParagraph,
      emailview,
      editbtns,
      photoswipe,
    },
    props: {
      images: [Array, Object],
      im_cont: [Array, Object, String],
      def: String,
    },
    methods:{
        CleanId,
    },
  });
  </script>
<style>
.rrl{
    border-bottom-right-radius:0 !important;
    border-bottom-left-radius:0 !important;
}
</style>


