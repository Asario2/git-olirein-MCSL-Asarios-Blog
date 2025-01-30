<template>
    <template v-if="routeName">
        <a
            class="cursor-pointer inline-block rounded-lg px-2 py-1 text-sm
                text-layout-sun-700 hover:bg-layout-sun-200 hover:text-layout-sun-900
                dark:text-layout-night-700 dark:hover:bg-layout-night-200 dark:hover:text-layout-night-900
            "
            :href="routeName"
        >
            <span>{{ name }}</span>
        </a>
    </template>
    <template v-else>
        <div
            class="cursor-pointer inline-block rounded-lg px-2 py-1 text-sm
                text-layout-sun-700 hover:bg-layout-sun-200 hover:text-layout-sun-900
                dark:text-layout-night-700 dark:hover:bg-layout-night-200 dark:hover:text-layout-night-900
            "
        >
            <slot></slot>
        </div>
    </template>
</template>

<script>
//
export default {
    name: 'Shared_LinkHeader',
    //
    props: {
        routeName: {
            type: String,
            default: 'home'
        },
        name: {
            type: String,
            default: 'Starter Eleven'
        },
    }
}
</script>
