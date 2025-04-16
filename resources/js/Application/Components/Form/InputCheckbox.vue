
<template>
    <div class="flex items-center h-6">
        <div class="flex items-center h-6">
            <input
                :id="name"
                :name="name"
                type="checkbox"
                class="w-5 h-5 rounded border focus:ring-3 bg-primary-sun-50 text-primary-sun-500 border-primary-sun-300 focus:ring-primary-sun-300 ring-offset-primary-sun-800 checked:bg-primary-sun-500 dark:bg-primary-night-50 dark:text-primary-night-500 dark:border-primary-night-300 dark:focus:ring-primary-night-300 dark:ring-offset-primary-night-800 dark:checked:bg-primary-night-500"
                :checked="!!modelValue"
                @change="toggle($event)"
            />
        </div>
        <div class="ml-3 text-sm">
            <label :for="name" class="...">
                <span v-if="label">{{ label }}</span>
                <span v-else><slot></slot></span>
                <icon-exclamation-circle v-if="helptext" class="inline-block ml-1 w-5 h-5" />
            </label>
            <tippy v-if="helptext" v-html="helptext" placement="left"></tippy>
        </div>
    </div>
</template>

<script>
import IconExclamationCircle from "@/Application/Components/Icons/ExclamationCircle.vue";

export default {
    name: "Contents_Form_InputCheckbox",
    components: { IconExclamationCircle },
    emits: ["update:modelValue"],
    props: {
        name: { type: String, required: true },
        modelValue: { type: [Number, Boolean], default: false },
        label: { type: String, default: "" },
        helptext: { type: String, default: "" },
    },
    methods: {
        toggle(e) {
            this.$emit("update:modelValue", e.target.checked ? 1 : 0);
        },
    },
};
</script>
