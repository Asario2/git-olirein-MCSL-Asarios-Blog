<template>
    <div :class="['ai-button', big ? 'big' : 'small', bigger ? 'bigger' : '']" @click.stop>
        <a href="/home/ai">
            <img :src="'/images/icons/ai-' + (dma || 'dark') + '.png'"
                 alt="Made with AI"
                 title="Made with AI"
                 class="ai-button-image"
                 @error="handleImageError" />
        </a>
    </div>
</template>

<script>
export default {
    name: "AiButton",
    props: {
        big: Boolean,
        bigger: Boolean, // Unterscheidung zwischen Big & Small
    },
    data() {
        return {
            dma: localStorage.getItem('theme') || 'dark',
        };
    },
    methods: {
        handleImageError(event) {
            console.error('Bild konnte nicht geladen werden:', event.target.src);
        }
    }
};
</script>

<style  >
.ai-button {
    position: absolute;
    bottom: 0px;
    right: 0px;
    z-index: 10000;
    width:64px;
}

.ai-button-image {
    width: 64px;
    height: 64px;
}

.big .ai-button {
    bottom: 5px;
    right: 5px;
}

.small .ai-button {
    bottom: 0px;
    right:  0px;
}
.bigger .ai-button{
bottom:0;
right:64px !important;
}
</style>
