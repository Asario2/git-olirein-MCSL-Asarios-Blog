<template>
<span v-if="Redit == '1'">
<a :href="'admin/tables/edit/'+ id+ '/' + table + ''" @click.stop><IconPencil class="sm-pencil"></IconPencil></a>
</span>&nbsp;&nbsp;
<span v-if="Rdelete == '1'">
<a :href="'admin/tables/delete/'+ id+ '/' + table + ''" @click.stop><IconTrash class="sm-pencil"></IconTrash></a>
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
    },
    mounted() {
        console.log("Redit:", this.Redit);
        console.log("Rdelete:", this.Rdelete);
        console.log("id:", this.id);
        console.log("table:", this.table);
    },
};

</script>
<style scoped>
.sm-pencil{
    width:20px;
    display:inline;
}
</style>
