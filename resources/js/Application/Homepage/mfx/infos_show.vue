<template>
    <layout header-title="Home" :header-url="$page.props.saas_url + '/'">
        <page-content>
            <template #content>
                <div>
                <page-title>
                    <template #title>
                        <span class="dark:text-layout-night-1050 text-layout-sun-1000 inline">Infos - <span v-html="cleanHtml(data.headline)"></span> <editbtns :id="data?.id" table="infos" /></span>
                </template>
                </page-title>



                    <div class="min-h-[350px] pl-0 bg-layout-sun-50 dark:bg-layout-night-0 lg:rounded-lg p-4 border border-layout-sun-1000 dark:border-layout-night-1050 flex gap-4 items-start">

        <!-- Bild links (feste Breite 150px) -->
        <div class="w-[150px] shrink-0">
        <img
            class="w-[150px] h-auto rounded"
            :src="'/images/_mfx/infos/img_big/big/' + data.img_big"
            :alt="data.headline"
            :title="data.headline"
        />
        </div>

        <!-- Text rechts -->
        <div class="flex-1 space-y-2">
        <div class="text-layout-sun-1000 dark:text-layout-night-1050 text-xl font-bold"></div>
        <div class="text-layout-sun-1000 dark:text-layout-night-1000" v-html="cleanHtml(data.message)"></div>
        </div>

    </div>
  </div>





            </template>
        </page-content>
    </layout>
</template>
<script>
import { defineComponent } from "vue";
import Layout from "@/Application/Homepage/Shared/mfx/Layout.vue";
import { marked } from 'marked';
import { selectionHelper, GetSettings, rumLaut } from "@/helpers";
import PageContent from "@/Application/Components/Content/PageContent.vue";
import PageTitle from "@/Application/Components/Content/PageTitle.vue";
import PageParagraph from "@/Application/Components/Content/PageParagraph.vue";
import emailview from "@/Application/Components/Form/email.vue";
import editbtns from "@/Application/Components/Form/editbtns.vue";

export default defineComponent({
    name: "Homepage_Home",

    components: {
        Layout,
        PageContent,
        PageTitle,
        PageParagraph,
        emailview,
        editbtns,
    },
    props: {
        news: [Array, Object],
        text: [Array, Object],
        data: [Array, Object],
    },

    data() {
        return {
            form: {
                name: '',
                email: '',
                subject: '',
                message: '',
                captcha: '',
                accepted: false
            },
            voteHtml: '',
            changelogText: '',
            todolist: [],
        }
    },

    async mounted() {
        try {
            this.loadVotez();
            this.loadChangelog();


    const resp = await fetch('https://api.github.com/repos/Asario2/MCSL-based-on-Starter-Eleven/issues');
    const data = await resp.json();
    console.log('GitHub Issues:', data);
    this.todolist = data;
  } catch (error) {
    console.error('Fehler beim Laden der Issues:', error);
    this.todolist = [];
  }

    },

    methods: {
        showtodo() {
        if (!Array.isArray(this.todolist) || this.todolist.length === 0) {
            return '<p>Keine offenen Issues gefunden.</p>';
        }

        let html = '';
        for (const issue of this.todolist) {
            html += `

                <a href="${issue.html_url}" target="_blank" class="text-blue-600 hover:underline">
                #${issue.number} - ${issue.title}
                </a>
                <span class="text-sm text-gray-500">(${issue.state})</span><br />
            `;
        }


        return html;
        },
        repimg(txt) {
            txt = txt.replace('<img src="https://www.asario.de/_images/mcsl_changelog.jpg" alt="MCSL Changelog">', '');
            txt = txt.replace(/green/g, 'orange');
            txt = txt.replace(/<img\s+src=/g, "<img style='display:inline' src=");
            txt = this.linkit(txt);

            return txt;
        },

        linkit(str) {
            return str.replace(/#(\d+)/g, "<a href='https://github.com/Asario2/MCSL-based-on-Starter-Eleven/issues/$1'>#$1</a>");
        },

        async loadVotez() {
            try {
                const response = await axios.get('/api/getVotez');
                this.votes = response.data;
                let text = '';

                for (const [key, value] of Object.entries(this.votes)) {
                    text += `<b>${value.user}</b> schreibt:<br />${value.details}<br /><a href='https://${value.url}' target='_blank'>${value.url}</a><br /><br />`;
                }

                this.voteHtml = text;
            } catch (err) {
                console.error('Fehler beim Laden der Votes:', err);
            }
        },

        async loadChangelog() {
            try {
                const response = await fetch('https://raw.githubusercontent.com/Asario2/MCSL-based-on-Starter-Eleven/main/CHANGELOG.md');
                const markdown = await response.text();
                this.changelogText = this.repimg(marked(markdown)); // ✅ Markdown in HTML umwandeln
            } catch (err) {
                console.error('Fehler beim Laden des Changelogs:', err);
                this.changelogText = 'Changelog konnte nicht geladen werden.';
            }
        },

        cleanHtml(html) {
            let result = this.decodeHtml(rumLaut(html));
            result = this.parseMessage(result);
            return result;
        },

        replacements() {
            return {
                'votez()': () => rumLaut(this.voteHtml),
                'changelog()': () => this.changelogText,
                'showtodo()': () => this.showtodo(),
            };
        },

        parseMessage(text) {
            return text.replace(/{{\s*(.*?)\s*}}/g, (match, key) => {
                const func = this.replacements()[key];
                return func ? func() : match;
            });
        },

        decodeHtml(html) {
            return html.replace(/%5B/g, '[').replace(/%5D/g, ']').replace("\n", "<br />");
        },

        async submitForm() {
            try {
                const response = await axios.post('/contact/send', this.form)
                alert('Nachricht erfolgreich gesendet!')
                this.resetForm()
            } catch (error) {
                alert('Fehler beim Senden der Nachricht.')
            }
        },

        resetForm() {
            this.form = {
                name: '',
                email: '',
                subject: '',
                message: '',
                captcha: '',
                accepted: false
            }
        }
    },
});
</script>
<style scoped>
.input {
  @apply w-full px-4 py-2 border rounded-md dark:bg-zinc-800 dark:text-white;
}

.btn {
  @apply px-6 py-2 bg-blue-600 text-white rounded-md hover:bg-blue-700 disabled:opacity-50;
}
</style>
