<template>
    <div v-if="GetSd() == 'ab'">
        <Link :href="routeName" class="flex items-center">
            <div>
                <favicon class="h-10 w-10 mr-4"></favicon>
            </div>
            <div
                class="hidden lg:block flex-col items-start justify-center md:flex"
            >
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
                    <span>{{ appName }}</span>
                </div>
            </div>
        </Link>
    </div>
    <div v-else-if="GetSd() == 'mfx'">
    <a href='/'><img src="/images/_mfx/web/brandheader.png"></a>
    </div>
</template>

<script>
import { Link } from "@inertiajs/vue3";

import Favicon from "@/Application/Components/Logo/Favicon.vue";

export default {
    name: "Shared_BrandHeader",
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
            default: "Asarios",
        },
        brand_2: {
            type: String,
            default: "Blog",
        },
        appName: {
            type: String,
            default: null,
        },
    },
    methods:{
    GetSd(){
        return window.subdomain;
    }
}
};

</script>
