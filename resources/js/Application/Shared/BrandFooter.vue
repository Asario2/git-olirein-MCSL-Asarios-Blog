<template>
    <div>
        <Link :href="routeName" class="flex items-center">
            <div>
                <favicon class="h-10 w-10 mr-2"></favicon>
            </div>
            <div class="flex-col items-start justify-center md:flex">
                <div
                    class="font-logo text-xl lg:text-3xl leading-snug whitespace-nowrap tracking-widest font-bold"
                >
                    <span
                        v-if="brand_1"
                        class="text-primary-sun-500 dark:text-primary-night-500"
                        >{{ brand_1 }}</span
                    >
                    <span
                        v-if="brand_2"
                        class="text-layout-sun-500 dark:text-layout-night-500"
                        >{{ brand_2 }}</span
                    >
                </div>
                <div
                    class="font-title text-xs lg:text-sm leading-snug whitespace-nowrap tracking-wide"
                    v-if="appName"
                >
                    <span> {{ appName }}</span>
                </div>
            </div>
        </Link>
    </div>
</template>

<script>
import { Link } from "@inertiajs/vue3";

import Favicon from "@/Application/Components/Logo/Favicon.vue";

export default {
    name: "Shared_BrandFooter",
    //
    components: {
        Link,
        Favicon,
    },
    //
    props: {
        routeName: {
            type: String,
            default: "home",
        },
        brand_1: {
            type: String,
            default: "Starter",
        },
        brand_2: {
            type: String,
            default: "Eleven",
        },
        appName: {
            type: String,
            default: null,
        },
    },
};
</script>
