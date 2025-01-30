<template>
    <div :class="withTitle ? 'md:grid md:grid-cols-3 md:gap-6' : ''">
        <SectionTitle v-if="withTitle" class="md:col-span-1">
            <template #title>
                <slot name="title" />
            </template>
            <template #description>
                <slot name="description" />
            </template>
        </SectionTitle>

        <div :class="withTitle ? 'mt-5 md:mt-0 md:col-span-2' : ''">
            <form @submit.prevent="$emit('submitted')">
                <div class="flex flex-col">
                    <div
                        class="px-1 lg:px-4 py-2 border-t border-r border-l border-layout-sun-100 dark:border-layout-night-100 bg-layout-sun-200 text-layout-sun-800 dark:bg-layout-night-200 dark:text-layout-night-800"
                        :class="
                            hasActions
                                ? 'lg:rounded-tl-lg lg:rounded-tr-lg'
                                : 'lg:rounded-lg border-b'
                        "
                        v-if="hasForm"
                    >
                        <slot name="form" />
                    </div>
                    <div
                        v-if="hasActions"
                        class="px-1 md:px-4 lg:px-8 py-2 border-l border-r border-b border-layout-sun-100 dark:border-layout-night-100 bg-layout-sun-200 dark:bg-layout-night-200 lg:rounded-bl-lg lg:rounded-br-lg"
                    >
                        <div class="flex items-center justify-end">
                            <slot name="actions" />
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</template>
<script>
import SectionTitle from "@/Application/Components/Content/SectionTitle.vue";

export default {
    name: "Components_Content_SectionForm",

    components: {
        SectionTitle,
    },

    props: {
        withTitle: {
            type: Boolean,
            default: false,
        },
    },

    emits: ["submitted"],

    computed: {
        hasForm() {
            return !!this.$slots.form;
        },
        hasActions() {
            return !!this.$slots.actions;
        },
    },
};
</script>
