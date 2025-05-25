@component('mail::message')
# Neuer Kommentar auf {{ $domain }}

Es wurde ein neuer Kommentar von **{{ $nickname }}** auf **{{ $domain }}** veröffentlicht.

<div class='tro'>Kommentar: <b>{{ $content }}</b></div>

@component('mail::button', ['url' => $url])
Jetzt Überprüfen
@endcomponent


Mit freundlichen Grüßen,
**{{ config('app.name') }} Team**
@endcomponent
