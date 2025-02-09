<template>
    <div>
        <!-- Menü -->
        <div
            class="mb-4 h-14 p-4 flex items-center bg-layout-sun-300 dark:bg-layout-night-300 rounded-lg"
            v-if="isFocused"
        >
            <div class="flex items-center justify-start gap-x-2">
                <button
                    @click="toggleFormat('bold')"
                    class="px-2.5 py-1 rounded-full hover:bg-layout-sun-0 hover:dark:bg-layout-night-0 cursor-pointer"
                    v-tippy
                >
                    <b>fett</b>
                </button>
                <tippy placement="top"
                    >Der markierte Text wird <b>fett</b></tippy
                >

                <button
                    @click="toggleFormat('italic')"
                    class="px-2.5 py-1 rounded-full hover:bg-layout-sun-0 hover:dark:bg-layout-night-0 cursor-pointer"
                    v-tippy
                >
                    <b><i>kursiv</i></b>
                </button>
                <tippy placement="top"
                    >Der markierte Text wird <b>kursiv</b></tippy
                >

                <button
                    v-for="i in 6"
                    :key="i"
                    @click="toggleFormat(`h${i}`)"
                    class="px-2.5 py-1 rounded-full hover:bg-layout-sun-0 hover:dark:bg-layout-night-0 cursor-pointer"
                >
                    <b>H{{ i }}</b>
                </button>
            </div>
        </div>

        <!-- Text -->
        <div class="mb-4 p-4 bg-layout-sun-0 dark:bg-layout-night-0 rounded-lg">
            <div
                ref="editor"
                contenteditable="true"
                @input="updateValue"
                @focus="isFocused = true"
                class="max-w-none min-h-full prose md:prose-md dark:prose-invert prose-headings:font-title focus:outline-none prose-pre:bg-layout-sun-100 prose-pre:text-layout-sun-800 dark:prose-pre:text-layout-night-100 dark:prose-pre:bg-layout-night-800"
            ></div>
        </div>
    </div>
</template>

<script>
export default {
    name: "Contents_Form_InputHTML",

    props: {
        modelValue: {
            type: String,
            default: "",
        },
    },

    data() {
        return {
            isFocused: false,
        };
    },

    mounted() {
        this.$refs.editor.innerHTML = this.modelValue;
    },

    methods: {
        toggleFormat(format) {
            const selection = window.getSelection();
            if (!selection.rangeCount) return;

            const range = selection.getRangeAt(0);
            const selectedText = range.toString();

            if (!selectedText) return;

            let formattedText;
            switch (format) {
                case "bold":
                    formattedText = `<strong>${selectedText}</strong>`;
                    break;
                case "italic":
                    formattedText = `<em>${selectedText}</em>`;
                    break;
                case "h1":
                case "h2":
                case "h3":
                case "h4":
                case "h5":
                case "h6":
                    formattedText = `<${format}>${selectedText}</${format}>`;
                    break;
            }

            range.deleteContents();
            range.insertNode(
                new DOMParser().parseFromString(formattedText, "text/html").body
                    .firstChild,
            );
            this.updateValue();
        },

        updateValue() {
            this.$emit("update:modelValue", this.$refs.editor.innerHTML);
        },
    },
};
</script>
