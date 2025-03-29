<template>
    <layout>
        <template #header>
            <breadcrumb
                :application-name="$page.props.applications.app_admin_name"
                :start-page="false"
                current="Liste der Tabellen"
            ></breadcrumb>
        </template>
        <section class="mt-8">
            <list-container
                title="Liste der Tabellen"
                :datarows="rows"
                route-index="admin.tables.index"
                :filters="filters"
                :search-filter="true"
                search-text="Gesucht werden alle Blogartikel, die den Suchbegriff im Titel, in der Zusammenfassung bzw. im Artikel selbst enthalten."
                :edit-on="false"
                route-edit="admin.tables.edit"
                :create-on="false"
                route-create="admin.tables.create"
                :delete-on="false"
                route-delete="admin.tables.destroy"
            >
                <template #header>
                    <tr>
                        <th class="np-dl-th-normal">Tabellenname</th>
                        <th class="np-dl-th-normal">Beschreibung</th>
                        <th class="np-dl-th-normal"></th>
                    </tr>
                </template>

                <template v-slot:datarow="data">
                    <td class="np-dl-td-normal">
                        <a
                        :href="route('admin.tables.show', data.datarow.full_name)"

                            class="text-blue-600 dark:text-blue-600 hover:underline"
                        >
                            {{ data.datarow.name }}</a
                        >
                    </td>
                    <td class="np-dl-td-normal">
                        {{ data.datarow.description }}
                    </td>
                </template>
            </list-container>
        </section>
    </layout>
</template>
<script>
import { defineComponent } from "vue";

import Layout from "@/Application/Admin/Shared/Layout.vue";
import Breadcrumb from "@/Application/Components/Content/Breadcrumb.vue";
import ListContainer from "@/Application/Components/Lists/ListContainer.vue";
import { CleanTable, CleanId } from '@/helpers';
const table = CleanTable();
export default defineComponent({
    name: "Admin_TableList",

    components: {
        Layout,
        Breadcrumb,
        ListContainer,
    },

    props: {
        rows: {
            type: Array,
            required: true,
            default: () => [],
        },
        datarows: {
            type: [Array,String],
            required: true,
            default: () => [],
        },
        routeCreate: {
        type: String,
        default: route('admin.tables.create', table),
    },
    },
    mounted() {
        // this.loadRows();
    },
    methods: {
        // async loadRows() {
            //     try {
            //         const response = await fetch('/api/table-rows'); // Beispiel-API
            //         this.rows = await response.json();
            //         console.log(this.rows);
            //     } catch (error) {
            //         console.error('Fehler beim Laden der Daten:', {
            //     message: error.message,
            //     stack: error.stack, // Stacktrace
            //     response: error.response // Nur bei Axios verfügbar
            // });
            //     }
        // },
    },
});
</script>
