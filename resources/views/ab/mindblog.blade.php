@extends('layouts.app')

@section('content')
    <div class="container mt-5">
        @php
            $dm = $_SESSION['dm'] ?? 'dark';
        @endphp

        @if (CheckRights(Auth::id(), 'mindblog', 'add'))
            <a class='btn btn-success mb-3' href="{{ route('tables.create-table', ['table' => 'mindblog']) }}">Mindblog
                schreiben</a>
        @endif

        <h1>Mindblog - meine Gedanken</h1>

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

        <!-- Blogposts Liste -->
        <ul class="list-group">
            @forelse ($data as $post)
                <li class="list-group-item">
                    <table width='100%' class='nowidth'>
                        <tr>
                            <td rowspan='2' valign='top' width='300' style='max-height:160px;overflow:hidden;'>
                                @if (!empty($post->image_path) && file_exists('images/_ab/mindblog/' . $post->image_path))
                                    <img style='max-height:480px;padding-right:19px;max-width:285px;margin-bottom:-64px;'
                                        src='{{ asset('images/_ab/mindblog/' . $post->image_path) }}'>
                                    @if ($post->xis_ai)
                                        <a href='/ai'><img class='ai-gfx'
                                                src='{{ asset('images/icons/ai-' . $dm . '.png') }}'></a>
                                    @endif
                                @endif
                            </td>
                            <td rowspan='2' valign='top' width='80%'>
                                <h3>{!! html_entity_decode($post->title) !!}</h3>
                                <p>{!! html_entity_decode(stripslashes(nl2br(e($post->content)))) !!}</p>
                                <a href='{{ $post->url }}'>{{ $post->url }}</a><br />
                                <small>Autor:
                                    @php
                                        $authorName = DB::table('posts')
                                            ->join('users', 'posts.author_id', '=', 'users.id')
                                            ->where('posts.id', $post->id)
                                            ->value('users.name');

                                    @endphp
                                    {{ $authorName ? $authorName : 'Unbekannt' }}
                                    | Veröffentlicht am: {{ \Carbon\Carbon::parse($post->created_at)->format('d.m.Y H:i') }}
                                </small>
                            </td>

                            <td valign='top' class='text-end'> <!-- Use CSS classes for alignment -->
                                <nobr>
                                    @if (CheckRights(Auth::id(), 'mindblog', 'edit'))
                                        <div style='display:inline-block;margin-top:0;margin-right:-8px;'>
                                            <a href="{{ route('tables.edit', ['id' => $post->id, 'table' => 'mindblog']) }}"
                                                class="btn btn-primary btn-sm">Bearbeiten</a>
                                        </div>
                                        &nbsp;&nbsp;
                                    @endif
                                    @if (CheckRights(Auth::id(), 'mindblog', 'delete'))
                                        <form
                                            action="{{ route('tables.destroy', ['id' => $post->id, 'table' => 'mindblog']) }}"
                                            method="POST" style="display:inline;">
                                            @csrf
                                            @method('DELETE')
                                            <button type="submit" class="btn btn-danger btn-sm"
                                                onclick="return confirm('Sind Sie sicher, dass Sie diesen Blogbeitrag löschen möchten?');">Löschen</button>
                                        </form>
                                    @endif
                                </nobr>
                            </td>
                        </tr>
                    </table>
                </li>
            @empty
                <li class="list-group-item">Keine Blogposts vorhanden.</li>
            @endforelse
        </ul>
    </div>
@endsection
