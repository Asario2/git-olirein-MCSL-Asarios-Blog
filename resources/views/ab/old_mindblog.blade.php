@extends('layouts.app')
@section('title', 'Willkommen auf Hannemucks Seite')
@php
    if (!session_id()) {
        session_start();
    }
    $dm = $_SESSION['dm'] ?? 'dark';
@endphp
@section('content')
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-8 offset-md-2">
                @if ($data->isNotEmpty())
                    @foreach ($data as $item)
                        <h2 class="mb-4">{!! html_entity_decode($item->headline) !!}</h2>
                        <nobr>
                            @if (CheckRights(Auth::id(), 'mindblog', 'publish'))
                                <div style='display:inline-block;margin-top:0;margin-right:-8px;'>
                                    <form method='POST'
                                        action="{{ route('admin.refresh_pub', ['id' => $item->id, 'table' => 'mindblog', 'direct' => true]) }}">
                                        @csrf
                                        <input type='hidden' name='pub' value='0'>
                                        <input type='hidden' name='direct' value='1'>
                                        <button class="btn btn-sm ntm-outline-secondary"><img
                                                src="http://ab.localhost.de:8000/images/icons/pub1.png"
                                                class="table_thumb"></button>
                                    </form>
                                </div>
                                &nbsp;&nbsp;
                            @endif
                            @if (CheckRights(Auth::id(), 'mindblog', 'edit'))
                                <div style='display:inline-block;margin-top:0;margin-right:-8px;'>
                                    <a href="{{ route('tables.edit', ['id' => $item->id, 'table' => 'mindblog']) }}"
                                        class="btn btn-primary btn-sm">Bearbeiten</a>
                                </div>
                                &nbsp;&nbsp;
                            @endif
                            @if (CheckRights(Auth::id(), 'mindblog', 'delete'))
                                <form action="{{ route('tables.destroy', ['id' => $item->id, 'table' => 'mindblog']) }}"
                                    method="POST" style="display:inline;">
                                    @csrf
                                    @method('DELETE')
                                    <button type="submit" class="btn btn-danger btn-sm"
                                        onclick="return confirm('Sind Sie sicher, dass Sie diesen Blogbeitrag löschen möchten?');">Löschen</button>
                                </form>
                            @endif
                        </nobr>
                        <div style='float:left;'>
                            @php

                                if (!file_exists("images/_ab/mindblog/$item->image_path") || empty($item->image_path)) {
                                    $item->image_path = 'refr_img.png';
                                }

                            @endphp


                            <img src='/images/_ab/mindblog/{{ $item->image_path }}'
                                style='padding-right:10px;max-width:200px;'>
                            <br />
                            @if ($item->xis_ai)
                                <a href='/ai'><img class='ai-gfx-mb'
                                        src='{{ asset('images/icons/ai-' . $dm . '.png') }}'></a><br />
                            @endif
                        </div>
                        <div>
                            <p>{!! html_entity_decode(smi(nl2br(e($item->text)))) !!}</p><br />
                        </div>
                    @endforeach
                @endif

            @endsection
