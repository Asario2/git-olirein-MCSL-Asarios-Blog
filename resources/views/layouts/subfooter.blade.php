    <br />
    <br />

    <script>
        document.getElementById('darkModeToggle').addEventListener('click', function() {
            fetch("{{ route('toggle.darkmode') }}", {
                    method: 'POST',
                    headers: {
                        'X-CSRF-TOKEN': '{{ csrf_token() }}'
                    }
                })
                .then(() => location.reload());
        });

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
                        }
                    }
                }
            });
        }

        function toggleCommentBox(id) {
            const element = document.getElementById(`form_com_${id}`);
            const isVisible = element.style.display === 'none';
            element.style.display = isVisible ? 'block' : 'none';
            $('#comment-box-' + id).show();
            // Hole alle aktuellen offenen Boxen aus der URL und aktualisiere
            const urlParams = new URLSearchParams(window.location.search);
            let openComments = urlParams.get('open_comments') ? urlParams.get('open_comments').split(',') : [];

            if (isVisible) {
                // Füge die ID hinzu, wenn die Box geöffnet wird
                openComments.push(id.toString());
            } else {
                // Entferne die ID, wenn die Box geschlossen wird
                openComments = openComments.filter(openId => openId !== id.toString());
            }

            // Aktualisiere die URL ohne Neuladen
            urlParams.set('open_comments', openComments[1]);
            window.history.replaceState(null, '', `${window.location.pathname}?${urlParams}`);
            // Stelle sicher, dass zum Anker gescrollt wird
            if (isVisible) {
                document.getElementById(`cmtbtn_${id}`).scrollIntoView({
                    behavior: 'smooth',
                    block: 'start'
                });
            }


        }
    </script>

    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.4/jquery.datetimepicker.min.css" />

    <!-- Here by using Id selector the datetime picker will load on this input element -->

    <script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
    <script
        src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.4/build/jquery.datetimepicker.full.min.js">
    </script>
    <br /><br />
    <br />
