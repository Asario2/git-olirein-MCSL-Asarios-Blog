<template>
    <div class="absolute bottom-4 right-4 z-10">
        <img :src="computedOverlayImage" alt="AI Button" class="object-contain x64" />
    </div>
</template>

<script>
export default {
    name: "AiButton",
    props: {
        overlayImage: {
            type: String,
            default: "", // Standardwert als leeren String setzen
        },
    },
    computed: {
        computedOverlayImage() {
            // Falls overlayImage leer ist oder nicht definiert wurde, setze einen Standardwert
            return this.overlayImage && this.overlayImage.trim() !== "" ? this.overlayImage : "/images/icons/ai-light.png";
        },
    },
};
</script>

<style scoped>
.absolute {
    position: absolute;
}
.bottom-4 {
    bottom:0px;
}
.right-4 {
    right:0px;
}
.z-10 {
    z-index: 10;
}
.x64
{
    min-width:64px !important;
}
</style>
