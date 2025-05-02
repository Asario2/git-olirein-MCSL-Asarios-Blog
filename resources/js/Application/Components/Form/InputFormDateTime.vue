<template>
    <div class="mb-4">
        <label
            :for="id"
            class="block text-sm font-medium text-gray-700 dark:text-gray-300"
        >
            <slot name="label">Label</slot>
        </label>
        <input
            type="datetime-local"
            :id="id"
            step="1"
            :name="name"
            :placeholder="placeholder"
            :class="[
                'w-fully p-2.5 text-sm rounded-lg block border focus:ring-3 focus:ring-opacity-75 bg-layout-sun-0 text-layout-sun-900 border-primary-sun-500 focus:border-primary-sun-500 focus:ring-primary-sun-500 placeholder:text-layout-sun-400 selection:bg-layout-sun-200 selection:text-layout-sun-1000 dark:bg-layout-night-0 dark:text-layout-night-900 dark:border-primary-night-500 dark:focus:border-primary-night-500 dark:focus:ring-primary-night-500 placeholder:dark:text-layout-night-400 dark:selection:bg-layout-night-200 dark:selection:text-layout-night-1000',
                { 'cursor-not-allowed opacity-50': disabled }
                ]"
            :disabled="disabled === 'disabled'"
            :value="modelValue"
            @input="$emit('update:modelValue', $event.target.value)"
        />
    </div>
</template>

<script>
export default {
    name: "InputFormDateTime",
    props: {
        id: {
            type: String,
            required: true,
        },
        name: {
            type: String,
            required: true,
        },
        modelValue: { type: String, },
        placeholder: {
            type: String,
            default: "",
        },
        disabled: {
      type: [String, Array, Object],
      default: '',
    },
    },
};
</script>

<style scoped>
.w-fully{
    min-width:94%;
    max-width:94%;
}
</style>
