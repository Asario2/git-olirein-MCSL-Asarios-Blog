<template>
    <div class="w-full flex flex-wrap items-center gap-2" :class="align">
        <slot></slot>
    </div>
</template>
<script>
const path = window.location.pathname; // Gibt "/admin/tables/show/Example" zurück
const segments = path.split("/"); // Teilt den Pfad in Segmente auf
const table = segments[segments.length - 1];
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
