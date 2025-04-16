<template>
    <layout title="Admin-Dashboard">
        <template #header>
            <breadcrumb
                :application-name="$page.props.applications.app_admin_name"
                :start-page="true"
            ></breadcrumb>
        </template>

        <div
            class="bg-layout-sun-0 dark:bg-layout-night-0 grid grid-cols-1 md:grid-cols-2 gap-2 lg:gap-3 p-6 lg:p-4"
        >
            <!-- Blogartikel -->
            <navigation-card
                class="navigation_card"
                title="Blogartikel"
                :routeName="route('admin.tables.show','blogs')"
                linkName="Liste der Blogartikel"
                :routeName2="route('admin.blog.create', table)"
                linkName2="Neuer Blogartikel"
                :withIcon="true"
                icon="IconBook"
            >
                <template #description>
                    Hier findest du eine Liste aller Blogartikel.
                </template>
            </navigation-card>
            <!-- Bilder -->
            <navigation-card
                class="navigation_card"
                title="Bilder"
                :routeName="route('admin.tables.show','images')"
                linkName="Überblick Bilder"
                :routeName2="route('admin.tables.store', 'images')"
                linkName2="Neues Bild"
                :withIcon="true"
                icon="IconPictures"
            >
                <template #description>
                    Hier findest du eine Liste aller Bilder.
                </template>
            </navigation-card>
            <!-- Tabellen Overview -->
            <navigation-card
                class="navigation_card"
                title="Tabellen"
                :routeName="route('admin.tables.index', table)"
                linkName="Inhalte Verwalten"
                target="_self"
                :withIcon="true"
                icon="IconDB"
            >
                <template #description>
                    Hier kannst du alle Datenbankinhalte bearbeiten
                </template>
            </navigation-card>
            <!-- laravel.log -->
            <navigation-card
                class="navigation_card"
                title="Log"
                :routeName="route('admin.laravel_log')"
                linkName="Zum Laravel-Log"
                target="_blank"
                :withIcon="true"
                icon="IconLogs"
            >
                <!-- DB updaten -->
                <template #description> Logs anzeigen    </template>
            </navigation-card>
            <navigation-card
                class="navigation_card"
                title="Rechte"
                :routeName="route('admin.users_rights')"
                linkName="Benutzerberechtigungen"
                target="_blank"
                :withIcon="true"
                icon="IconRight"
            >
                <!-- DB updaten -->
                <template #description> Benutzer Rechte </template>
            </navigation-card>
        </div>
    </layout>
</template>

<script>
import { defineComponent } from "vue";

import Layout from "@/Application/Admin/Shared/Layout.vue";
import Breadcrumb from "@/Application/Components/Content/Breadcrumb.vue";

import NavigationCard from "@/Application/Components/NavigationCard.vue";

export default defineComponent({
    name: "Admin_Dashboard",

    components: {
        Layout,
        Breadcrumb,
        NavigationCard,
    },
});
</script>
