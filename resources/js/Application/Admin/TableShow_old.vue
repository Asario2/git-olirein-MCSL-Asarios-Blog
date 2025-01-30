<template>
    <div class="p-6 bg-gray-100 dark:bg-gray-800 min-h-screen">
      <!-- Header with Search and New Button -->
      <div class="flex justify-between items-center mb-4">
        <h1 class="text-xl font-bold text-gray-800 dark:text-gray-200">Verwaltung</h1>
        <div class="flex items-center gap-4">
          <!-- Search Input -->
          <input
            type="text"
            v-model="searchQuery"
            placeholder="Suche..."
            class="px-4 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-blue-300 dark:bg-gray-700 dark:text-gray-200 dark:border-gray-600"
          />
          <!-- New Button -->
          <button
            @click="createNew"
            class="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700 dark:bg-blue-500 dark:hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-300"
          >
            Neu
          </button>
        </div>
      </div>

      <!-- Table -->
      <table class="min-w-full bg-white dark:bg-gray-900 border-collapse border border-gray-300 dark:border-gray-700 rounded-lg overflow-hidden">
        <thead>
          <tr class="bg-gray-200 dark:bg-gray-700 text-gray-700 dark:text-gray-300">
            <th class="px-4 py-2 text-left border border-gray-300 dark:border-gray-600">ID</th>
            <th class="px-4 py-2 text-left border border-gray-300 dark:border-gray-600">Title / Name</th>
            <th class="px-4 py-2 text-center border border-gray-300 dark:border-gray-600">Edit</th>
            <th class="px-4 py-2 text-center border border-gray-300 dark:border-gray-600">Delete</th>
          </tr>
        </thead>
        <tbody>
          <!-- Filtered Rows -->
          <tr
            v-for="(row, index) in filteredData"
            :key="row.id"
            class="text-gray-800 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-700"
          >
            <td class="px-4 py-2 border border-gray-300 dark:border-gray-600">{{ row.id }}</td>
            <td class="px-4 py-2 border border-gray-300 dark:border-gray-600">{{ row.title }}</td>
            <td class="px-4 py-2 text-center border border-gray-300 dark:border-gray-600">
              <button
                @click="editRow(row.id)"
                class="text-blue-600 dark:text-blue-400 hover:underline"
              >
                Bearbeiten
              </button>
            </td>
            <td class="px-4 py-2 text-center border border-gray-300 dark:border-gray-600">
              <button
                @click="deleteRow(row.id)"
                class="text-red-600 dark:text-red-400 hover:underline"
              >
                Löschen
              </button>
            </td>
          </tr>
          <!-- No Data Message -->
          <tr v-if="filteredData.length === 0">
            <td colspan="4" class="px-4 py-2 text-center text-gray-500 dark:text-gray-400">
              Keine Daten gefunden.
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </template>

  <script>
  export default {
    data() {
      return {
        searchQuery: "", // Suchfeld
        tableData: [
          { id: 1, title: "Erster Eintrag" },
          { id: 2, title: "Zweiter Eintrag" },
          { id: 3, title: "Dritter Eintrag" },
        ],
      };
    },
    computed: {
      filteredData() {
        // Filtert die Tabelle basierend auf der Suchanfrage
        return this.tableData.filter((row) =>
          row.title.toLowerCase().includes(this.searchQuery.toLowerCase())
        );
      },
    },
    methods: {
      createNew() {
        alert("Neu erstellen!");
      },
      editRow(id) {
        alert(`Eintrag ${id} bearbeiten`);
      },
      deleteRow(id) {
        if (confirm(`Eintrag ${id} löschen?`)) {
          this.tableData = this.tableData.filter((row) => row.id !== id);
        }
      },
    },
  };
  </script>

  <style>
  /* Optional: Additional custom styles if needed */
  </style>
