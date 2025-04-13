<template>
    <div class="flex items-center h-6" id="golo">
        <div class="flex items-center h-6">
            <input
                :id="name"
                :name="name"
                type="checkbox"
                class="w-5 h-5 rounded border focus:ring-3 bg-primary-sun-50 text-primary-sun-500 border-primary-sun-300 focus:ring-primary-sun-300 ring-offset-primary-sun-800 checked:bg-primary-sun-500 dark:bg-primary-night-50 dark:text-primary-night-500 dark:border-primary-night-300 dark:focus:ring-primary-night-300 dark:ring-offset-primary-night-800 dark:checked:bg-primary-night-500"
                :checked="modelValue === 1"
                @change="toggle($event)"
                :value="value"
            />
        </div>
        <div class="ml-3 text-sm">
            <label
                :for="name"
                class="font-medium text-layout-sun-900 dark:text-layout-night-900"
                v-tippy
            >
                <span v-if="label">{{ label }}</span>
                <span v-else><slot></slot></span>
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
            type: [Number, Boolean],
            default: 0,  // Setzt den Standardwert auf 0
        },
        label: {
            type: String,
            default: "",
        },
        helptext: {
            type: String,
            default: "",
        },
        value: {
            type: [String, Number],
            required: true,
        },
    },

    methods: {
        toggle(e) {
            // Überprüfen, ob die Checkbox angehakt ist
            const newValue = e.target.checked ? 1 : 0;
            // Emit den neuen Wert (0 oder 1)
            this.$emit("update:modelValue", newValue);
        },
    },
};
</script>
