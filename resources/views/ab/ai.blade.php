@extends('layouts.app')
@section('title', 'Künstliche Intelligenz für Bilder')
@section('content')
    @php
        $dm = $_SESSION['dm'] ?? 'dark';
    @endphp
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-12">
                @if ($data->isNotEmpty())
                    @foreach ($data as $item)
                        <div class="row mb-5">
                            <!-- Bild -->
                            <div class="col-6 d-none d-sm-block" align='right'>
                                <img src="/images/_ab/ai-teaser-{{ $dm }}.jpg" alt="Bild von {{ $item->headline }}"
                                    style="max-width: 480px; height: auto;float:left;">
                            </div>
                            <div class="col-6 d-none d-sm-block">
                                <h2 class="mb-4">{{ $item->headline }}</h2>
                                <p>{!! html_entity_decode(smi(nl2br(e($item->text)))) !!}</p>
                            </div>
                            <!-- Text -->
                            <div class=" d-block d-sm-none">
                                <div class="col-12">
                                    <h2 class="mb-4">{{ $item->headline }}</h2>
                                    <p>{!! html_entity_decode(smi(nl2br(e($item->text)))) !!}</p>
                                </div>
                            </div>
                        </div>
                    @endforeach
                @endif
            </div>
        </div>
    </div>
@endsection
