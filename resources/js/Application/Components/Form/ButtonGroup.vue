<template>
    <div class="w-full flex flex-wrap items-center gap-2" :class="align">
        <slot></slot>
    </div>
</template>
<script>
export default {
    name: "Contents_Form_ButtonGroup",

    props: {
        align: {
            type: String,
            default: "justify-center md:justify-end",
        },
    },
};
</script>
