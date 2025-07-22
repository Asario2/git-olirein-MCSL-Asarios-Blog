<template>
    <Layout>
        <div class="prose prose-layout dark:prose-invert max-w-none">
            <div v-html="privacy" />
        </div>
    </Layout>
  </template>

  <script>
  import Layout from "@/Application/Homepage/Shared/mfx/Layout.vue";
  export default {
    components: {
    Layout,
    },
    props: {
      privacy: String,
    },
    mounted() {
        this.scrollToHashAnchor();
        window.addEventListener("hashchange", this.scrollToHashAnchor);
        },
        beforeUnmount() {
        window.removeEventListener("hashchange", this.scrollToHashAnchor);
        },
  methods: {
    scrollToHashAnchor() {
    const hash = window.location.hash;
    if (hash && hash.startsWith("#")) {
      setTimeout(() => {
        const el = document.getElementById(hash.substring(1));
        if (el) {
          const y = el.getBoundingClientRect().top + window.pageYOffset - 134;
          window.scrollTo({ top: y, behavior: "smooth" });
        }
      }, 50); // etwas Delay, bis DOM fertig gerendert ist
    }
  }
}
};
  </script>
