<template>
    <Link
        :href="route('home.blog.show', blog.slug)"
        class="min-w-full max-w-sm mx-auto group rounded hover:no-underline focus:no-underline bg-layout-sun-100 dark:bg-layout-night-100"
    ><div class="relative lg:col-span-7">
        <img
            role="presentation"
            class="object-cover w-full rounded h-44 bg-layout-sun-500 dark:bg-layout-night-500"
            :src="blog.url"
            :alt="blog.name"
            loading="lazy"
            width="480"
            height="360"
        />
        <AiButton class="ai-button-image" :overlayImage="images/icons/blog.aiOverlayImage || 'images/icons/ai-dark.png'"></AiButton>
    </div>
        <div class="p-6 space-y-2">
            <div class="flex justify-end items-start">
                <div
                    v-if="blog.category_name"
                    class="text-sm min-w-fit min-h-fit bg-primary-sun-500 text-primary-sun-900 dark:bg-primary-night-500 dark:text-primary-night-900 font-semibold px-2.5 py-0.5 rounded-lg whitespace-nowrap"
                >
                    {{ blog.category_name }}
                </div>
            </div>
            <h2
                class="text-2xl font-semibold font-title group-hover:underline group-focus:underline"
            >
                {{ blog.title }}
            </h2>
            <span
                class="text-xs text-layout-sun-600 dark:text-layout-night-600"
            >
                <display-date :value="blog.blog_date" :time-on="false" />
                von
                <span>{{ blog.author_name }}</span>
            </span>
            <p v-html="blog.summary"></p>
            <p>
                <display-number
                    :value="blog.reading_time"
                    :after-digits="0"
                    value-unit="Minuten Lesezeit"
                    value-single-unit="Minute Lesezeit"
                ></display-number>
            </p>
        </div>
    </Link>
</template>
<script>
import { Link } from "@inertiajs/vue3";

import DisplayDate from "@/Application/Components/Content/DisplayDate.vue";
import DisplayNumber from "@/Application/Components/Content/DisplayNumber.vue";
import AiButton from "@/Application/Components/Content/AiButton.vue";

export default {
    name: "Shared_Homepage_BlogPreviewSmall",
    //
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
        },
    },
};
</script>
