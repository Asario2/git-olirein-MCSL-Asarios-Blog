<template>
    <div class="w-full flex flex-wrap items-center gap-2" :class="align">
        <slot></slot>
    </div>
</template>
<script>
import { CleanTable, CleanId } from '@/helpers';
const table = CleanTable();
export default {
    name: "Contents_Form_ButtonGroup",

    props: {
        align: {
            type: String,
            default: "justify-center md:justify-end",
        },
        routeCreate: {
        type: String,
        default: route('admin.tables.create', table),
    },
    },
};
</script>
