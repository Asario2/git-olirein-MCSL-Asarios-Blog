<template>
    <div
      class="relative overflow-hidden rounded"
      :style="{ width: width + 'px', height: height + 'px' }"
    >
      <img
        :src="src"
        :alt="alt"
        :title="title"

        class="w-x object-cover transition-transform duration-300 ease-in-out hover:scale-110"
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

<style>
.w-x{
    min-width:300px !important;
    max-width:300px !important;
    width:300px !important;
    min-height:300px !important;
    max-height:300px !important;
    height:300px !important;

    margin:0px !important;
    padding:0px !important;
}

</style>
