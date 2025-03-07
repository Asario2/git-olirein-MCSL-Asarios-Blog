<template>
<span v-if="Redit == '1'">
<a :href="'admin/tables/edit/'+ id+ '/' + table + ''" @click.stop><IconPencil class="sm-pencil"></IconPencil></a>
</span>&nbsp;&nbsp;
<span v-if="Rdelete == '1'">
<form @submit.prevent="deletePost" style="display:inline">
    <button @click.stop type="submit" onclick="return confirm('Sind Sie sicher, dass Sie diesen Blogbeitrag löschen möchten?');"><IconTrash class="sm-pencil"></IconTrash></button>
</form>
</span>

</template>
<script>
import IconPencil from "@/Application/Components/Icons/Pencil.vue";
import IconTrash from "@/Application/Components/Icons/Trash.vue";
export default {
    name: "editbtns",
    components: {
        IconTrash,
        IconPencil,
    },
    props: {
        Redit: [String,Number],
        Rdelete: {String, default: 0,},
                id: { type: Number },
        table: { type: String },
        id: Number,
    },
    mounted() {
        // console.log("Redit:", this.Redit);
        // console.log("Rdelete:", this.Rdelete);
        // console.log("id:", this.id);
        // console.log("table:", this.table);
    },
    methods: {
    async deletePost() {
        try {
            console.log(`aad: admin/tables/delete/${this.table}/${this.id}`);
            // DELETE-Anfrage mit Parametern in der URL
            await axios.delete(`admin/tables/delete/${this.table}/${this.id}`, {
                params: {
                    edit: "blogposts.index",
                }
            });

           location.reload();   
            // Optional: Seite neu laden oder Liste aktualisieren
        } catch (error) {
            console.error("Fehler beim Löschen:", error);
        }
    },
},

};

</script>
<style scoped>
.sm-pencil{
    width:20px;
    display:inline;
}
</style>
