<template>
    <Layout>
        <template #header>
            <breadcrumb
                :application-name="$page.props.applications.app_admin_name"
                :start-page="false"
                current="Benutzerrechte"
            ></breadcrumb>
        </template>
    <RightsTable
        :adminTables="adminTables"
        :userRights="userRights"
    />
    </Layout>
</template>

<script>
import RightsTable from "@/Application/Admin/UserRights.vue";
import Layout from "@/Application/Admin/Shared/Layout.vue";
import Breadcrumb from "@/Application/Components/Content/Breadcrumb.vue";
export default {
    name: "UserRightsPage",

    components: {
        RightsTable,
        Layout,
        Breadcrumb,
    },

    props: {
        adminTables: {
            type: Array,
            required: true,
        },
        userRights: {
            type: Object,
            required: true,
        },
    },
};
</script>
