<template>
    <div>
      <!-- Menü -->
      <div class="mb-4 h-14 p-4 flex items-center bg-layout-sun-300 dark:bg-layout-night-300 rounded-lg edit0R">
        <p class='border rounded label p-1'><nobr>{{getLabel(name)}}</nobr></p>

        <!-- Formatierungsbuttons -->
        <button type="button" @mousedown.prevent @click="toggleBold()" class="icon-btn" v-tippy aria-label="Fett">
          <b>B</b>
        </button>
        <tippy>Fett</tippy>

        <button type="button" @mousedown.prevent @click="toggleItalic()" class="icon-btn" v-tippy aria-label="Kursiv">
          <b><i>I</i></b>
        </button>
        <tippy>Kursiv</tippy>

        <template v-for="i in 6" :key="i">
          <button type="button" @mousedown.prevent @click="toggleHeading(`${i}`)" class="icon-btn" v-tippy :aria-label="'Überschrift ' + $i">
            <b>H{{ i }}</b>
          </button>
          <tippy>Überschrift {{ i }}</tippy>
        </template>

        <button type="button" @mousedown.prevent @click="openModal_alt2" class="icon-btn" v-tippy aria-label="Bildupload">
          <b><IconPictures stroke="white"/></b>
        </button>
        <tippy>Bildupload</tippy>

        <button type="button" @mousedown.prevent @click="toggleCode()" class="icon-btn" v-tippy aria-label="Code">
          <b><IconCode /></b>
        </button>
        <tippy>Code</tippy>

        <button type="button" @mousedown.prevent @click="AddHr" class="icon-btn" v-tippy  aria-label="Trennlinie    ">
          <b><nobr>---</nobr></b>
        </button>
        <tippy>Trennlinie</tippy>

        <button type="button" @mousedown.prevent @click="toggleFormat('email')" class="icon-btn" v-tippy  aria-label="Email">
          <b>@</b>
        </button>
        <tippy>Email Link</tippy>

        <button type="button" @mousedown.prevent @click="toggleFormat('link')" class="icon-btn" v-tippy aria-label="Hyperlink">
          <b><IconHyperLink/></b>
        </button>
        <tippy>Hyperlink</tippy>

        <button type="button" @mousedown.prevent @click="toggleList('ul')" class="icon-btn" v-tippy  aria-label="Ungeordnete Liste">
          <b><IconList/></b>
        </button>
        <tippy>Ungeordnete Liste</tippy>

        <button type="button" @mousedown.prevent @click="toggleList('ol')" class="icon-btn" v-tippy aria-label="Geordnete Liste">
          <b><IconOrdList/></b>
        </button>
        <tippy>Geordnete Liste</tippy>
      </div>

      <!-- Textfeld -->
      <div class="mb-4 p-4 bg-layout-sun-0 dark:bg-layout-night-0 rounded-lg edit0R editor">
        <div ref="editor" :id="name" contenteditable="true" class="editor rounded p-3 min-h-[150px] focus:outline-none" @input="updateValue" @focus="isFocused = true" @blur="isFocused = false" :placeholder="placeholder">
        </div>
        <input type="hidden" :id="name + '_alt'">

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
          @uploaded="insertImageIntoEditor"
        />
      </div>
    </div>
  </template>

  <script>
  import tippy from 'tippy.js';
  import 'tippy.js/dist/tippy.css';
  import ImageUploadModal from '@/Application/Components/ImageUploadModal.vue';
  import { GetSettings } from "@/helpers";
  import IconPictures from "@/Application/Components/Icons/IconPictures.vue";
  import IconList from "@/Application/Components/Icons/IconList.vue";
  import IconOrdList from "@/Application/Components/Icons/IconOrdList.vue";
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
      IconList,
      IconOrdList,
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
        tippy('[data-tippy-content]', { placement: 'right', animation: 'scale' });
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
          const range = this.savedRange ?? document.createRange();
          range.collapse(false);
          range.insertNode(br);
          range.insertNode(img);
          const newRange = document.createRange();
          newRange.setStartAfter(br);
          newRange.setEndAfter(br);
          selection.addRange(newRange);
          editor.focus();
          this.updateValue();
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

  toggleFormat(format) {
    const sel = window.getSelection();
    if (!sel.rangeCount) return;

    const range = sel.getRangeAt(0);
    const selectedText = sel.toString();
    if (!selectedText) return;

    const parent = this.getSelectedElementParent();

    // === Bold & Italic ===
    if (['bold', 'italic'].includes(format)) {
      const tag = format === 'bold' ? 'STRONG' : 'EM';
      if (parent && parent.nodeName === tag) {
        const textNode = document.createTextNode(parent.textContent);
        parent.parentNode.replaceChild(textNode, parent);
      } else {
        document.execCommand(format);
      }
      this.updateValue();
      return;
    }

    // === Code ===
    if (format === 'code') {
      if (parent && parent.nodeName === 'CODE') {
        const textNode = document.createTextNode(parent.textContent);
        parent.parentNode.replaceChild(textNode, parent);
      } else {
        const codeEl = document.createElement('code');
        codeEl.textContent = selectedText;
        range.deleteContents();
        range.insertNode(codeEl);
      }
      this.updateValue();
      return;
    }

    // === Headings h1–h6 ===
    const headings = ['h1', 'h2', 'h3', 'h4', 'h5', 'h6'];
    if (headings.includes(format)) {
      const currentTag = parent?.nodeName?.toLowerCase();
      if (currentTag === format) {
        // Rückgängig machen → p
        const newEl = document.createElement('p');
        newEl.textContent = parent.textContent;
        parent.replaceWith(newEl);
      } else {
        const newEl = document.createElement(format);
        newEl.textContent = selectedText;
        range.deleteContents();
        range.insertNode(newEl);
      }
      this.updateValue();
      return;
    }

    // === Horizontal Line ===
    if (format === 'hr') {
      const hr = document.createElement('hr');
      range.insertNode(hr);
      this.updateValue();
      return;
    }

    // === Image ===
    if (format === 'image') {
      this.openImageModal();
      return;
    }
  },

  getSelectedElementParent() {
    const sel = window.getSelection();
    if (!sel.rangeCount) return null;
    const node = sel.anchorNode;
    return node.nodeType === 3 ? node.parentNode : node;
  },

  updateValue() {
    this.$emit('input', this.$refs.editor.innerHTML);
  },


  wrapSelection(range, tagName) {
    const wrapper = document.createElement(tagName);
    wrapper.appendChild(range.extractContents());
    range.deleteContents();
    range.insertNode(wrapper);
  },

  unwrapTag(range, tagName) {
  const node = this.findAncestor(range.commonAncestorContainer, tagName);
  if (!node) return;

  this.unwrapNode(node);
},
unwrapNode(node) {
  const parent = node.parentNode;
  while (node.firstChild) {
    parent.insertBefore(node.firstChild, node);
  }
  parent.removeChild(node);
},

  isWithinTag(range, tagName) {
    return !!this.findAncestor(range.commonAncestorContainer, tagName);
  },

  findAncestorBlock(node) {
  while (node && !/^H[1-6]$|^P$|^DIV$/.test(node.tagName)) {
    node = node.parentNode;
  }
  return node;
},
findAncestor(node, tagName) {
  while (node) {
    if (node.nodeType === 1 && node.tagName === tagName.toUpperCase()) {
      return node;
    }
    node = node.parentNode;
  }
  return null;
},

  cleanupEmptyTags() {
    const editor = document.getElementById('content');
    editor.querySelectorAll('b:empty, i:empty, code:empty, h1:empty, h2:empty, h3:empty, h4:empty, h5:empty, h6:empty')
      .forEach(el => el.remove());

    // Entferne doppelte <br>
    editor.innerHTML = editor.innerHTML.replace(/(<br\s*\/?>\s*){2,}/g, '<br>');
  },

  toggleList(type = 'ul') {
  const selection = window.getSelection();
  if (!selection.rangeCount) return;
  const range = selection.getRangeAt(0);
  const content = range.extractContents();
  const list = document.createElement(type);
  const li = document.createElement('li');
  li.appendChild(content);
  list.appendChild(li);
  range.insertNode(list);
  this.updateValue();
},
toggleBold() {
    this.toggleFormat('b');
  },
  toggleItalic() {
    this.toggleFormat('i');
  },
  toggleCode() {
    this.toggleFormat('code');
  },
  toggleHeading(level = 1) {
    this.toggleFormat(`h${level}`);
  },

getBlockElement(node) {
  while (node && node.nodeType !== 1) {
    node = node.parentNode;
  }
  while (node && !/^H[1-6]$|^P$|^DIV$/.test(node.tagName)) {
    node = node.parentNode;
  }
  return node;
},
// Diese Hilfsfunktion sucht die echte TextNode im DOM anhand des Clones
findRealNodeInDOM(cloneNode, realParent) {
  const walker = document.createTreeWalker(realParent, NodeFilter.SHOW_TEXT);
  let node;
  while ((node = walker.nextNode())) {
    if (node.nodeValue === cloneNode.nodeValue) {
      return node;
    }
  }
  return null;
},
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
        if (!selectedText && !['email', 'link'].includes(format)) return;
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

  <style>
  .edit0R {
    max-width: 1177px;
    overflow: auto;
    height: auto;
  }
  .editor h1 {
    font-weight: 800;
    font-size: 2.25em;
    margin-top: 0;
    margin-bottom: 0.8888889em;
    line-height: 1.1111111;

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
  .editor h4{
    font-weight: 600;
    font-size: 1.25rem;
  }
  .editor h5{
    font-weight: 600;
    font-size: 1.1rem;
  }
  .editor h6{
    font-weight: 500;
    font-size: 1.05rem;
  }
  .icon-btn {
    padding: 0.4rem 0.6rem;
    border-radius: 9999px;
    transition: background 0.2s;
    cursor: pointer;
    margin-right: 0.25rem;
    background: transparent;
  }
  .icon-btn:hover {
    background-color: var(--tw-bg-opacity);
  }
  </style>
