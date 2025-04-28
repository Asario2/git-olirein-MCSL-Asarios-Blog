@extends('layouts.app')

@section('content')
    @php
        use App\Http\Controllers\CommentController;
        $fullUri = $_SERVER['REQUEST_URI'];
        $_SESSION['pids'] = [];
        // Entfernt den Query-String, um nur den Pfad zu erhalten
        $path = parse_url($fullUri, PHP_URL_PATH);
        $uri = 'pictures';
        $pic = explode('/', $path)[2];
    @endphp
    <div class="container">
        @if (CheckRights(Auth::id(), 'images', 'add'))
            <a class='btn btn-success mb-3'
                href="{{ route('tables.create-table', ['table' => 'images', 'edit' => $uri, 'pic' => $pic]) }}">Neues Bild
                Hochladen</a>
        @endif
        <!-- Erfolgsnachricht -->
        @if (session('success'))
            <div class="alert alert-success">
                {{ session('success') }}
            </div>
        @endif
        @if (session('error'))
            <div class="alert alert-danger">
                {{ session('error') }}
            </div>
        @endif



        @php
            $ida = -1;
            $table = 'images';
        @endphp
        <div class="pswp-gallery pswp-gallery--single-column gallery" id="gallery--getting-started" itemscope
            itemtype="http://schema.org/ImageGallery">
            <div id='post-container'>
                @include(
                    'posts.partials.images_items',
                    compact('table', 'data', 'comments', 'userRatings', 'ratings'))
            </div>
        </div>
    </div>
    <div id ="loading"> Lade Content </div>
    <div class="spacer">
    </div>
    <script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
    <script type="module">
        document.addEventListener('DOMContentLoaded', async () => {
            const PhotoSwipeLightbox = (await import(
                'https://unpkg.com/photoswipe@5/dist/photoswipe-lightbox.esm.js')).default;

            const lightbox = new PhotoSwipeLightbox({
                gallery: '.gallery',
                children: 'a.psl',
                pswpModule: () => import('https://unpkg.com/photoswipe@5/dist/photoswipe.esm.js'),
                data: {
                    caption: (el) => el.dataset
                        .caption, // Hole die Bildunterschrift aus dem data-caption Attribut
                }
            });

            lightbox.init();

            // Funktion zum Laden und Öffnen eines spezifischen Bildes
            window.openPhotoSwipe = function(index) {
                lightbox.loadAndOpen(index); // Bild laden und öffnen
            };
            lightbox.on('open', function() {
                const zoomOptions = {
                    zoomLevel: 1, // Starting zoom level
                    maxZoomLevel: 5, // Maximum zoom level allowed
                };
                lightbox.pswp.setContent(zoomOptions); // Pass zoom options if needed
            });
            // Event Listener für das afterChange-Ereignis
            lightbox.on('afterChange', function() {
                if (lightbox.pswp.currSlide && lightbox.pswp.currSlide.data) {
                    const imgElement = lightbox.pswp.currSlide.data.src; // Das aktuelle Bild
                    // console.log('Aktuelles Bild:', imgElement); // Protokolliere das aktuelle Bild
                } else {
                    console.warn('Aktuelle Folie oder Daten nicht verfügbar');
                }
            });

            const openImageButtons = document.getElementsByClassName('openImage');

            // Füge Event Listener zu jedem Button hinzu
            for (let button of openImageButtons) {
                button.addEventListener('click', () => {
                    const images = document.querySelectorAll('.gallery div a.psl');

                    images.forEach((img, index) => {
                        img.addEventListener('click', function(e) {
                            e.preventDefault(); // Verhindert das Standardverhalten
                            const dataId = index; // Nutze den Index des Bildes

                            // Breite und Höhe aus den Datenattributen holen
                            const width = parseInt(this.getAttribute('data-width'));
                            const height = parseInt(this.getAttribute('data-height'));

                            openPhotoSwipe(dataId); // Funktion mit dem Index aufrufen
                        });
                    });
                });
            }
        });
        @php
            $post = $data;
        @endphp
        document.addEventListener("DOMContentLoaded", function() {
            if ($_GET['open_comments'] && $_GET['open_comments'] !== "undefined") {
                var target = document.getElementById("headline_" + $_GET['open_comments']);
                target.scrollIntoView({});
            }

            @if (isset($post->id) && isset($ratings[$post->id]))


                @foreach ($ratings[$post->id] as $rat)
                    // Bewertung des jeweiligen Bildes
                    var averageRating = {{ $rat->a_rating }};
                    var starContainer = document.getElementById(`star-rating-{{ $rat->id }}`);

                    // Anzahl der vollen, halben und leeren Sterne berechnen
                    var fullStars = Math.floor(averageRating);
                    var hasHalfStar = (averageRating - fullStars) >= 0.5;
                    var emptyStars = 5 - fullStars - (hasHalfStar ? 1 : 0);

                    // Vollen Sterne hinzufügen
                    for (let i = 0; i < fullStars; i++) {
                        var fullStar = document.createElement("img");
                        fullStar.src = "/images/icons/star.png"; // Pfad zum Bild eines vollen Sterns
                        fullStar.alt = "Voller Stern";
                        fullStar.style.width = "20px"; // Optional: Größe anpassen
                        fullStar.style.height = "20px"; // Optional: Größe anpassen
                        starContainer.appendChild(fullStar);
                    }

                    // Halben Stern hinzufügen, falls erforderlich
                    if (hasHalfStar) {
                        var halfStar = document.createElement("img");
                        halfStar.src = "/images/icons/star-half.png"; // Pfad zum Bild eines halben Sterns
                        halfStar.alt = "Halber Stern";
                        halfStar.style.width = "20px"; // Optional: Größe anpassen
                        halfStar.style.height = "20px"; // Optional: Größe anpassen
                        starContainer.appendChild(halfStar);
                    }

                    // Leeren Sterne hinzufügen
                    for (let i = 0; i < emptyStars; i++) {
                        var emptyStar = document.createElement("img");
                        emptyStar.src = "/images/icons/star-empty.png"; // Pfad zum Bild eines leeren Sterns
                        emptyStar.alt = "Leerer Stern";
                        emptyStar.style.width = "20px"; // Optional: Größe anpassen
                        emptyStar.style.height = "20px"; // Optional: Größe anpassen
                        starContainer.appendChild(emptyStar);
                    }
                @endforeach
            @endif
        });
    </script>

    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const starContainers = document.querySelectorAll(".star-rating");

            starContainers.forEach(container => {
                const stars = container.querySelectorAll(".star");
                const ratingValue = container.querySelector(
                    `#rating-value-${container.getAttribute("data-id")}`
                );
                const postId2 = container.getAttribute("data-id");
                let currentRating = 0;

                stars.forEach(star => {
                    star.addEventListener("click", function() {
                        currentRating = this.getAttribute("data-rating");
                        updateStars(currentRating, stars);

                        // Überprüfen, ob ratingValue vorhanden ist
                        if (ratingValue) {
                            ratingValue.textContent =
                                `Deine Bewertung: ${currentRating} von 5 Sternen`;
                        }

                        sendRatingToServer(currentRating, postId2);
                    });

                    star.addEventListener("mouseover", function() {
                        const hoverRating = this.getAttribute("data-rating");
                        updateStars(hoverRating, stars);
                    });

                    star.addEventListener("mouseout", function() {
                        updateStars(currentRating, stars);
                    });
                });
            });

            function updateStars(rating, stars) {
                stars.forEach(star => {
                    const starRating = star.getAttribute("data-rating");
                    star.src = starRating <= rating ? "/images/icons/star.png" :
                        "/images/icons/star-empty.png";
                });
            }

            function sendRatingToServer(rating, postId2) {
                fetch('/imageratings', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json',
                            'X-CSRF-TOKEN': '{{ csrf_token() }}'
                        },
                        body: JSON.stringify({
                            rating: rating,
                            id: postId2,
                            table: "images"
                        })
                    })
                    .then(response => {
                        if (!response.ok) {
                            throw new Error(`HTTP-Error: ${response.status}`);
                        }


                        return response.json();
                    })
                    .then(data => {
                        if (data.status === 'error') {
                            throw new Error(data.message);
                        }
                        location.reload();
                    })
                    .catch(error => {
                        console.error('Fehler beim Speichern der Bewertung:', error.message);
                        alert(`Fehler: ${error.message}`);
                    });
            }
        });
    </script>
    @php
        $conts = '';
        foreach ($data as $post) {
            $conts .= "'form_com_{$post->id}',";
        }
        // Entferne das letzte Komma und umschließe das Ergebnis in eckigen Klammern
        $conts = '[' . rtrim($conts, ',') . ']';

    @endphp
    <script>
        function toggleShareBox(id) {
            const element = document.getElementById(`share_${id}`);
            const isVisible = element.style.display === 'none';
            element.style.display = isVisible ? 'block' : 'none';

        }

        // Kommentar senden per AJAX
        function submitComment(imageId) {
            event.preventDefault();
            // Kommentartext aus dem Eingabefeld abrufen
            const commentInput = document.getElementById(`comment-input-${imageId}`);
            const commentText = commentInput.value;

            // Überprüfen, ob das Eingabefeld leer ist
            if (!commentText.trim()) {
                alert('Bitte geben Sie einen Kommentar ein.');
                return;
            }

            // AJAX-Anfrage an den Server senden
            fetch('{{ route('comments.store_alt', ['table' => 'images']) }}', { // Passe die Route ggf. an
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'X-CSRF-TOKEN': '{{ csrf_token() }}' // CSRF-Token für Laravel
                    },
                    body: JSON.stringify({
                        post_id: imageId,
                        content: commentText,
                        table: "images"
                    })
                })
                .then(response => response.json())
                .then(data => {
                    if (data.status === 'success') {
                        alert('Kommentar erfolgreich gesendet!');
                        commentInput.value = ''; // Eingabefeld leeren
                        addCommentToList(imageId, data.comment); // Kommentar zur Liste hinzufügen
                    } else {
                        alert('Fehler beim Senden des Kommentars.');
                    }
                })
                .catch(error => {
                    console.error('Fehler beim Senden des Kommentars:', error);
                });
        }

        // // Funktion, um den Kommentar zur Kommentar-Liste hinzuzufügen
        // function addCommentToList(imageId, comment) {
        //     const commentList = document.getElementById(`comment-list-${imageId}`);
        //     const commentElement = document.createElement('div');
        //     commentElement.classList.add('comment');
        //     commentElement.innerHTML =
        //         `<strong>${comment.user ? comment.user.name : 'Unbekannt'}:</strong> ${comment.content}`;
        //     commentList.appendChild(commentElement);
        // }


        document.addEventListener("DOMContentLoaded", function() {
            // Funktion zum Umschalten zwischen Input und Textarea basierend auf der Textlänge
            window.checkInputLength = function(id) {
                var inputField = document.getElementById(`comment-input-${id}`);
                var textareaField = document.getElementById(`comment-textarea-${id}`);

                inputField.addEventListener('input', function() {
                    if (inputField.value.length > 29) {
                        textareaField.value = inputField.value;
                        inputField.style.display = 'none';
                        textareaField.style.display = 'block';
                        textareaField.focus();
                    }
                });

                textareaField.addEventListener('input', function() {
                    if (textareaField.value.length <= 29 && inputField.value.split("\n").length <= 0) {
                        inputField.value = textareaField.value;
                        textareaField.style.display = 'none';
                        inputField.style.display = 'block';
                        inputField.focus();
                    }
                });
            };
        });
    </script>
    {{-- <script>
        document.addEventListener("DOMContentLoaded", () => {
            const take = {}; // Speichert den Offset pro Kommentarbereich
            const isLoading = {}; // Verhindert doppelte Anfragen

            // Alle Kommentarcontainer auswählen
            document.querySelectorAll(".comments-container").forEach((container) => {
                const postId = container.id.split("-").pop(); // Extrahiere die Post-ID aus der Container-ID
                take[postId] = 0; // Initialer Offset für diesen Post
                isLoading[postId] = false; // Ladeflag initial auf false

                // Funktion zum Laden der Kommentare
                async function loadComments(postId) {
                    if (isLoading[postId]) return; // Verhindere doppelte Anfragen
                    isLoading[postId] = true;

                    console.log(`Lade Kommentare für Post-ID ${postId} mit Offset ${take[postId]}`);

                    const loadingIndicator = document.getElementById(`loading-${postId}`);
                    loadingIndicator.style.display = "block";

                    try {
                        // API-Aufruf, um Kommentare zu laden
                        const response = await fetch(
                            `/comments/load/${postId}?offset=${take[postId]}&limit=10`);
                        const data = await response.json();

                        if (data.comments && data.comments.length > 0) {
                            const commentContainer = document.getElementById(
                                `comments-container-${postId}`);

                            // Kommentare hinzufügen
                            data.comments.forEach((comment) => {
                                const commentBubble = document.createElement("div");
                                commentBubble.className = "comment-bubble";
                                commentBubble.innerHTML = `
              <strong>${comment.name || "Anonymous"}:</strong> ${comment.content}
            `;
                                commentContainer.appendChild(commentBubble);
                            });

                            // Offset erhöhen
                            take[postId] += 10;
                        } else {
                            console.log(`Keine weiteren Kommentare für Post-ID ${postId}`);
                        }
                    } catch (error) {
                        console.error(`Fehler beim Laden der Kommentare für Post-ID ${postId}:`, error);
                    } finally {
                        loadingIndicator.style.display = "none";
                        isLoading[postId] = false;
                    }
                }

                // Event-Listener für Scrollen hinzufügen
                container.addEventListener("scroll", () => {
                    const threshold = 50; // Abstand zum unteren Rand
                    const scrollPosition = container.scrollHeight - container.scrollTop - container
                        .clientHeight;

                    console.log(`Scroll-Position für Post-ID ${postId}:`, scrollPosition);

                    if (scrollPosition < threshold) {
                        loadComments(postId); // Kommentare nachladen
                    }
                });

                // Erste Kommentare laden
                loadComments(postId);
            });
        }); --}}
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            let offset = {{ $data->count() }};
            let loading = false;

            // Funktion zum Abrufen und Anhängen weiterer Posts
            function loadMorePosts() {
                if (loading) return; // Keine neuen Anfragen, wenn bereits geladen wird
                loading = true;
                document.getElementById("loading").style.display = "block";

                fetch(`/pictures/load-more/{{ $post->image_categories_id }}?offset=${offset}`)
                    .then(response => response.text())
                    .then(data => {
                        if (data.trim() !== "") {
                            document.getElementById("post-container").insertAdjacentHTML("beforeend", data);
                            offset += 10;
                            loading = false;
                            document.getElementById("loading").style.display = "none";
                        } else {
                            // Keine weiteren Inhalte verfügbar
                            document.getElementById("loading").innerText = "";
                        }
                    })
                    .catch(error => {
                        console.error("Fehler beim Laden weiterer Beiträge:", error);
                        loading = false;
                        document.getElementById("loading").style.display = "none";
                    });
            }

            // Scroll-Event-Listener hinzufügen
            window.addEventListener("scroll", function() {
                // Überprüfen, ob der Benutzer fast das Seitenende erreicht hat
                if (window.innerHeight + window.scrollY >= document.body.offsetHeight - 500) {
                    loadMorePosts();
                }
            });
        });
    </script>
    <script>
        function sendcmd(id) {
            var inputarea = document.getElementById('comment-input-' + id);
            var textArea = document.getElementById('comment-textarea-' + id);
            var form = document.getElementById('fcom_' + id); // Formular-Element holen


            // Event-Listener für das Eingabefeld (inputarea)
            inputarea.addEventListener("keydown", function(event) {
                if (event.key === "Enter") {
                    if (event.shiftKey) {
                        // Shift + Enter -> Neue Zeile
                        event.preventDefault();

                        // Text aus dem Eingabefeld abrufen
                        const inputText = inputarea.value.trim();

                        if (inputText !== "") {
                            // Text im Textarea setzen und Eingabefeld ausblenden
                            textArea.value = inputText + "\n"; // Fügt eine neue Zeile ein
                            inputarea.style.display = "none"; // Versteckt das Eingabefeld
                            textArea.style.display = "block"; // Zeigt das Textarea an
                            textArea.focus();

                            const length = textArea.value.length;
                            textArea.setSelectionRange(length, length); // Setzt den Cursor ans Ende
                        }
                    }
                }
            });

            // Event-Listener für das Textarea (textArea)
            textArea.addEventListener("keydown", function(event) {
                if (event.key === "Enter") {
                    if (event.shiftKey) {
                        // Shift + Enter -> Neue Zeile in Textarea
                        event.preventDefault(); // Verhindert das Standardverhalten

                        const cursorPosition = textArea.selectionStart; // Aktuelle Cursorposition
                        const textBeforeCursor = textArea.value.substring(0, cursorPosition);
                        const textAfterCursor = textArea.value.substring(cursorPosition);

                        // Füge nur dann ein \n hinzu, wenn es noch nicht am Ende ist
                        if (!textBeforeCursor.endsWith("\n")) {
                            textArea.value = textBeforeCursor + "\n" + textAfterCursor;

                            // Cursor nach der neuen Zeile setzen
                            textArea.setSelectionRange(cursorPosition + 1, cursorPosition + 1);
                        }
                    } else {
                        // Nur Enter -> Formular absenden
                        event.preventDefault(); // Verhindert das Erstellen einer neuen Zeile
                        if (form) {
                            form.submit(); // Formular absenden
                        } else {
                            console.error('Das angegebene Formular existiert nicht oder ist kein Formular.');
                        }
                    }
                }
            });
        }
    </script>
@endsection
