<template>
    <div class="my-2 bg-layout-sun-200 dark:bg-layout-night-200 lg:rounded-lg">
        <div class="p-1 md:p-4">
            <slot name="content" />
        </div>
    </div>
</template>

<script>
export default {
    name: "Components_Content_PageContent",
};
</script>
