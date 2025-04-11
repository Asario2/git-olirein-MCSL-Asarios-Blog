<template>
    <select
        class="w50 w-full p-2.5 text-sm rounded-lg block border border-layout-sun-300 text-layout-sun-900 bg-layout-sun-50 placeholder-layout-sun-400 focus:ring-primary-sun-500 focus:border-primary-sun-500 dark:border-layout-night-300 dark:text-layout-night-900 dark:bg-layout-night-50 dark:placeholder-layout-night-400 dark:focus:ring-primary-night-500 dark:focus:border-primary-night-500"
        :value="xval"
        @input="$emit('update:modalValue', $event.target.value)"
        @change="$emit('input-change', $event.target.value, xname)"
        ref="select"
        :id="xname + '_' + xid"
        :required="required"
        :users_id="users_id"
        v-model="users_id"
    >
        <template v-if="Array.isArray(sortedOptions_sel)">
            <option
                v-for="(option, key) in sortedOptions_sel"
                :value="String(option[0])"
                :key="key"

                >
                {{ option[1] }}
            </option>
        </template>
        <template v-else-if="typeof sortedOptions_sel === 'object'">
            <option
                v-for="(value, key) in sortedOptions_sel"
                :value="String(key)"
                :key="key">



                {{ value }}
            </option>
        </template>
    </select>

    <input type="hidden" :name="xname" id="hv" :value="selectedValue" />
</template>

<script>
    import $ from "jquery";
    window.$ = window.jQuery = $;
export default {
    name: "Contents_Form_InputSelect",

    data() {
        return {
            selectedValue: '',
            formData: {},
        };
    },

    props: {
        required: { type: [Number, String, Boolean], default: false },
        modelValue:{
            type: [String, Number],
        },
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
            type: String,
        },
        name:{
            type: String
        },
    },

    emits: ["input-change"],

    watch: {
    xval: {
        immediate: true,
        handler(newValue) {
            this.selectedValue = newValue;
        }
    },
    modelValue(newValue) {
        this.selectedValue = newValue;
        this.xval = newValue;
    }
},
methods: {
    actsel() {
        $("#" + this.xname + '_' + this.xid).change(function () {
            let selectedValue = $(this).val();
            var modelValue;
            let formData;
            modelValue = selectedValue;
            $('hv').val(modelValue);
            this.xval = modelValue;
            // formData[this.xname]  = this.xval;
        });
    },
    // updateFormData(event) {
    //     if (!this.formData) {
    //         this.formData = {}; // Falls undefined, initialisieren
    //     }
    //     if(!this.xname){
    //         this.xname = 'test';
    //     }
    //     this.formData[this.xname] = event.target.value;
    //     console.log(this.formData);
    // }
},

computed: {
    sortedOptions_sel() {
        if (Array.isArray(this.options)) {
            return [...this.options];
        } else if (typeof this.options === "object") {
            return Object.fromEntries(Object.entries(this.options));
        }
        return this.options;
    }
},

mounted() {
    this.actsel(); // Methode wird nach dem Mounten ausgeführt
}
};

</script>
