<template>
    <layout
        header-title="Pricing"
        :header-url="$page.props.saas_url + '/home/pricing'"
    >
        <page-content>
            <template #content>
                <page-title>
                    <template #title>Pricing</template>
                </page-title>
                <page-paragraph>
                    <template #paragraph> Text kommt noch. </template>
                </page-paragraph>
            </template>
        </page-content>
    </layout>
</template>
<script>
import { defineComponent } from "vue";
import Layout from "@/Application/Homepage/Shared/Layout.vue";

import PageContent from "@/Application/Components/Content/PageContent.vue";
import PageTitle from "@/Application/Components/Content/PageTitle.vue";
import PageParagraph from "@/Application/Components/Content/PageParagraph.vue";

export default defineComponent({
    name: "Homepage_Pricing",

    components: {
        Layout,
        PageContent,
        PageTitle,
        PageParagraph,
    },
});
</script>
