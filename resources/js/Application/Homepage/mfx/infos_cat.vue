<template>
    <layout header-title="Home" :header-url="$page.props.saas_url + '/'">
        <page-content>
            <template #content>
                <div>
                <page-title>
                    <template #title>
                        <span class="dark:text-layout-night-1050 text-layout-sun-1000">Infos</span>
                </template>
                </page-title>
                <div class="grid grid-cols-12 gap-4">

                    <div v-for="item in data" :key="item.id"  class="col-span-6 p-4 lg:rounded-lg">
                        <a :href="'infos/show/'+ item.id">

                        <div style="min-height:102px;" class="bg-layout-sun-50 dark:bg-layout-night-50 lg:rounded-lg pr-2 border border-layout-sun-1000 dark:border-layout-night-1050" >
                        <div class="inline" style="float:left;padding-right:5px;margin-right:5px;"><img :src="'/images/_mfx/infos/img_thumb/thumbs/' + item.img_thumb" :alt="item.headline" :title="item.headline" class="inline lg:rounded-lg nor_border"/></div>
                            <div><span class="dark:text-layout-night-1050 text-layout-sun-1000" v-html="`<b>${cleanHtml(item.headline)}</b>`"></span> <editbtns :id="item?.id" table="infos" /><br />
                        <span class="text-layout-sun-1000 dark:text-layout-night-1000" v-html="cleanHtml(item.summary)"></span></div>

                    </div>
                </a>
                    </div>
                    </div>
                    </div>



            </template>
        </page-content>
    </layout>
</template>
<script>
import { defineComponent } from "vue";
import Layout from "@/Application/Homepage/Shared/mfx/Layout.vue";
import { selectionHelper, GetSettings,rumLaut } from "@/helpers";
import PageContent from "@/Application/Components/Content/PageContent.vue";
import PageTitle from "@/Application/Components/Content/PageTitle.vue";
import PageParagraph from "@/Application/Components/Content/PageParagraph.vue";
import emailview from "@/Application/Components/Form/email.vue";
import editbtns from "@/Application/Components/Form/editbtns.vue";

export default defineComponent({
    name: "Homepage_Home",

    components: {
        Layout,
        PageContent,
        PageTitle,
        PageParagraph,
        emailview,
        editbtns,
    },
    props:{
        news:[Array,Object],
        text: [Array,Object],
        data: [Array,Object],
        item: [Array,Object],

    },
    data() {
    return {
      form: {
        name: '',
        email: '',
        subject: '',
        message: '',
        captcha: '',
        accepted: false
      }
    }
  },

    methods: {
        cleanHtml(html) {
      const result = rumLaut(html);
     // console.log("rumLaut output:", result);
      return result;

    },
    async submitForm() {
      try {
        const response = await axios.post('/contact/send', this.form)
        alert('Nachricht erfolgreich gesendet!')
        this.resetForm()
      } catch (error) {
        alert('Fehler beim Senden der Nachricht.')
      }
    },
    resetForm() {
      this.form = {
        name: '',
        email: '',
        subject: '',
        message: '',
        captcha: '',
        accepted: false
      }
    }
  },
});
</script>
<style scoped>
.input {
  @apply w-full px-4 py-2 border rounded-md dark:bg-zinc-800 dark:text-white;
}

.btn {
  @apply px-6 py-2 bg-blue-600 text-white rounded-md hover:bg-blue-700 disabled:opacity-50;
}
.nor_border{
    border-top-right-radius:0;
    border-bottom-right-radius:0;
}
</style>
