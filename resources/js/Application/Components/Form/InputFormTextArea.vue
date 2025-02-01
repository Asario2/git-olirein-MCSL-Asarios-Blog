<template>
    <textarea
      :id="id"
      :value="value"
      :name="name"
      :rows="rows"
      class="block p-2.5 w-full text-sm rounded-lg border
             border-layout-sun-300 text-layout-sun-900 bg-layout-sun-50
             placeholder-layout-sun-400 focus:ring-primary-sun-500 focus:border-primary-sun-500
             dark:border-layout-night-300 dark:text-layout-night-900 dark:bg-layout-night-50
             dark:placeholder-layout-night-400 dark:focus:ring-primary-night-500 dark:focus:border-primary-night-500"
      :placeholder="placeholder"
    ></textarea>
  </template>

  <script>
  export default {
    name: 'InputFormTextArea',
    props: {
      name: {
        type: String,
        required: true,
      },
      rows: {
        type: Number,
        default: 4,
      },
      placeholder: {
        type: String,
        default: 'Enter your text here...',
      },
      id:{
        type: [String, Number],
        default: 0,

      },
      value: {
        type: String,
        default: '',
      },
    },
  };
  </script>
