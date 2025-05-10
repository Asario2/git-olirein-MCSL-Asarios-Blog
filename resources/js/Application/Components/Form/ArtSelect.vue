<template>
    <div>
      <label for="category" class="block mb-2 text-sm font-medium text-layout-sun-900 dark:text-layout-night-900">
        Kategorie wählen:
      </label>
      <select
        id="category_id"
        v-model="selectedCategory"
        class="w-full wf_2 w-fully p-2.5 text-sm rounded-lg block border border-layout-sun-300 text-layout-sun-900 bg-layout-sun-50 placeholder-layout-sun-400 focus:ring-primary-sun-500 focus:border-primary-sun-500 dark:border-layout-night-300 dark:text-layout-night-900 dark:bg-layout-night-50 dark:placeholder-layout-night-400 dark:focus:ring-primary-night-500 dark:focus:border-primary-night-500"
      >
        <option value="0" disabled>Bitte wählen</option>
        <option v-for="category in sortedCategories" :key="category.id" :value="category.id">
          {{ category.name }}
        </option>
      </select>
      <label v-if="selectedCategory" for="medium" class="block mb-2 text-sm font-medium text-layout-sun-900 dark:text-layout-night-900">
        Medium wählen:
      </label>
      <select
        v-if="selectedCategory && formattedMediums(selectedCategory).length > 0"
        id="type_id"
        v-model="selectedMedium"
        class="w-full wf_2 w-fully p-2.5 text-sm rounded-lg block border border-layout-sun-300 text-layout-sun-900 bg-layout-sun-50 placeholder-layout-sun-400 focus:ring-primary-sun-500 focus:border-primary-sun-500 dark:border-layout-night-300 dark:text-layout-night-900 dark:bg-layout-night-50 dark:placeholder-layout-night-400 dark:focus:ring-primary-night-500 dark:focus:border-primary-night-500"
      >
        <option value="0" disabled>Bitte wählen</option>
        <option v-for="medium in formattedMediums(selectedCategory)" :key="medium.id" :value="medium.id">
          {{ medium.name }}
        </option>
      </select>
    </div>
  </template>

  <script>
  import axios from "axios";

  export default {
    data() {
      return {
        selectedCategory: null,
        selectedMedium: null,
        categories: []
      };
    },
    props: {
      table: String,
      id: [String, Number]
    },
    computed: {

  sortedCategories() {
    return [...this.categories].sort((a, b) => a.name.localeCompare(b.name));
  },
  formattedMediums() {
    return (categoryId) => {


      // Stelle sicher, dass categoryId als Number vorliegt
      const catId = Number(categoryId);

      const category = this.categories.find(cat => Number(cat.id) === catId);


      if (!category) {

        return [];
      }



      return category.types.length > 0
        ? [...category.types].sort((a, b) => a.name.localeCompare(b.name))
        : [];
    };
  }
},
    async created() {
      try {
        const response = await axios.get(route("ArtAct", [this.table, this.id]));


        if (response.data.categories) {
          this.categories = response.data.categories;
        } else {
          this.categories = [];
        }



        // Falls die API eine gespeicherte Kategorie/Medium zurückgibt, setzen
        this.selectedCategory = response.data.selected_category_id || (this.categories.length > 0 ? this.categories[0].id : null);


        const availableMediums = this.formattedMediums(this.selectedCategory);


        this.selectedMedium = response.data.selected_medium_id || (availableMediums.length > 0 ? availableMediums[0].id : null);

      } catch (error) {
        console.error("❌ Fehler beim Laden der Kategorien:", error);
      }
    }
  };
  </script>

  <style scoped>
@media (min-width: 1024px) {
.maxx{
    max-width:200% !important;
    min-width:200% !important;
}
}
  </style>
