<template>
    <div>
      <img
        :src="captchaUrl"
        alt="CAPTCHA"
        width="200"
        height="70"
        @click="refreshCaptcha"
        style="cursor:pointer"
      >
      <input
        type="text"
        name="captcha"
        id="captcha"
        class="w-full input mt-[8px] bgo border border-layout-sun-1050 dark:border-layout-night-1050"
        maxlength="6"
        style="width:200px;"
        v-model="captchaInput"
        @input="emitValue"
        placeholder="Captcha"
      />
    </div>
  </template>

  <script>
  export default {
    name: "captcha",
    data() {
      return {
        captchaInput: '',
        timestamp: Date.now()
      }
    },
    computed: {
      captchaUrl() {
        return `/images/captcha.php?time=${this.timestamp}`
      }
    },
    methods: {
      emitValue() {
        this.$emit('update', this.captchaInput)
      },
      refreshCaptcha() {
        this.timestamp = Date.now() // neues Bild erzwingen
      },
      resetCaptcha() {
        this.captchaInput = ''      // Input leeren
        this.refreshCaptcha()       // Bild erneuern
        this.emitValue()            // Main-Komponente updaten
      }
    }
  };
  </script>


<style scoped>
.bgo{
    background-color: rgb(39 39 42);
}
</style>
