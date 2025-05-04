<template>
    <Layout>
      <section class="max-w-3xl mx-auto mt-10 px-4">
        <h1 class="text-3xl font-bold mb-6 text-layout-title">Wussten Sie schon...</h1>

        <div v-for="(item, index) in values" :key="item.id || index" class="mb-4 border border-gray-300 dark:border-gray-600 rounded-lg">
          <button
            @click="toggle(index)"
            class="w-full px-4 py-3 bg-gray-100 dark:bg-gray-800 hover:bg-gray-200 dark:hover:bg-gray-700 flex justify-between transition"
          >
            <span class="text-lg font-medium text-gray-900 dark:text-white">Wussten Sie schon, {{ item.headline }}</span>
            <svg
              :class="{ 'rotate-180': openIndex === index }"
              class="h-5 w-5 transform transition-transform text-gray-600 dark:text-gray-300"
              fill="none"
              viewBox="0 0 24 24"
              stroke="currentColor"
            >
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
            </svg>
          </button>
          <div
            v-if="openIndex === index"
            class="px-4 py-3 bg-white dark:bg-gray-900 text-gray-800 dark:text-gray-300 border-t border-gray-300 dark:border-gray-700"
          >
            {{ item.answer }}&nbsp;&nbsp;<editbtns :id="item.id" table="didyouknow"></editbtns><br />
            <SocialButtons :postId="item.id" />
          </div>
        </div>
      </section>
    </Layout>
  </template>

  <script>
  import Layout from '@/Application/Homepage/Shared/Layout.vue';
  import editbtns from '@/Application/Components/Form/editbtns.vue';
  import SocialButtons from "@/Application/Components/Social/socialButtons.vue";
  export default {
    components: { Layout, editbtns,SocialButtons,   },
    props: {
      values: {
        type: Array,
        required: false,
      },
    },
    data() {
      return {
        openIndex: null,
      };
    },
    methods: {
      toggle(index) {
        this.openIndex = this.openIndex === index ? null : index;
      },
    },
    mounted() {
      console.log("Empfangene Werte:", this.values);
    },
  };
  </script>
