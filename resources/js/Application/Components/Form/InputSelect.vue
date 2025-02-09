<template>
    <select
        class="w-full p-2.5 text-sm rounded-lg block border border-layout-sun-300 text-layout-sun-900 bg-layout-sun-50 placeholder-layout-sun-400 focus:ring-primary-sun-500 focus:border-primary-sun-500 dark:border-layout-night-300 dark:text-layout-night-900 dark:bg-layout-night-50 dark:placeholder-layout-night-400 dark:focus:ring-primary-night-500 dark:focus:border-primary-night-500"
        :value="modelValue"
        @change="$emit('update:modelValue', $event.target.value)"
        ref="select"
    >
        <template v-if="sortedOptions.constructor.name === 'Array'">
            <option
                v-for="(option, key) in sortedOptions"
                :value="option[0]"
                :key="key"
                :selected="option[0] === modelValue"
            >
                {{ option[1] }}
            </option>
        </template>
        <template v-if="sortedOptions.constructor.name === 'Object'">
            <option
                v-for="(option, key) in sortedOptions"
                :value="key"
                :key="key"
                :selected="option === modelValue"
            >
                {{ option }}
            </option>
        </template>
    </select>
</template>
<script>
export default {
    name: "Contents_Form_InputSelect",

    props: {
        modelValue: {
            type: [String, Number],
            default: "",
        },
        options: {
            type: [Array, Object],
            required: true,
        },
        sortColumn: {
            type: Number,
            default: 1,
        },
    },

    emits: ["update:modelValue"],

    computed: {
        sortedOptions() {
            if (this.options.constructor.name === "Array") {
                //
                return this.options.sort((a, b) => {
                    if (a[1] < b[1]) return -1;
                    if (a[1] > b[1]) return 1;
                    return 0;
                });
            } else if (this.options.constructor.name === "Object") {
                //
                if (this.sortColumn == 1) {
                    return Object.entries(this.options).sort(function (a, b) {
                        //
                        if (a[1] < b[1]) {
                            return -1;
                        }
                        if (a[1] > b[1]) {
                            return 1;
                        }
                        return 0;
                    });
                }
                //
                return Object.entries(this.options).sort(function (a, b) {
                    //
                    if (Number(a[0]) < Number(b[0])) {
                        //
                        return -1;
                    }
                    if (Number(a[0]) > Number(b[0])) {
                        //
                        return 1;
                    }
                    //
                    return 0;
                });
            }
            // Sonstige Fälle
            return this.options;
        },
    },

    methods: {
        focus() {
            this.$refs.select.focus();
        },
    },
};
</script>
