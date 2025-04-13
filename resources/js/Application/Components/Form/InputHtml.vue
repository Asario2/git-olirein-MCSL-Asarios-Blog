<template>
    <div>
        <!-- Verstecktes Eingabefeld für Form-Validation -->


        <!-- Menü -->
        <div
            class="mb-4 h-14 p-4 flex items-center bg-layout-sun-300 dark:bg-layout-night-300 rounded-lg"
            v-if="isFocused"
        >
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
                <b>---</b>
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
        <div class="mb-4 p-4 bg-layout-sun-0 dark:bg-layout-night-0 rounded-lg">

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
                        @close="closeModal"
                        @uploaded="insertImageIntoEditor"></ImageUploadModal>
                    </div>
    </div>
</template>

<script>
import tippy from 'tippy.js';
import 'tippy.js/dist/tippy.css';
import ImageUploadModal from '@/Application/Components/ImageUploadModal.vue';
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
    props:{

        // isModalOpen: {
        //     type: [Boolean,Number],
        //     default: false,
        // },
        imageId: {
            type: [String, Number],
        },
        modelValue: {
            type: [String, Number],
            default: "",
        },
        name: {
            type: String,
        },
        id: {
            type: [String, Number],
        },
        value: {
            type: [String, Number],
        },
        tablex: {
            type: String,
        },
        table_x: String,

        placeholder: String,

    },

    data() {
        return {
            isFocused: false,
            isModalOpen: false,
            nf2: null,


        };
    },

    mounted() {
        this.$nextTick(() => {
      tippy('[data-tippy-content]', {
        placement: 'right', // Beispiel für die Platzierung, kannst du nach Belieben anpassen
        animation: 'scale', // Optional: Füge eine Animation hinzu
      });
    });
        if (this.$refs.editor) {
    this.$refs.editor.innerHTML = decodeHtml(this.modelValue);
        }
        if (this.$refs.editor) {
        this.$refs.editor.innerHTML = this.modelValue || "";
        }

        this.$nextTick(() => {
        if (this.$refs.editor) {

        }
    });
        this.$nextTick(() => {
        this.setCursorAtEnd();
    });
        this.$nextTick(() => {
            if (this.$refs.editor) {
                this.$refs.editor.innerHTML = decodeHtml(this.modelValue)  ;
            } else {
                console.warn("editor ref not found");
            }
        });


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
  }
},
    methods: {
    updateValue() {
        const html = this.$refs.editor.innerHTML
            .replace('%5B', '[')
            .replace('%5D',  ']');;
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
        insertImage(url) {
            console.log("insertImage:", url);

            this.$refs.editor.focus();

            const img = document.createElement("img");
            img.src = url;
            img.alt = "";
            img.classList.add("inline-block", "max-w-full", "my-2");

            const selection = window.getSelection();
            if (!selection || selection.rangeCount === 0) return;

            const range = selection.getRangeAt(0);
            range.insertNode(img);

            range.setStartAfter(img);
            range.collapse(true);
            selection.removeAllRanges();
            selection.addRange(range);

            this.updateValue();
        },

        methods: {
  insertImageIntoContent(url) {
    const editor = this.$refs.editor;
    if (!editor) {
      console.warn('Editor mit ref="content" nicht gefunden.');
      return;
    }

    // Bild-Element erstellen
    const img = document.createElement("img");
    img.src = url;
    img.alt = "Bild";
    img.className = "my-2 rounded"; // optionales Styling

    // <br> nach dem Bild
    const br = document.createElement("br");

    // Aktuelle Cursor-Position holen
    const selection = window.getSelection();
    if (selection && selection.rangeCount > 0) {
      const range = selection.getRangeAt(0);
      range.deleteContents(); // Auswahl löschen, falls vorhanden
      range.insertNode(br);
      range.insertNode(img);

      // Cursor nach dem <br> setzen
      const newRange = document.createRange();
      newRange.setStartAfter(br);
      newRange.setEndAfter(br);
      selection.removeAllRanges();
      selection.addRange(newRange);
    } else {
      // Fallback: Bild ans Ende anhängen
      editor.appendChild(img);
      editor.appendChild(br);
    }

    // Editor wieder fokussieren
    this.$nextTick(() => editor.focus());

    // Falls du den Inhalt speichern willst:
    this.updateValue && this.updateValue();
  }
},
insertImageIntoEditor(imageUrl) {
  const editor = this.$refs.editor;
  if (!editor) {
    alert("NO EDITOR");
    return;
  }


  // Bild + <br> vorbereiten
  const img = document.createElement("img");
  img.src = imageUrl;
  img.alt = "Bild";


  const br = document.createElement("br");

  // Warte einen Tick, damit focus & selection korrekt sind
  this.$nextTick(() => {
    let selection = window.getSelection();
    if (!selection || selection.rangeCount === 0) {
      // Kein aktives Range – alles ans Ende
      editor.appendChild(img);
      editor.appendChild(br);
      return;
    }

    const range = selection.getRangeAt(0);
    if (!editor.contains(range.startContainer)) {
      // Cursor liegt NICHT im Editor → am Ende einfügen
      editor.appendChild(img);
      editor.appendChild(br);
      return;
    }

    // Auswahl löschen & Bild + <br> einfügen
    range.deleteContents();
    range.insertNode(br);
    range.insertNode(img);

    // Cursor nach <br> setzen
    const newRange = document.createRange();
    newRange.setStartAfter(br);
    newRange.setEndAfter(br);
    selection.removeAllRanges();
    selection.addRange(newRange);

    // Editor bleibt fokussiert
    this.updateValue && this.updateValue();
  });
},
        handleImageUpload(imageUrl) {
            console.log("Bild-URL:", imageUrl);
            this.nf2 = imageUrl;
            console.log("Bild-URL empfangen:", imageUrl);
            this.insertImageIntoEditor(this.nf2);
        },
        openModal_alt2() {
    console.log("Vor dem Setzen: " + this.isModalOpen);  // Überprüfe den aktuellen Wert


    // Warten bis das DOM vollständig aktualisiert ist
    this.$nextTick(() => {
        this.isModalOpen = !this.isModalOpen;
        const editor = this.$refs.editor;

      // Sicherstellen, dass editor überhaupt existiert und ein DOM-Element ist
      if (editor && typeof editor.focus === 'function') {
        editor.focus(); // Fokus setzen
      }

      const selection = window.getSelection();
      const range = document.createRange();

      // Wenn es eine bestehende Auswahl gibt, setze den Cursor an das Ende der Auswahl
      if (selection.rangeCount > 0) {
        const currentRange = selection.getRangeAt(0);
        range.setStart(currentRange.endContainer, currentRange.endOffset); // Cursor ans Ende setzen
        range.setEnd(currentRange.endContainer, currentRange.endOffset);
      } else {
        // Wenn keine Auswahl vorhanden ist, setze den Cursor ans Ende des Editors
        range.setStart(editor, editor.childNodes.length); // Ende des Editors
        range.setEnd(editor, editor.childNodes.length);
      }

      selection.removeAllRanges();
      selection.addRange(range);
    });

    console.log("Nach dem Setzen: " + this.isModalOpen); // Überprüfe den Wert nach $nextTick
},

//         openModal_alt() {



//     // Warten bis das DOM vollständig aktualisiert ist
//     this.$nextTick(() => {
//         console.log("Vor dem Setzen: " + this.isModalOpen);  // Überprüfe den aktuellen Wert
//         this.isModalOpen = !this.isModalOpen;
//         const editor = this.$refs.editor;
//         if (editor) {
//             // Verzögere den Fokus, um sicherzustellen, dass das Modal korrekt gerendert wurde
//             setTimeout(() => {
//                 editor.focus(); // Fokus setzen

//                 const selection = window.getSelection();
//                 const range = document.createRange();

//                 // Wenn es eine bestehende Auswahl gibt, setze den Cursor an das Ende der Auswahl
//                 if (selection.rangeCount > 0) {
//                     const currentRange = selection.getRangeAt(0);
//                     range.setStart(currentRange.endContainer, currentRange.endOffset); // Cursor ans Ende setzen
//                     range.setEnd(currentRange.endContainer, currentRange.endOffset);
//                 } else {
//                     // Wenn keine Auswahl vorhanden ist, setze den Cursor ans Ende des Editors
//                     range.setStart(editor, editor.childNodes.length); // Ende des Editors
//                     range.setEnd(editor, editor.childNodes.length);
//                 }

//                 selection.removeAllRanges();
//                 selection.addRange(range);
//             }, 0); // Verzögere den Fokus auf das Element, um sicherzustellen, dass der DOM richtig aktualisiert wird
//         }
//     });

//     console.log("Nach dem Setzen: " + this.isModalOpen); // Überprüfe den Wert nach $nextTick
//     console.log('isModalOpen gesetzt_Alt:', this.isModalOpen);
// },


        closeModal() {
            this.isModalOpen = false;
            let previewImage = null;
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
            console.log("toggleFormat:", format);
            console.log("Ausgewählter Text:", window.getSelection().toString());
  const selection = window.getSelection();
  if (!selection.rangeCount) return;

  const range = selection.getRangeAt(0);
  const wrapperTag = {
    bold: "strong",
    italic: "em",
    code: "code",
    h1: "h1",
    h2: "h2",
    h3: "h3",
    h4: "h4",
    h5: "h5",
    h6: "h6",
    hr: "hr",
    email: "a",
    link: "a",
  }[format];

  if (!wrapperTag) return;

  // === HR Sonderfall ===
  if (wrapperTag === "hr") {
    const hr = document.createElement("hr");
    range.deleteContents();
    range.insertNode(hr);
    const newRange = document.createRange();
    newRange.setStartAfter(hr);
    newRange.setEndAfter(hr);
    selection.removeAllRanges();
    selection.addRange(newRange);
    this.updateValue();
    return;
  }
  if (format === 'link') {
        const url = selection.toString();

        if (!url || !url.startsWith('http')) {
            alert('Bitte markiere eine gültige URL, z.B. https://example.com');
            return;
        }

        const name = prompt('Wie soll der Link heißen?', 'Linkname');

        if (name) {
            range.deleteContents();
            const anchor = document.createElement('a');
            anchor.href = url;
            anchor.target = '_blank';
            anchor.textContent = name;
            range.insertNode(anchor);
            selection.removeAllRanges(); // optional
        }

        return;
    }
  // === Link (E-Mail Erkennung & mailto:) ===
  if (wrapperTag === "a") {
  const selectedText = range.toString().trim();
  if (!selectedText) return;

  const emailRegex = /^([^\s@]+)(\[at\]|@)([^\s@]+\.[^\s@]+)$/i;
  const match = selectedText.match(emailRegex);

  if (match) {
    const realEmail = `${match[1]}@${match[3]}`; // z.B. parie@gmx.de
    const visibleEmailRaw = `${match[1]}[at]${match[3]}`; // sichtbarer Text
    const encodedVisibleText = visibleEmailRaw;
    //   .replace('[', '%5B')
    //   .replace(']', '%5D')
    //   .replace('@', '%40'); // falls du @ im sichtbaren Text willst

    const wrapper = document.createElement("a");
    wrapper.href = `mailto:${realEmail}`;
    wrapper.innerHTML = encodedVisibleText; // HTML enthält %5B statt [

    wrapper.setAttribute("target", "_blank");
    wrapper.setAttribute("rel", "noopener noreferrer");

    range.deleteContents();
    range.insertNode(wrapper);
    this.setCursorAfterFormattedText(wrapper);
    this.updateValue();
  }

  return;
}



  // === Block-Elemente (z. B. h1, h2 etc.) ===
  if (wrapperTag.startsWith("h")) {
    const block = this.getClosestBlockElement(range.startContainer);
    if (block) {
      if (block.tagName.toLowerCase() === wrapperTag) {
        const p = document.createElement("p");
        p.innerHTML = block.innerHTML;
        block.replaceWith(p);
        this.setCursorToElement(p);
      } else {
        const heading = document.createElement(wrapperTag);
        heading.innerHTML = block.innerHTML;
        block.replaceWith(heading);
        this.setCursorToElement(heading);
      }
      this.updateValue();
      return;
    }
  }

  // === Inline-Elemente (bold, italic, code) ===
  const selectedText = range.toString();
  if (selectedText.length > 0) {
    const ancestor = this.getAncestorTag(range, wrapperTag);
    if (ancestor) {
      const parent = ancestor.parentNode;
      while (ancestor.firstChild) {
        parent.insertBefore(ancestor.firstChild, ancestor);
      }
      parent.removeChild(ancestor);
    } else {
      const wrapper = document.createElement(wrapperTag);
      wrapper.textContent = selectedText;
      range.deleteContents();
      range.insertNode(wrapper);
      this.setCursorAfterFormattedText(wrapper);
    }

    this.updateValue();
  }

  this.$nextTick(() => this.$refs.editor.focus());
},



getClosestBlockElement(node) {
    while (node && node !== this.$refs.editor) {
        if (node.nodeType === Node.ELEMENT_NODE && ['DIV', 'P', 'SPAN', 'H1', 'H2', 'H3', 'H4', 'H5', 'H6'].includes(node.nodeName)) {
            return node;
        }
        node = node.parentNode;
    }
    return null;
},
setCursorAfterFormattedText(el) {
  if (!el || !el.parentNode) {
    console.warn("Kann Cursor nicht setzen – Element oder parentNode fehlt.");
    return;
  }

  const range = document.createRange();
  const selection = window.getSelection();

  // Stelle sicher, dass der Knoten ein Textknoten oder Element ist
  if (el.nodeType === Node.ELEMENT_NODE && el.nextSibling) {
    range.setStartAfter(el);
  } else {
    range.setStartAfter(el);
  }

  range.collapse(true);
  selection.removeAllRanges();
  selection.addRange(range);
},

        getAncestorTag(range, tagName) {
            let node = range.startContainer;
            while (node) {
                if (
                    node.nodeType === Node.ELEMENT_NODE &&
                    node.tagName.toLowerCase() === tagName
                ) {
                    return node;
                }
                node = node.parentNode;
            }
            return null;
        },
    },
};
</script>
<style>
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
</style>
