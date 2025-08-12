<template>
    <template v-if="routeName">
        <a
            class="cursor-pointer inline-block rounded-lg px-2 py-1 text-sm text-layout-sun-700 hover:bg-primary-sun-300 hover:text-layout-sun-900 dark:text-layout-night-700 dark:hover:bg-primary-night-300 dark:hover:text-layout-night-900"
            :href="routeName"
        >
            <span>{{ name }}</span>
        </a>
    </template>
    <template v-else-if="href">
        <a
            class="cursor-pointer inline-block rounded-lg px-2 py-1 text-sm text-layout-sun-700 hover:bg-primary-sun-300 hover:text-layout-sun-900 dark:text-layout-night-700 dark:hover:bg-primary-night-300 dark:hover:text-layout-night-900"
            :href="href"
        >
            <span>{{ name }}</span>
        </a>
    </template>
    <template v-else>
        <div
            class="ckoo cursor-pointer inline-block rounded-lg px-2 py-1 text-sm text-layout-sun-700 hover:bg-primary-sun-300 hover:text-layout-sun-900 dark:text-layout-night-700 dark:hover:bg-primary-night-300 dark:hover:text-layout-night-900"
        >
            <slot></slot>
        </div>
    </template>
</template>

<script>
//
export default {
    name: "Shared_LinkFooter",
    //
    props: {
        routeName: {
            type: String,
            default: null,
        },
        name: {
            type: String,
            default: "Starter Eleven",
        },
        href:{
            type:String,
            default:'',
        },
    },
    mounted(){
        // alert(this.routeName);
    }
};
</script>
