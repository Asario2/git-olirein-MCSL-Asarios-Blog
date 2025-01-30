<template>
    <layout
        header-title="Seite nicht gefunden"
        :header-url="$page.props.saas_url + '/no_page_found'"
    >
        <page-title>
            <template #title>Seite nicht gefunden!</template>
        </page-title>
    </layout>
</template>
<script>
import { defineComponent } from "vue";
import Layout from "@/Application/Homepage/Shared/Layout.vue";

import PageTitle from "@/Application/Components/Content/PageTitle.vue";

export default defineComponent({
    name: "Homepage_NoPageFound",

    components: {
        Layout,
        PageTitle,
    },
});
</script>
