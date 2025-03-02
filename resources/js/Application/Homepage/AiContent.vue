<template>
    <layout
        header-title="Blog"
        :header-url="$page.props.saas_url + '/blogs'"
        :header-image="$page.props.saas_url + '/images/blogimages/Blog_Idee_480x360.jpg'"
    >
        <section class="bg-layout-sun-0 text-layout-sun-800 dark:bg-layout-night-0 dark:text-layout-night-800">
            <div class="w-full max-w-7xl mx-auto mt-5">
                <div v-if="data.length">
                    <div v-for="(item, index) in data" :key="index"
                        class="group hover:no-underline focus:no-underline lg:grid lg:grid-cols-12 lg:gap-6 bg-layout-sun-100 dark:bg-layout-night-100"
                    >
                        <!-- Bild-Bereich -->
                        <div class="relative lg:col-span-7">
                            <img
                                :src="`/images/_ab/ai-teaser-light.jpg`"
                                :alt="`Bild von ${item.headline}`"
                                loading="lazy"
                                class="object-cover w-full h-64 sm:h-96 rounded"
                            />
                            <!-- AI-Button -->
                            <AiButton class="ai-button-image" :overlayImage="'images/icons/ai-dark.png'"></AiButton>
                        </div>

                        <!-- Text-Bereich -->
                        <div class="p-6 space-y-2 lg:col-span-5">
                            <!-- Kategorie -->
                            <div class="flex justify-end">
                                <div
                                    v-if="item.author_name2"
                                    class="text-sm bg-primary-sun-500 text-primary-sun-900 dark:bg-primary-night-500 dark:text-primary-night-900 font-semibold px-2.5 py-0.5 rounded-lg"
                                >

                                </div>
                            </div>

                            <!-- Blog-Titel -->
                            <h2 class="text-xl font-semibold sm:text-2xl font-title group-hover:underline">
                                {{ item.headline }}
                            </h2>

                            <!-- Datum -->
                            <div class="text-xs text-layout-sun-600 dark:text-layout-night-600 py-2">
                                Von: {{ item.author_name }}
                            </div>

                            <!-- Blog-Zusammenfassung -->
                            <markdown :markdown="item.text"></markdown>

                            <!-- <div v-html="item.text" class="pb-6"></div> -->

                            <!-- Lesezeit -->
                        </div>
                    </div>
                </div>
                <div v-else>
                    <p>Keine Daten gefunden</p>
                </div>
            </div>
        </section>
    </layout>
</template>


<script>
import { defineComponent } from "vue";
import Layout from "@/Application/Homepage/Shared/Layout.vue";

import PageTitle from "@/Application/Components/Content/PageTitle.vue";
import AiButton from "@/Application/Components/Content/AiButton.vue";
import BlogPreviewBig from "@/Application/Homepage/Shared/BlogPreviewBig.vue";
import BlogPreviewSmall from "@/Application/Homepage/Shared/BlogPreviewSmall.vue";

import SearchFilter from "@/Application/Components/Lists/SearchFilter.vue";
import { defineAsyncComponent } from "vue";
import Alert from "@/Application/Components/Content/Alert.vue";
import Markdown from "@/Application/Components/Content/Markdown.vue";
import mapValues from "lodash/mapValues";
import pickBy from "lodash/pickBy";
import throttle from "lodash/throttle";





import { VueMarkdownIt } from "vue3-markdown-it";




export default defineComponent({
    name: "Homepage_AiContent",

    components: {

        Markdown: defineAsyncComponent(() => import("vue3-markdown-it")),

        Layout,
        PageTitle,
        BlogPreviewBig,
        BlogPreviewSmall,
        SearchFilter,
        Alert,
        AiButton,
        Markdown,
    },

    props: {
    data:{
        required:true,
        default: [],
    },
    darkMode:  {
        required: false,
        // default: "dark",
    },
    blogarticle: {
            type: String,
        },
    },
    watch: {

    },
    computed:{
        darkMode(){
            this.darkMode = localStorage.getItem("theme");
        }

    },
    methods: {

    },
});
</script>

