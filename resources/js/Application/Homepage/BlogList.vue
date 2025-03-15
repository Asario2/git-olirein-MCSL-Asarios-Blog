<template>
    <layout
        header-title="Blog"
        :header-url="$page.props.saas_url + '/blogs'"
        :header-image="
            $page.props.saas_url + '/images/blogimages/Blog_Idee_480x360.jpg'
        "
    >
        <section
            class="bg-layout-sun-0 text-layout-sun-800 dark:bg-layout-night-0 dark:text-layout-night-800"
        >
            <div
                class="p-2 md:p-4"
                v-if="blogs.data.length == 0 && !form.search"
            >
                <alert type="warning">
                    Zurzeit liegen keine Blogartikel vor!
                </alert>
            </div>

            <div class="p-2 md:p-4">
                <page-title>
                    <template #title> Asarios Blog </template>
                </page-title>

                <div class="flex justify-between items-center">
                    <search-filter
                        v-model="form.search"
                        class="w-full"
                        @reset="reset"
                    >
                    </search-filter>
                </div>

                <div v-if="blogs.data.length == 0 && form.search">
                    <alert type="warning">
                        Für den vorgegebenen Suchbegriff wurden keine
                        Blogartikel gefunden.
                    </alert>
                </div>

                <div v-if="blogs.data.length > 0">
                    <blog-preview-big :blog="blogs.data[0]"></blog-preview-big>
                    <div
                        class="mt-8 grid justify-center grid-cols-1 gap-6 sm:grid-cols-2 lg:grid-cols-3"
                    >
                        <template
                            v-for="(blog, index) in blogs.data"
                            :key="blog.id"
                        >
                            <blog-preview-small
                                v-if="index > 0"
                                :blog="blog"
                            ></blog-preview-small>
                        </template>
                    </div>
                </div>
            </div>
        </section>
    </layout>
</template>
<script>
import { defineComponent } from "vue";
import Layout from "@/Application/Homepage/Shared/Layout.vue";

import PageTitle from "@/Application/Components/Content/PageTitle.vue";

import BlogPreviewBig from "@/Application/Homepage/Shared/BlogPreviewBig.vue";
import BlogPreviewSmall from "@/Application/Homepage/Shared/BlogPreviewSmall.vue";

import SearchFilter from "@/Application/Components/Lists/SearchFilter.vue";

import Alert from "@/Application/Components/Content/Alert.vue";

import mapValues from "lodash/mapValues";
import pickBy from "lodash/pickBy";
import throttle from "lodash/throttle";

export default defineComponent({
    name: "Homepage_BlogList",

    components: {
        Layout,
        PageTitle,
        BlogPreviewBig,
        BlogPreviewSmall,
        SearchFilter,
        Alert,
    },

    props: {
        blogs: {
            type: Object,
            default: () => ({}),
        },
        filters: {
            type: Object,
            default: () => ({}),
        },
        blogImage: {

    },
    },

    data() {
        return {
            form: {
                search: this.filters.search,
            },
        };
    },

    watch: {
        form: {
            handler: throttle(function () {
                let query = pickBy(this.form);
                //
                this.$inertia.get(
                    this.route(
                        "home.blog.index",
                        Object.keys(query).length
                            ? query
                            : { remember: "forget" },
                    ),
                    this.form,
                    {
                        preserveState: true,
                    },
                );
            }, 150),
            deep: true,
        },
    },

    methods: {
        reset() {
            this.form = mapValues(this.form, () => null);
        },
    },
});
</script>
