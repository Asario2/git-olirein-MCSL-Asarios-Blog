@php
    use App\Http\Controllers\CommentController;
    if (!session_id()) {
        session_start();
    }
    $ida = $ida ?? -1;
    $fullUri = @$_SERVER['REQUEST_URI'];

    // Entfernt den Query-String, um nur den Pfad zu erhalten
    $path = parse_url($fullUri, PHP_URL_PATH);
    $uri = 'pictures';
    $pic = explode('/', $path)[2];
@endphp
@foreach ($data as $post)
    @php
        $_SESSION['pids'] = $_SESSION['pids'] ?? [];

        [$imw, $imh, $ty] = @getimagesize(public_path('/images/images/' . $post->image_path . ''));
        $ida++;
    @endphp
    @if (in_array($post->id, $_SESSION['pids']))
        @continue;
    @endif
    @php
        $_SESSION['pids'][] = $post->id;
    @endphp
    <div class="row align-items-start bdo_2" id='headline_{{ $post->id }}'>
        <!-- pswp box -->
        <div class="col-3">

            <figure>
                <a href='/images/images/big/{{ $post->image_path }}' data-width='{{ $imw }}'
                    data-id='{{ $ida }}' data-height='{{ $imh }}' class='openImage psl'
                    data-caption='{{ $post->headline }}'>
                    <img src="/images/images/bthumbs/{{ $post->image_path }}" alt="{{ $post->headline }}"
                        class="img-fluid2"></a>
                <figcaption class='hidden'>{{ $post->headline }}</figcaption>
            </figure>
        </div>


        <!-- Mittlere Spalte: Überschrift und Text -->
        <div class="col-md-6 mb-3">
            <h2 class="h5">{!! html_entity_decode(smi($post->headline)) !!}</h2>
            <p>{!! html_entity_decode(smi($post->message)) !!}</p>

            <button class='con_btn btn btn-sm' OnClick="$('#starz_{{ $post->id }}').toggle();"><span
                    class='shd'>⭐</span>
                Bewertung</button>&nbsp;
            <button class='con_btn btn btn-sm comm' OnClick="toggleCommentBox('{{ $post->id }}','');"><i
                    class='far fa-chat-bubble'></i>
                Kommentieren</button>&nbsp;<button class='con_btn btn btn-sm'
                OnClick="toggleShareBox('{{ $post->id }}');"><i class='fas fa-share_alt'></i>
                Teilen</button>
            <div id='starz_{{ $post->id }}' class='hidden'>
                <div id="star-rating-{{ $post->id }}" class="star-rating" data-id="{{ $post->id }}">
                    @php
                        $userrat[$post->id] = DB::table('ratings')
                            ->where('users_id', Auth::id())
                            ->where('image_id', $post->id)
                            ->first();
                        $userRating = $userrat[$post->id]->rating ?? 0; // Benutzerbewertung oder 0, wenn nicht bewertet
                        // vde($userrat);
                    @endphp

                    @for ($i = 1; $i <= 5; $i++)
                        <img src="/images/icons/{{ $i <= $userRating ? 'star' : 'star-empty' }}.png" alt="Star"
                            class="star" data-rating="{{ $i }}">
                    @endfor
                    <br />
                    <span id="rating-value-{{ $post->id }}">
                        Deine Bewertung: {{ $userRating }} von 5 Sternen
                    </span>
                </div>

                {{-- <p id="rating-value-{{ $post->id }}">Bewertung: 0 von 5 Sternen</p> --}}
            </div>
            @php

                $offset = request()->get('offset', 0);
                // $offset = @$_GET['offset'] ?? $offset;
                $limit = 10;

                $comments[$post->id] = DB::table('comments')
                    ->join('users', 'comments.users_id', '=', 'users.id')
                    ->where('comments.post_id', '=', $post->id)
                    ->orderBy('comments.id', 'desc')
                    ->select('users.name', 'users.image_path', 'comments.*')
                    ->take($limit)
                    ->skip($offset)
                    ->get();

            @endphp
            {!! CommentController::ComForm($table, $comments, $post) !!}
            <div id='share_{{ $post->id }}' style='display:none;'>
                @php
                    echo shariff($post, '', 'pictures');
                @endphp

            </div>
        </div>

        <!-- Rechte Spalte: Bewertung, Kamera und Status -->
        <div class="col-md-3 mb-3">
            <h5 class="h6">Kurzinfos:</h5>
            <ul class="list-unstyled">
                <li>
                    <strong>Bewertung:</strong>
                    <span id="star-rating-{{ $post->id }}">
                        @php
                            $ratings_alt[$post->id] = DB::table('ratings')
                                ->where('image_id', $post->id)
                                ->selectRaw('COALESCE(AVG(rating), 0) as a_rating, COUNT(*) as votes')
                                ->first();

                            $votes = $ratings_alt[$post->id]->votes;
                            $averageRating = $ratings_alt[$post->id]->a_rating ?? 0;
                            $fullStars = floor($averageRating); // Ganze Sterne
                            $halfStar = $averageRating - $fullStars >= 0.5 ? 1 : 0; // Halber Stern, falls vorhanden
                            $emptyStars = 5 - $fullStars - $halfStar; // Restliche leere Sterne
                        @endphp

                        <!-- Ganze Sterne anzeigen -->
                        @for ($i = 0; $i < $fullStars; $i++)
                            <img src="/images/icons/star.png" alt="Vollstern" style="width: 20px; height: 20px;">
                        @endfor

                        <!-- Halber Stern anzeigen, falls vorhanden -->
                        @if ($halfStar)
                            <img src="/images/icons/star-half.png" alt="Halbstern" style="width: 20px; height: 20px;">
                        @endif

                        <!-- Leere Sterne anzeigen -->
                        @for ($i = 0; $i < $emptyStars; $i++)
                            <img src="/images/icons/star-empty.png" alt="Leererstern"
                                style="width: 20px; height: 20px;">
                        @endfor
                    </span>
                    <br />
                    <span style='margin-bottom:18px;'>({!! str_replace('.0', '', number_format($averageRating, 1)) !!}
                        von
                        5) - {{ $votes }} Vote{{ $votes != 1 ? 's' : '' }}</span>
                </li>

                <li><strong>Datum:</strong> {!! date('d.m.Y', $post->created_at) !!}
                    {{-- <li><strong>Kamera:</strong>{{ $post->Camera }}</li> --}}
                <li>
                    @if ($post->status == 'inwork')
                        <strong>Status:</strong><span style='color:#FC9000'> In Arbeit</span><br />
                    @endif
                    @if (CheckRights(Auth::id(), 'images', 'edit'))
                        <a href="{{ route('tables.edit', ['id' => $post->id, 'table' => 'images', 'edit' => $uri, 'pic' => $pic]) }}"
                            class="btn btn-primary btn-sm">Bearbeiten</a>
                    @endif
                    &nbsp;
                    @if (CheckRights(Auth::id(), 'images', 'delete'))
                        <form
                            action="{{ route('tables.destroy', ['id' => $post->id, 'table' => 'images', 'edit' => $uri, 'pic' => $pic]) }}"
                            method="POST" style='display:inline'>
                            @csrf
                            @method('DELETE')
                            <button class="btn btn-danger btn-sm inl" type="submit"
                                onclick="return confirm('Möchten Sie diesen Eintrag wirklich löschen?');">Löschen</button>
                        </form>
                    @endif
                </li>
            </ul>
        </div>


    </div>
@endforeach
