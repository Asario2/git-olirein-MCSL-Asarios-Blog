<template>
    <div>
      <label for="positionSelect" class="block mb-2 font-medium">Neue Position wählen:</label>
      <select   class="w-fully wf_2 wff p-2.5 text-sm rounded-lg block border border-layout-sun-300 text-layout-sun-900 bg-layout-sun-50 placeholder-layout-sun-400 focus:ring-primary-sun-500
                focus:border-primary-sun-500 dark:border-layout-night-300
                dark:text-layout-night-900 dark:bg-layout-night-50 dark:placeholder-layout-night-400 dark:focus:ring-primary-night-500 dark:focus:border-primary-night-500"
                id="positionSelect"
                v-model="selectedPosition"
                @change="emitPosition" >
        <option value="1">Ganz Oben</option>
        <option
          v-for="(item, index) in entries"
          :key="item.id"
          :value="index + 2"
        >
          Nach "{{ item.title }}"
        </option>
      </select>
    </div>
    <input type="hidden" :name="name" :id="name" :value="selectedPosition"
  </template>

  <script>
  export default {
    name: "InputPosition",
    props: {
      entries: { type: Array, required: true }, // [{id: 1, title: 'foo', position: 1}, ...]
      currentPosition: { type: Number, default: 1 } // Position des Eintrags aus DB

    },
    data() {
    return {
      selectedPosition: this.currentPosition
    };
  },
  watch: {
    currentPosition(newVal) {
      this.selectedPosition = newVal;
    }
  },
  methods: {
    emitPosition() {
      this.$emit("position-changed", this.selectedPosition);
    }
  },
  };
  </script>


