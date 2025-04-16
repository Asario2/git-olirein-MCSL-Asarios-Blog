<template>
    <div>
        <table class="np-dl-table w-full">
            <thead class="np-dl-thead">
                <tr>
                    <th></th>
                    <th>Tabelle</th>
                    <th v-tippy="'Tabelle Anzeigen'">View</th>
                    <th v-tippy="'Hinzufügen von Daten'">Add</th>
                    <th v-tippy="'Bearbeiten'">Edit</th>
                    <th v-tippy="'Veröffentlichen'">Publish</th>
                    <th v-tippy="'Datum ändern'">Date</th>
                    <th v-tippy="'Löschen'">Delete</th>
                </tr>
            </thead>
            <tbody style="padding:5px;">
                <tr v-for="(table, index) in adminTables" :key="table.id" class="np-dl-tr">
                    <td class="np-dl-td-normal"><IconRight fill='currentColor' @click='togglerow(index)'   v-tippy="'Alle Rechte in dieser Zeile an/aus'" class="cursor-pointer"/></td>
                    <td class="np-dl-td-normal">{{ this.ucf(table.name) }}</td>

                    <td class="np-dl-td-normal"><InputCheckbox name='view_asd' v-tippy="this.ucf(adminTables[index]['name']) + ' Anzeigen'" v-model="rights.view_table[index]" /></td>
                    <td class="np-dl-td-normal"><InputCheckbox name='view_asd' v-tippy="this.ucf(adminTables[index]['name']) + ' Hinzufügen'" v-model="rights.add_table[index]" /></td>
                    <td class="np-dl-td-normal"><InputCheckbox name='view_asd'  v-tippy="this.ucf(adminTables[index]['name']) + ' Bearbeiten'" v-model="rights.edit_table[index]" /></td>
                    <td class="np-dl-td-normal"><InputCheckbox name='view_asd'  v-tippy="this.ucf(adminTables[index]['name']) + ' Veröffentlichen'" v-model="rights.publish_table[index]" /></td>
                    <td class="np-dl-td-normal"><InputCheckbox name='view_asd'  v-tippy="this.ucf(adminTables[index]['name']) + ' Datum ändern'" v-model="rights.date_table[index]" /></td>
                    <td class="np-dl-td-normal"><InputCheckbox name='view_asd'  v-tippy="this.ucf(adminTables[index]['name']) +  ' Löschen'" v-model="rights.delete_table[index]" /></td>
                </tr>
            </tbody>
        </table>

        <button @click="saveRights">Speichern</button>
    </div>
</template>

<script>
import Breadcrumb from "@/Application/Components/Content/Breadcrumb.vue";
import InputCheckbox from "@/Application/Components/Form/InputCheckbox.vue";
import IconRight from "@/Application/Components/Icons/IconRight.vue";
export default {
    name: "RightsTable",
    components: {
        Breadcrumb,
        InputCheckbox,
        IconRight,
    },
    props: {
        adminTables: Array, // z. B. [{id: 1, name: "users"}, ...]
         // z. B. { view_table: "101", add_table: "111", ... }
         userRights: {
        type: Object,
            required:true,
    },
    },

    data() {
        const rights = {};
        const fields = [
            "view_table",
            "add_table",
            "edit_table",
            "publish_table",
            "date_table",
            "delete_table",
        ];

        for (const field of fields) {
            rights[field] = [];
        }

        return { rights };
    },

    mounted() {
        this.initializeRights();
        console.log("userRights:", this.userRights);
    },

    methods: {
        initializeRights() {
            const fieldNames = Object.keys(this.rights);
            for (const field of fieldNames) {
                const binaryString = this.userRights[field] || "";
                const padded = binaryString.padEnd(this.adminTables.length, "0");

                for (let i = 0; i < this.adminTables.length; i++) {
                    this.rights[field][i] = padded[i] === "1";
                }
            }
        },
       ucf(str) {
            // Teilt den String an den Unterstrichen
            const arr = str.split("_");

            // Wandelt jedes Element des Arrays um, falls es mehr als ein Wort gibt
            const na = arr.map(
                (val) => val.charAt(0).toUpperCase() + val.slice(1).toLowerCase(),
            );

            // Setzt die W�rter mit einem Leerzeichen zusammen
            return na.join(" ");
        },

        saveRights() {
            const payload = {};

            for (const [key, values] of Object.entries(this.rights)) {
                payload[key] = values.map((v) => (v ? "1" : "0")).join("");
            }

            axios.post("/admin/user-rights/save", payload).then((response) => {
                alert("Rechte gespeichert!");
            });
        },
        togglerow(index) {
            const allEnabled = Object.keys(this.rights).every((field) => {
                return this.rights[field][index] === true;
            });

            const newValue = !allEnabled;

            for (const field in this.rights) {
                this.rights[field][index] = newValue;
            }
        }

    },
};
</script>
