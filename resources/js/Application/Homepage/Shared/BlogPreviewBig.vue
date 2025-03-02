<template>
    <Link
        :href="route('home.blog.show', blog.slug)"
        class="block max-w-sm gap-3 mx-auto sm:max-w-full group hover:no-underline focus:no-underline lg:grid lg:grid-cols-12 bg-layout-sun-100 dark:bg-layout-night-100"
    >
        <!-- Das Bild des Blog-Posts -->
        <div class="relative lg:col-span-7">
        <img
            :src="blog.url"
            :alt="blog.name"
            loading="lazy"
            width="480"
            height="360"
            class="object-cover w-full h-64 sm:h-96 rounded lg:col-span-7 bg-layout-sun-500 dark:bg-layout-night-500"
        />

        <!-- Der AI-Button wird hier angezeigt -->
        <div v-if="blog.madewithai">
            <AiButton class="ai-button-image" :overlayImage="images/icons/blog.aiOverlayImage || 'images/icons/ai-dark.png'"></AiButton>
        </div>

        </div>
        <div class="p-6 space-y-2 lg:col-span-5">
            <!-- Blog-Kategorie -->
            <div class="flex justify-end items-start">
                <div
                    v-if="blog.category_name"
                    class="text-sm min-w-fit min-h-fit bg-primary-sun-500 text-primary-sun-900 dark:bg-primary-night-500 dark:text-primary-night-900 font-semibold px-2.5 py-0.5 rounded-lg whitespace-nowrap"
                >
                    {{ blog.category_name }}
                </div>
            </div>

            <!-- Blog-Titel -->
            <h2
                class="text-xl font-semibold sm:text-2xl font-title group-hover:underline group-focus:underline"
            >
                {{ blog.title }}
            </h2>

            <!-- Datum und Autor -->
            <div class="text-xs text-layout-sun-600 dark:text-layout-night-600 py-2">
                <display-date :value="blog.blog_date" :time-on="false" />
                von
                <span>{{ blog.author_name }}</span>
            </div>

            <!-- Blog-Zusammenfassung -->
            <div v-html="blog.summary" class="pb-6"></div>

            <!-- Lesezeit anzeigen -->
            <div>
                <display-number
                    :value="blog.reading_time"
                    :after-digits="0"
                    value-unit="Minuten Lesezeit"
                    value-single-unit="Minute Lesezeit"
                ></display-number>
            </div>
        </div>
    </Link>
</template>

<script>
import { Link } from "@inertiajs/vue3";

import DisplayDate from "@/Application/Components/Content/DisplayDate.vue";
import DisplayNumber from "@/Application/Components/Content/DisplayNumber.vue";
import AiButton from "@/Application/Components/Content/AiButton.vue";

export default {
    name: "Homepage_Shared_BlogPreviewBig",
    components: {
        Link,
        DisplayDate,
        DisplayNumber,
        AiButton,
    },
    props: {
        blog: {
            type: Object,
        },
        aiOverlayImage: {
            type: String,
        }
    },
};
</script>

<style scoped>
/* Hier kannst du zusätzliche Anpassungen vornehmen, falls nötig */
</style>
