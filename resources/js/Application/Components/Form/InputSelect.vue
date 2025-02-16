<template>
    <select
        class="w-full p-2.5 text-sm rounded-lg block border border-layout-sun-300 text-layout-sun-900 bg-layout-sun-50 placeholder-layout-sun-400 focus:ring-primary-sun-500 focus:border-primary-sun-500 dark:border-layout-night-300 dark:text-layout-night-900 dark:bg-layout-night-50 dark:placeholder-layout-night-400 dark:focus:ring-primary-night-500 dark:focus:border-primary-night-500"
        v-model="selectedValue"
        @change="$emit('update:modelValue', selectedValue)"
        ref="select"
        :name="xname"
    >
        <template v-if="Array.isArray(sortedOptions)">
            <option
                v-for="(option, key) in sortedOptions"
                :value="option[0]"
                :key="key"
            >
                {{ option[1] }}
            </option>
        </template>
        <template v-else-if="typeof sortedOptions === 'object'">
            <option
                v-for="(value, key) in sortedOptions"
                :value="key"
                :key="key"
            >
                {{ value }}
            </option>
        </template>
    </select>
    <input type="hidden" :name="xname" id="hv" :value="selectedValue" />
</template>

<script>
export default {
    name: "Contents_Form_InputSelect",

    data() {
        return {
            selectedValue: this.xval,
            "v-model": '',
          };
    },

    props: {
        modelValue: [String, Number],
        options: {
            type: [Array, Object],
            required: true,
        },
        sortColumn: {
            type: Number,
            default: 1,
        },
        xval: {
            type: [String, Number],
            default: 1,
        },
        xname: {
            type: String,
            default: "select-field",
        },
        id:{
            type: Number,
        },
        name:{
            type: String
        }
    },

    emits: ["update:modelValue"],

    watch: {
    xval: {
        immediate: true,
        handler(newValue) {
            this.selectedValue = newValue;
        }
    },
    modelValue(newValue) {
        this.selectedValue = newValue;
    }
},

    computed: {
        sortedOptions() {
            if (Array.isArray(this.options)) {
                return [...this.options].sort((a, b) => a[1].localeCompare(b[1]));
            } else if (typeof this.options === "object") {
                return Object.fromEntries(Object.entries(this.options).sort((a, b) => a[1].localeCompare(b[1])));
            }
            return this.options;
        }
    }
};
</script>
