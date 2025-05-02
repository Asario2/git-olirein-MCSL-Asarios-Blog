<template>
    <div
        class="p-5 mx-auto sm:p-2 md:p-10 bg-layout-sun-0 text-layout-sun-800 dark:bg-layout-night-0 dark:text-layout-night-800"
    >
    <div class="relative w-full flex flex-col max-w-6xl mx-auto overflow-hidden rounded">
    <!-- Blog-Bild -->
    <div class="relative" style="z-index:0;">
        <img
            :src="`/images/blogs/${blog.url}`"
            :alt="blog.name"
            style='min-width:480px;min-height:360px;width:100%'
            class="object-cover w-full  rounded lg:col-span-7 object-cover rounded bg-layout-sun-500 dark:bg-layout-night-500 coverclass"
        />

        <!-- AI-Button in der rechten unteren Ecke des Bildes -->
        <div v-if="blog.madewithai" class="ai-overlay">
            <AiButton :big="true" :bigger="true"></AiButton>
        </div>
    </div>

    <!-- **Neuer Container für den H1-Text unterhalb des Bildes** -->
<div
                class="p-2 pb-12 m-2 mx-auto w-full mt-0 space-y-6 lg:max-w-5xl sm:px-10 sm:mx-12 lg:rounded-md bg-layout-sun-100 dark:bg-layout-night-100 prose dark:prose-invert md:prose-lg lg:prose-xl"
            >

                <div class="space-y-2" style="z-index:100 !important;">
                    <div
                        v-if="blog.blog_category.name"
                        class="flex justify-end items-start z-20"
                    >
                        <div
                            class="title2 text-sm min-w-fit min-h-fit bg-primary-sun-500 text-primary-sun-800 dark:bg-primary-night-500 dark:text-primary-night-800 font-semibold px-2.5 py-0.5 rounded-lg whitespace-nowrap"
                        >
                            {{ blog.blog_category.name }}
                        </div>
                    </div>
                    <div class="bg-layout-sun-100 w-full dark:bg-layout-night-100 p-4 title" style="min-width:300px;">
                    <h1 class="pb-12 block font-title w-full">
                            {{ blog.title }}
                            <editbtns :id="blog.id" table="blogs"></editbtns>
                        </h1>
                    </div>


                    <div class="flex items-end justify-between">
                        <div
                            class="text-layout-sun-600 dark:text-layout-night-600"
                        >
                            <display-date
                                :value="blog.blog_date"
                                :time-on="false"
                            />
                            von
                            <a href="#author_info" class="hover:underline">{{
                                blog.blog_author.name
                            }}</a>
                        </div>
                        <div>
                            <display-number
                                :value="blog.reading_time"
                                :after-digits="0"
                                value-unit="Minuten Lesezeit"
                                value-single-unit="Minute Lesezeit"
                                value-unit-class=""
                            ></display-number>
                        </div>
                    </div>
                    <div
                        class="my-4 rounded-lg p-4 border bg-layout-sun-0 dark:bg-layout-night-0 border-primary-500 dark:border-primary-night-500"
                        v-if="blog.audio_on"
                    >
                        <div
                            class="text-xs text-layout-600 dark:text-layout-400"
                        >
                            <icon-speaker-wave
                                class="inline-block h-8 w-8 mr-2 text-sky-500 dark:text-sky-500"
                            ></icon-speaker-wave>
                            Dieser Artikel liegt auch als Audio-Datei vor.
                            <span v-if="blog.audio_duration > 0">
                                Die Audio-Datei hat eine Länge von
                                {{ blog.audio_duration }} Sekunden.
                            </span>
                        </div>
                        <input
                            class="w-full h-1 bg-primary-sun-200 dark:bg-primary-night-200 cursor-pointer appearance-none"
                            type="range"
                            min="0"
                            max="100"
                            step="1"
                            v-model="seekValue"
                            @change="onSeek"
                        />
                        <audio
                            :src="'/audio/' + blog.audio_url"
                            ref="audioPlayer"
                            @timeupdate="onPlaying"
                        >
                            Your browser does not support the
                            <code>audio</code> element.
                        </audio>
                        <div class="my-2">
                            <display-number
                                :value="currentTime"
                                :after-digits="0"
                                value-unit="Sekunden"
                                value-single-unit="Sekunde"
                            ></display-number>
                        </div>
                        <div class="flex items-center justify-start">
                            <button @click="play">
                                <icon-play
                                    class="h-12 w-12 mr-2 text-sky-500 dark:text-sky-500 bg-layout-sun-100 dark:bg-layout-night-100 rounded-full p-2"
                                ></icon-play>
                            </button>
                            <button @click="pause">
                                <icon-pause
                                    class="h-12 w-12 mr-2 text-sky-500 dark:text-sky-500 bg-layout-sun-100 dark:bg-layout-night-100 rounded-full p-2"
                                ></icon-pause>
                            </button>
                            <button @click="stop">
                                <icon-stop
                                    class="h-12 w-12 mr-2 text-sky-500 dark:text-sky-500 bg-layout-sun-100 dark:bg-layout-night-100 rounded-full p-2"
                                ></icon-stop>
                            </button>
                        </div>
                    </div>
                </div>
                <div class="text-layout-sun-800 dark:text-layout-night-800">
                    <div v-if="blog.markdown_on">
                        <markdown :markdown="decodedContent"></markdown>
                    </div>

                    <div v-else v-html="decodedContent"></div>

                    <h2 id="author_info">
                        Informationen zu {{ blog.blog_author.name }}
                    </h2>
                    <div
                        class="max-w-none min-h-full prose md:prose-md dark:prose-invert prose-headings:font-title prose-pre:bg-layout-sun-100 prose-pre:text-layout-sun-800 dark:prose-pre:bg-layout-night-100 dark:prose-pre:text-layout-night-800"
                        v-html="blog.blog_author.info"
                    ></div>
                </div>
            </div>
        </div>
</div>
</template>
<script>
import IconPause from "@/Application/Components/Icons/Pause.vue";
import IconPlay from "@/Application/Components/Icons/Play.vue";
import IconSpeakerWave from "@/Application/Components/Icons/SpeakerWave.vue";
import IconStop from "@/Application/Components/Icons/Stop.vue";
import AiButton from "@/Application/Components/Content/AiButton.vue";
import DisplayDate from "@/Application/Components/Content/DisplayDate.vue";
import DisplayNumber from "@/Application/Components/Content/DisplayNumber.vue";
import editbtns from "@/Application/Components/Form/editbtns.vue";
import Markdown from "@/Application/Components/Content/Markdown.vue";

export default {
    name: "Shared_BlogShow",
    //
    components: {
        AiButton,
        IconPause,
        IconPlay,
        IconSpeakerWave,
        IconStop,
        DisplayDate,
        DisplayNumber,
        Markdown,
        editbtns,
    },

    props: {
        blog: {
            type: Object,
        },
        blogarticle: {
            type: String,
        },
    },

    data() {
        return {
            currentTime: 0,
            seekValue: 0,
        };
    },
    computed: {
        decodedContent() {
            return this.decodeHtml(this.blog.content);
        }
    },
    methods: {
        decodeHtml(html) {
            return html.replace(/%5B/g, '[').replace(/%5D/g, ']');
        },
        play() {
            this.$refs.audioPlayer.play();
        },
        pause() {
            this.$refs.audioPlayer.pause();
        },
        stop() {
            const { audioPlayer } = this.$refs;
            audioPlayer.pause();
            audioPlayer.currentTime = 0;
        },
        onPlaying() {
            const { audioPlayer } = this.$refs;
            if (!audioPlayer) {
                return;
            }
            this.currentTime = Math.round(audioPlayer.currentTime);
            this.seekValue =
                (audioPlayer.currentTime / audioPlayer.duration) * 100;
        },
        onSeek() {
            const { audioPlayer } = this.$refs;
            const seekto = audioPlayer.duration * (this.seekValue / 100);
            audioPlayer.currentTime = seekto;
        },
    },
};
</script>
<style>
/* AI-Overlay-Bild in der rechten unteren Ecke */
.ai-overlay {
    position: absolute;
    bottom: 10px;  /* Abstand von unten */
    right: 10px;   /* Abstand von rechts */
    z-index: 20;   /* Höher als andere Elemente */
    background: rgba(0, 0, 0, 0.3); /* Leichte Transparenz für bessere Lesbarkeit */
    padding: 5px;
    border-radius: 4px;
}
.bigger .ai-button, .ai-button-image{
bottom:-10px;
z-index:30;
position:relative;
right:-10px !important;
margin:0 px auto;
}
@media screen and (max-width: 1023px) {
    .coverclass{

    max-width: 100%;
}
}
/* Responsive Anpassung */
@media screen and (min-width: 1024px) {
    .fwa {
        min-width: 950px;
    }
    .coverclass{
margin-left:52px;
}

}
/* .w-full{

    width:99%;
    max-width:100%;
} */
</style>
