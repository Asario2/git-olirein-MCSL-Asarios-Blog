<template>
    <div
      class="relative overflow-hidden rounded pr-4"
      :style="{ width: width + 'px', height: height + 'px' }"
    >
      <img
        :src="src"
        :alt="alt"
        :title="title"

        class="w-full h-full object-cover transition-transform duration-300 ease-in-out hover:scale-110"
      />
    </div>
  </template>

  <script>
  export default {
    name: "ZoomImage",
    props: {
      src: String,
      alt: String,
      title: String,
      width: {
        type: [String, Number],
        default: 300,
      },
      height: {
        type: [String, Number],
        default: 300,
      },
    },
  };
  </script>

<style scoped>
/* .w-full{
    width:300px;

} */
</style>
