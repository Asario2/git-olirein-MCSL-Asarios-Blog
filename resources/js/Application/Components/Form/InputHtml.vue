<template>
    <div>
        <!-- Verstecktes Eingabefeld für Form-Validation -->


        <!-- Menü -->
        <div
            class="mb-4 h-14 p-4 flex items-center bg-layout-sun-300 dark:bg-layout-night-300 rounded-lg edit0R"

        ><p class='border rounded label p-1'><nobr>{{getLabel(name)}}</nobr></p>
            <!-- Bold Button -->

            <button type="button" @mousedown.prevent @click="toggleFormat('bold')" class="px-2.5 py-1 rounded-full hover:bg-layout-sun-0 hover:dark:bg-layout-night-0 cursor-pointer"
            v-tippy>
                <b>B</b>

            </button>
            <tippy>
            Fett
            </tippy>
            <!-- Italic Button -->
            <button type="button"
                @mousedown.prevent
                @click="toggleFormat('italic')"
                 class="px-2.5 py-1 rounded-full hover:bg-layout-sun-0 hover:dark:bg-layout-night-0 cursor-pointer"
                 v-tippy>
                <b><i>I</i></b>

            </button>
            <tippy>Kursiv</tippy>

            <!-- Heading Buttons H1 - H6 -->
            <template v-for="i in 6" :key="i">
            <button
            type="button"
            @mousedown.prevent
            @click="toggleFormat(`h${i}`)"
            class="px-2.5 py-1 rounded-full hover:bg-layout-sun-0 hover:dark:bg-layout-night-0 cursor-pointer"
            v-tippy
            >
            <b>H{{ i }}</b>
            </button>
            <tippy>Überschrift {{ i }}</tippy>
            </template>
            <!-- <ImageUploadModal
                    :isOpen="isModalOpen"
                    :tablex="this.table_x"
                    :column="name"
                    :path="tablex"
                    :ref="name"
                    :value="imageId"
                    :image="value"
                    :namee="value"
                    :namee2="name"
                    :Message="true"
                    @close="closeModal"
                    @uploaded="insertImageIntoEditor"

                /> -->
<!-- @update:fileName="handleFileNameUpdate"
                    @imageUploaded="handleImageUpload"
                    @insertImage="handleImageUpload"-->
            <!-- Image Button -->
            <button type="button" @mousedown.prevent
            @click="openModal_alt2" class="px-2.5 py-1 rounded-full hover:bg-layout-sun-0 hover:dark:bg-layout-night-0 cursor-pointer"
           v-tippy>
                <b><IconPictures stroke="white"/></b>
            </button>
            <tippy>Bildupload</tippy>
            <!-- Code Button -->
            <button type="button" @mousedown.prevent
                @click="toggleFormat('code')"
                class="px-2.5 py-1 rounded-full hover:bg-layout-sun-0 hover:dark:bg-layout-night-0 cursor-pointer"
                v-tippy>
                <b><IconCode /></b>
            </button>
            <tippy>Code</tippy>
            <!-- HR Button -->
            <button type="button" @mousedown.prevent
                @click="AddHr"
                class="px-2.5 py-1 rounded-full hover:bg-layout-sun-0 hover:dark:bg-layout-night-0 cursor-pointer"
                v-tippy>
                <b><nobr>---</nobr></b>
            </button>
            <tippy>Trennlinie</tippy>
            <!-- HR Button -->
            <button type="button" @mousedown.prevent
                @click="toggleFormat('email')"
                class="px-2.5 py-1 rounded-full hover:bg-layout-sun-0 hover:dark:bg-layout-night-0 cursor-pointer"
            v-tippy>
                <b>@</b>
            </button>
            <tippy>Email Link</tippy>
            <button type="button" @mousedown.prevent
                @click="toggleFormat('link')"
                class="px-2.5 py-1 rounded-full hover:bg-layout-sun-0 hover:dark:bg-layout-night-0 cursor-pointer"
            v-tippy>
                <b><IconHyperLink/></b>
            </button>
            <tippy>Hyperlink</tippy>
        </div>

        <!-- Textfeld -->
        <div class="mb-4 p-4 bg-layout-sun-0 dark:bg-layout-night-0 rounded-lg edit0R">

            <div
    ref="editor"
    :id="name"
    contenteditable="true"
    class="editor rounded p-3 min-h-[150px] focus:outline-none"
    @input="updateValue"
    @focus="isFocused = true"
    @blur="isFocused = false"
    :placeholder="placeholder"

  > </div>   <input type="hidden" :id="name + '_alt'">

            <ImageUploadModal
                         v-show="isModalOpen"
                        :tablex="table_x"
                        :column="name"
                        :path="tablex"
                        :ref="name"
                        :value="imageId"
                        :image="value"
                        :namee="value"
                        :namee2="name"
                        :Message="true"
                        @insertImage="insertImage"
                        @close="closeModal"
                        @uploaded="insertImageIntoEditor"></ImageUploadModal>
                    </div>
    </div>
</template>

<script>
import tippy from 'tippy.js';
import 'tippy.js/dist/tippy.css';
import ImageUploadModal from '@/Application/Components/ImageUploadModal.vue';
import { GetSettings } from "@/helpers";
import IconPictures from "@/Application/Components/Icons/IconPictures.vue";
import IconCode from "@/Application/Components/Icons/IconCode.vue";
import IconHyperLink from "@/Application/Components/Icons/IconHyperLink.vue";
import { Tippy } from 'tippy.vue';

export default {
  name: "Editor",
  components: {
    IconPictures,
    IconCode,
    IconHyperLink,
    ImageUploadModal,
  },
  props: {
    imageId: [String, Number],
    modelValue: [String, Number],
    name: String,
    id: [String, Number],
    value: [String, Number],
    tablex: String,
    table_x: String,
    placeholder: String,
  },
  data() {
    return {
      isFocused: false,
      isModalOpen: false,
      nf2: null,
      settings: {},
      savedRange: null,
    };
  },
  async mounted() {
    this.settings = await GetSettings();
    this.$nextTick(() => {
      tippy('[data-tippy-content]', {
        placement: 'right',
        animation: 'scale',
      });
    });
    if (this.$refs.editor) {
      this.$refs.editor.innerHTML = decodeHtml(this.modelValue) || "";
    }
    this.$nextTick(() => this.setCursorAtEnd());
  },
  computed: {
    content: {
      get() {
        return this.modelValue;
      },
      set(value) {
        this.$emit("update:modelValue", value);
      },
    },
  },
  watch: {
    modelValue(newVal) {
      if (this.$refs.editor && this.$refs.editor.innerHTML !== newVal) {
        this.$refs.editor.innerHTML = newVal;
      }
    },
  },
  methods: {
    getLabel(name) {
      return this.settings?.exl?.[name] ?? name;
    },
    updateValue() {
      const html = this.$refs.editor.innerHTML.replace('%5B', '[').replace('%5D', ']');
      this.$emit("update:modelValue", html);
      document.getElementById(this.name + "_alt").value = html;
    },
    setCursorAtEnd() {
      const editor = this.$refs.editor;
      const selection = window.getSelection();
      const range = document.createRange();
      if (editor) {
        const lastChild = editor.lastChild;
        if (lastChild) {
          range.setStart(lastChild, lastChild.length);
          range.setEnd(lastChild, lastChild.length);
          selection.removeAllRanges();
          selection.addRange(range);
        }
      }
    },
    insertImageIntoEditor(imageUrl) {
  const editor = this.$refs.editor;
  if (!editor) return alert("NO EDITOR");

  const img = document.createElement("img");
  img.src = imageUrl;
  img.alt = "Bild";

  const br = document.createElement("br");

  this.$nextTick(() => {
    const selection = window.getSelection();
    selection.removeAllRanges();

    // Verwende gespeicherte Cursorposition
    const range = this.savedRange ?? document.createRange();
    range.collapse(false); // sicherheitshalber

    // Einfügen
    range.insertNode(br);
    range.insertNode(img);

    // Cursor hinter das <br> setzen
    const newRange = document.createRange();
    newRange.setStartAfter(br);
    newRange.setEndAfter(br);
    selection.addRange(newRange);

    editor.focus();
    this.updateValue();

    // Range zurücksetzen
    this.savedRange = null;
  });
},
    handleImageUpload(imageUrl) {
      this.nf2 = imageUrl;
      this.insertImageIntoEditor(this.nf2);
    },
    insertImage(imageUrl) {
      this.insertImageIntoEditor(imageUrl);
    },
    // openModal_alt2() {
    //   this.$nextTick(() => {
    //     this.isModalOpen = !this.isModalOpen;
    //     const editor = this.$refs.editor;
    //     if (editor && typeof editor.focus === 'function') editor.focus();

    //     const selection = window.getSelection();
    //     const range = document.createRange();

    //     if (selection.rangeCount > 0) {
    //       const currentRange = selection.getRangeAt(0);
    //       range.setStart(currentRange.endContainer, currentRange.endOffset);
    //       range.setEnd(currentRange.endContainer, currentRange.endOffset);
    //     } else {
    //       range.setStart(editor, editor.childNodes.length);
    //       range.setEnd(editor, editor.childNodes.length);
    //     }

    //     selection.removeAllRanges();
    //     selection.addRange(range);
    //   });
    // },
    openModal_alt2() {
  const editor = this.$refs.editor;
  if (editor && typeof editor.focus === 'function') editor.focus();

  const selection = window.getSelection();
  if (selection.rangeCount > 0) {
    this.savedRange = selection.getRangeAt(0).cloneRange();
  }

  this.isModalOpen = true;
},
    closeModal() {
      this.isModalOpen = false;
      this.previewImage = null;
    },
    handleFileNameUpdate(fileName) {
      this.fileName = fileName;
    },
    AddHr() {
      const selection = window.getSelection();
      if (!selection.rangeCount) return;
      const range = selection.getRangeAt(0);
      const hr = document.createElement("hr");
      range.deleteContents();
      range.insertNode(hr);
      const newRange = document.createRange();
      newRange.setStartAfter(hr);
      newRange.setEndAfter(hr);
      selection.removeAllRanges();
      selection.addRange(newRange);
      this.updateValue();
    },
    toggleFormat(format) {
      const selection = window.getSelection();
      if (!selection.rangeCount) return;

      const range = selection.getRangeAt(0);
      const selectedText = range.toString();

      if (!selectedText) return;

      let element;

      if (["h1", "h2", "h3", "h4", "h5", "h6"].includes(format)) {
        element = document.createElement(format);
      } else if (format === "bold") {
        element = document.createElement("strong");
      } else if (format === "italic") {
        element = document.createElement("em");
      } else if (format === "code") {
        element = document.createElement("code");
      } else if (format === "email") {
        const email = prompt("E-Mail-Adresse eingeben:", "beispiel@example.com");
        if (!email) return;
        element = document.createElement("a");
        element.href = `mailto:${email}`;
        element.textContent = email;
        range.deleteContents();
        range.insertNode(element);
        this.updateValue();
        return;
      } else if (format === "link") {
        const url = prompt("URL eingeben:", "https://");
        const text = selectedText || prompt("Anzeigetext:", url);
        if (!url || !text) return;
        element = document.createElement("a");
        element.href = url;
        element.textContent = text;
        element.target = "_blank";
        element.rel = "noopener noreferrer";
        range.deleteContents();
        range.insertNode(element);
        this.updateValue();
        return;
      }

      element.textContent = selectedText;
      range.deleteContents();
      range.insertNode(element);
      this.updateValue();
    },
  },
};
</script>

<style scoped>
.edit0R{
    max-width:1177px;
    overflow:auto;
    height:auto;
}
.editor h1 {
  font-size: 2.25rem; /* entspricht text-4xl */
  font-weight: bold;
  margin-top: 1rem;
  margin-bottom: 0.5rem;
}
.editor h2 {
  font-size: 1.875rem;
  font-weight: 600;
  margin-top: 1rem;
  margin-bottom: 0.5rem;
}
.editor h3 {
  font-size: 1.5rem;
  font-weight: 600;
  margin-top: 0.75rem;
  margin-bottom: 0.25rem;
}
.editor h4 {
  font-size: 1.25rem; /* entspricht text-4xl */
  font-weight: bold;
  margin-top: 0.7rem;
  margin-bottom: 0.22rem;
}
.editor h5 {
  font-size: 1.15rem;
  font-weight: 600;
  margin-top: 0.6rem;
  margin-bottom: 0.2rem;
}
.editor h6 {
  font-size: 1.0rem;
  font-weight: 600;
  margin-top: 0.4rem;
  margin-bottom: 0.15rem;
}
.editor a {
  color: #2563eb; /* z. B. Tailwind blue-600 */
  text-decoration: underline;
}
.label{
    border-radius:4px;
    color:#999;
    border-color:#999;
}
</style>
