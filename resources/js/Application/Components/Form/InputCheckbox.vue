<template>
    <div class="flex items-center h-6">
        <div class="flex items-center h-6">
            <input
                :id="name"
                type="checkbox"
                class="w-5 h-5 rounded border focus:ring-3 bg-primary-sun-50 text-primary-sun-500 border-primary-sun-300 focus:ring-primary-sun-300 ring-offset-primary-sun-800 checked:bg-primary-sun-500 dark:bg-primary-night-50 dark:text-primary-night-500 dark:border-primary-night-300 dark:focus:ring-primary-night-300 dark:ring-offset-primary-night-800 dark:checked:bg-primary-night-500"
                :checked="checked"
                value='0'
                @change="$emit('update:modelValue', $event.target.checked)"
            />
        </div>
        <div class="ml-3 text-sm">
            <label
                :for="name"
                class="font-medium text-layout-sun-900 dark:text-layout-night-900"
                v-tippy
            >
                <span v-if="label">{{ label }}</span>
                <span v-else><slot></slot> </span>
                <icon-exclamation-circle
                    v-if="helptext"
                    class="inline-block ml-1 w-5 h-5"
                ></icon-exclamation-circle>
            </label>
            <tippy v-if="helptext" v-html="helptext" placement="left"></tippy>
        </div>
    </div>
</template>

<script>
import IconExclamationCircle from "@/Application/Components/Icons/ExclamationCircle.vue";

export default {
    name: "Contents_Form_InputCheckbox",

    components: {
        IconExclamationCircle,
    },

    emits: ["update:modelValue"],

    props: {
        name: {
            type: String,
            required: true,
        },
        modelValue: {
            type: [Boolean, Number],
            default: false,
        },
        label: {
            type: String,
            default: "",
        },
        helptext: {
            type: String,
            default: "",
        },
        checked: {
            type: Boolean,
            default: false,
        },
    },
};
</script>
