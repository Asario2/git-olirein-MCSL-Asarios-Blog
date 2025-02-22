@extends('layouts.app')

@php
    // Sitzung starten, falls nicht bereits gestartet
    if (!session_id()) {
        session_start();
    }
    // Dunkler Modus oder heller Modus festlegen ('dark' oder 'light')
    $dm = @$_SESSION['dm'] ? $_SESSION['dm'] : 'dark';
@endphp

@section('content')
    <div class="container mt-5">
        <h2 class="text-center mb-4">Kurzgeschichten</h2>

        <div class="accordion" id="accordionExample">
            @foreach ($data as $dat)
                <div class="accordion-item">
                    <!-- Accordion-Kopf -->
                    <h2 class="accordion-header" id="heading{{ $dat->id }}">
                        <button
                            class="accordion-button bg-{{ $dm }} text-white collapsed d-flex justify-content-between align-items-center"
                            type="button" data-bs-toggle="collapse" data-bs-target="#collapse{{ $dat->id }}"
                            aria-expanded="false" aria-controls="collapse{{ $dat->id }}"
                            style="width: 100%; font-size: 18px; text-align: left;">
                            <span>{!! html_entity_decode($dat->headline) !!}?</span>
                            <i class="bi bi-caret-down-fill"></i> <!-- Bootstrap Icon für Caret -->
                        </button>
                    </h2>

                    <!-- Accordion-Inhalt -->
                    <div id="collapse{{ $dat->id }}" class="accordion-collapse collapse"
                        aria-labelledby="heading{{ $dat->id }}" data-bs-parent="#accordionExample">
                        <div class="accordion-body" style="font-size: 18px;">
                            {!! smilies(html_entity_decode($dat->story)) !!}
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    </div>
@endsection
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css" rel="stylesheet">
<script>
    document.querySelectorAll('.accordion-button').forEach(button => {
        button.addEventListener('click', function() {
            const caret = this.querySelector('.bi-caret-down-fill');
            if (this.classList.contains('collapsed')) {
                caret.style.transform = 'rotate(0deg)'; // Caret nach unten
            } else {
                caret.style.transform = 'rotate(180deg)'; // Caret nach oben
            }
        });
    });
</script>
