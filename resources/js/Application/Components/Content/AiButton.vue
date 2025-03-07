<template>
    <div class="absolute bottom-4 right-4 z-10" @click.stop>

        <a href="/home/ai">
  <img :src="'images/icons/ai-' + dma + '.png'" alt="Made with AI" title="Made with AI" class="object-contain ai-button x64" />
</a>

    </div>
</template>

<script>
export default {
    name: "AiButton",
    //
props: {
        blog: {
            type: Object,
        },
        aiOverlayImage: {
            type: String,
        },
        dma:{
            type: String,
        },
    },
    data() {
    return {
        dma: localStorage.getItem('theme'), // Wert aus localStorage speichern
    };
},
    }
</script>


<style scoped>
.absolute {
    position: absolute;
}
.bottom-4 {
    bottom:0px;
}
.right-4 {
    right:-0px;
}
.z-10 {
    z-index: 10;
}
.x64
{
    min-width:64px !important;
}
</style>
