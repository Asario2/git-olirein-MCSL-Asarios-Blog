<template>
    <Layout>
        <MetaHeader title="Meine Shortpoems Übersicht" />
      <section class="max-w-3xl mx-auto mt-10 px-4">
        <h1 class="text-3xl font-bold mb-6 text-layout-title">Shortpoems</h1>

        <div
          v-for="(item, index) in items"
          :key="item.id || index"
          class="mb-4 border border-gray-300 dark:border-gray-600 rounded-lg"
        >
        <div :id="'st' + item.id"></div>
          <button
            @click="toggle(index)"
            class="w-full px-4 py-3 bg-gray-100 dark:bg-gray-800 hover:bg-gray-200 dark:hover:bg-gray-700 flex justify-between items-center transition"
          >
            <span class="text-lg font-medium text-gray-900 dark:text-white">{{ item.headline }}</span>
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
            {{ item.story }}&nbsp;&nbsp;
            <editbtns :id="item.id" table="shortpoems" /><br />
            <averageRating
              :postId="item.id"
              :av="parseFloat(ratings['original'][item.id]?.average) || 0"
              :tot="ratings['original'][item.id]?.total || 0"
            />
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
import averageRating from "@/Application/Components/Social/averageratings.vue";
import MetaHeader from "@/Application/Homepage/Shared/MetaHeader.vue";

export default {
  components: {
    Layout,
    editbtns,
    SocialButtons,
    averageRating,
    MetaHeader,
  },
  props: {
    items: {
      type: Array,
      required: false,
    },
    ratings: {
      type: [Array, Object],
      default: [],
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
            const hash = window.location.hash;
            if (hash && hash.startsWith("#st")) {
                const id = hash.replace("#st", "");
                const index = this.items.findIndex((item) => String(item.id) === id);

                if (index !== -1) {
                this.openIndex = index;

                // Warten, bis das Element sichtbar gerendert ist
                this.$nextTick(() => {
                    const el = document.getElementById(`st${id}`);
                    if (el) {
                    const y = el.getBoundingClientRect().top + window.pageYOffset - 115;
                    window.scrollTo({ top: y, behavior: 'smooth' });
                    }
                });
                }
            }
        }
};
</script>

