    <template>


    <select
        class="w-full wf_2 p-2.5 text-sm rounded-lg block border border-layout-sun-300 text-layout-sun-900 bg-layout-sun-50 placeholder-layout-sun-400 focus:ring-primary-sun-500 focus:border-primary-sun-500 dark:border-layout-night-300 dark:text-layout-night-900 dark:bg-layout-night-50 dark:placeholder-layout-night-400 dark:focus:ring-primary-night-500 dark:focus:border-primary-night-500"
        :value="xval"
        :name="name"
        @input="$emit('update:modalValue', $event.target.value)"
        @change="$emit('input-change', $event.target.value, xname)"
        ref="select"
        :id="name"
        :required="required"
        :options="options"
        :sortedOptions="options"
    >
    <option disabled value="">Bitte wählen</option>
    <option v-for="option in this.arr" :key="option.id" :value="option.id">
  {{ option.name }}
</option>
        <!-- <template v-if="Array.isArray(sortedOptions)">
            <option
                v-for="(option, key) in sortedOptions"
                :value="option[0]"
                :key="key"

                :selected="option[0] === xval">
                {{ option[1] }}
            </option>
        </template>
        <template v-else-if="typeof sortedOptions === 'object'">
            <option
                v-for="(value, key) in sortedOptions"
                :value="key"
                :key="key"

                :selected="option === xval"
            >
                {{ value }}
            </option>
        </template> -->
    </select>

    <input type="hidden" :name="xname" id="hv" :value="selectedValue" />
</template>

<script>

    import $ from "jquery";
    window.$ = window.jQuery = $;
export default {
    name: "Contents_Form_InputSelect",
    emits: ["input-change", "update:modalValue"],
    data() {
        return {
        selectedOption: null,
        sortedOptions: {},
        xsor_alt: {}, // Stelle sicher, dass dies ein Objekt ist!
        xsor: {}, // Stelle sicher, dass dies ein Objekt ist!
        arr: {},
    };
    },

    props: {
        required: { type: [String, Boolean], default: false },
        modelValue:{
            type: [String, Number],
        },
        uname:{type:String, },

        xid:{type:[String,Number]},
        name:{type:String},

        options: {
            type: [Array, Object],
            required: false,
        },
        xsor:{
            type: [Array, Object],
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
        }
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
    stripslashes(input) {
    if (typeof input === 'string') {
        // Entfernt Backslashes aus dem String
        return input.replace(/\\(.)/g, '$1');
    } else if (Array.isArray(input)) {
        // Falls es ein Array ist, wende die Funktion auf jedes Element an
        return input.map(item => stripslashes(item));
    } else if (typeof input === 'object' && input !== null) {
        // Falls es ein Objekt ist, wende die Funktion rekursiv auf alle Werte an
        let result = {};
        for (let key in input) {
        if (input.hasOwnProperty(key)) {
            result[key] = stripslashes(input[key]);
        }
        }
        return result;
    }
    return input; // Falls es weder ein String noch ein Array noch ein Objekt ist, gebe den Wert unverändert zurück
    },
    getOptions() {
    axios.get('/tables/sort-data/' + this.name)
    .then(response => {
        //console.log("Daten von der API:", response.data);

        // Setze xsor
        this.xsor = { ...this.xsor, [this.name]: response.data };

        // Setze arr basierend auf xsor
        this.arr = this.xsor[this.name]?.[this.name + ".sortedOptions"] || [];

        //console.log("XSOR nach API-Call:", JSON.stringify(this.xsor, null, 2));
        //console.log("ARR nach API-Call:", JSON.stringify(this.arr, null, 2));
        this.$nextTick(() => {
            //console.log("ARR nach nextTick:", JSON.stringify(this.arr, null, 2));
        });

    })
    .catch(error => {
        console.error('Fehler beim Abrufen der Daten:', error);
    });
},

    // getOptions() {
    //   axios.get('/tables/sort-data/' + this.name)
    //     .then(response => {
    //       console.log("Daten von der API:", response.data);
    //       let opp = false;
    //         this.xsor[this.name] = response.data;
    //       let namex = false;
    //       opp = response.data;
    //       namex  = this.name;
    //       const uname = this.name + ".sortedOptions";
    //       this.uname = uname;
    //       this.arr  = this.xsor[this.name][this.uname];
    //       opp = opp[namex];
    //       console.log("sfg:"+ JSON.stringify(this.sortedOptions,null,2));
    //       console.log("OP:"+JSON.stringify(opp,null,2));
    //       console.log("XSOR:" + JSON.stringify(this.xsor[this.name][uname]));
    //     })
    //     .catch(error => {
    //       console.error('Fehler beim Abrufen der Daten:', error);
    //     });
    // },
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
    sortedOptions() {
        if (Array.isArray(this.options)) {
            return [...this.options];
        } else if (typeof this.options === "object") {
            return Object.fromEntries(Object.entries(this.options));
        }
        let ot = [];
        this.ot[this.name] = this.options;
        this.options = ot;
        this.sortedOptions = this.ot
       // console.log("asdddd" + this.options);
       return this.ot;
    }
},
arr() {
        return this.xsor[this.name]?.[this.name + ".sortedOptions"] || [];
    },
mounted() {
    this.actsel(); // init jquery change
  if (this.options && Array.isArray(this.options)) {
    this.arr = this.options;
  } else {
    this.getOptions(); // Nur wenn keine Optionen übergeben wurden
  }
}
};

</script>
