<template>
    <layout header-title="Nutzungsbedingungen">
        <page-content>
            <template #content>
                <markdown :markdown="terms"></markdown>
            </template>
        </page-content>
    </layout>
</template>
<script>
import { defineComponent } from "vue";
import Layout from "@/Application/Homepage/Shared/Layout.vue";

import PageContent from "@/Application/Components/Content/PageContent.vue";
import Markdown from "@/Application/Components/Content/Markdown.vue";

export default defineComponent({
    name: "Homepage_Terms",

    props: {
        terms: {
            type: String,
            required: true,
        },
    },

    components: {
        Layout,
        PageContent,
        Markdown,
    },
});
</script>
