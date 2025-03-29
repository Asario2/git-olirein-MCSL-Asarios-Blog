        <template>
            <div class="average-rating">
            <!-- Sterne -->
            <div class="stars">
                <Star
                v-for="star in 5"
                :key="star"
                :starValue="star"
                :isFilled="star <= Math.round(averageRating)"
                />
            </div>

            <!-- Durchschnittliche Bewertung -->
            <p class="rating-text">
                Durchschnitt: {{ averageRating.toFixed(1).replace(".0",'') }} Sterne <br />
                ({{ totalVotes }} Bewertungen)
            </p>
            </div>
        </template>

        <script>
        import axios from "axios";
        import Star from "@/Application/Components/Social/Star.vue";
        import { CleanTable, CleanId } from '@/helpers';
        export default {
            components: { Star },

            props: {
            postId: Number,
            },

            data() {
            return {
                averageRating: 0,
                totalVotes: 0,
            };
            },

            async mounted() {
            await this.fetchAverageRating();
            },

            methods: {
            async fetchAverageRating() {
                try {
                const table = CleanTable();
                const response = await axios.get(`/get-average-rating/${table}/${this.postId}`);

                if (response.data && response.data.average) {
                    this.averageRating = parseFloat(response.data.average);
                    this.totalVotes = response.data.total || 0;
                }
                } catch (error) {
                console.error("Fehler beim Laden der Durchschnittsbewertung:", error);
                }
            },

            cleanPath() {
                const searchableTables = ["images", "blogs", "didyouknow", "shortpoems"];
                const parts = window.location.pathname.split("/");
                return searchableTables.find((ta) => parts.includes(ta)) || null;
            },
            },
        };
        </script>

        <style scoped>
        .stars {
            display: flex;
            gap: 5px;
        }

        .rating-text {
            margin-top: 5px;
            font-size: 14px;
            color: #facc15; /* Gelb */
        }
        </style>
