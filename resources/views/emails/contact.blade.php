@component('mail::message')
# Neue Email von {{ $domain }}

von **{{ $nickname }}** ({{$email}})

<b>{!! nl2br(e($content)) !!}</b>       

**{{ config('app.name') }} Team**
@endcomponent
