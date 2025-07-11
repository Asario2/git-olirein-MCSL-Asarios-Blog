@component('mail::message')
# Neuer Email von {{ $domain }}

von **{{ $nickname }}** ({{$email}})

<b>{{ $content }}</b>

**{{ config('app.name') }} Team**
@endcomponent
