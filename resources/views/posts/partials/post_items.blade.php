 @php
     $dm = $_SESSION['dm'] ?? 'dark';

 @endphp
 @foreach ($posts as $post)
     @php

     @endphp
     <li class="list-group-item">
         <table width='100%' class='nowidth'>
             <tr>
                 <td colspan='2' valign='top' style='max-height:160px;overflow:hidden;'
                     id='headline_{{ $post->id }}'>
                     @php
                         $h = '';
                         if (empty($post->image_path)) {
                             $post->image_path = '008.jpg';
                             //  $h = 'height:1px;';
                         }
                         #bp_imgwidth
                         //  $_SESSION['comment_ids'] = [];
                     @endphp
                     <div class='image-container'>
                         <img style='{{ $h }}' class='background-image'
                             src='{{ asset('images/blog_posts/big/' . $post->image_path) }}' alt="{{ $post->title }}"
                             title="{{ $post->title }}">
                         @if ($post->xis_ai)
                             <a href='/ai'><img class='overlay-image' title='Made with AI' alt='Made with AI'
                                     src='{{ asset('images/icons/ai-' . $dm . '.png') }}'></a>
                         @endif
                         @if ($post->categories_id)
                             <img class='overlay-l-image'
                                 src='{{ asset('images/icons/' . $post->category->category . '-' . $dm . '.png') }}'
                                 alt="{{ $post->category->name }} - {{ $post->category->description }}"
                                 title="{{ $post->category->name }} - {{ $post->category->description }}">
                         @else
                             <img class='overlay-l-image' src='{{ asset('images/icons/spacer.gif') }}'>
                         @endif
                     </div>

                 </td>
             </tr>
             <tr>
                 <td valign='top' width='80%'>

                     <h1><b>{!! html_entity_decode(smi($post->title)) !!}</b></h1>
                     <p>{!! html_entity_decode(smi(nl2br(e($post->content)))) !!}</p>
                     <a href='{{ $post->url }}'>{{ $post->url }}</a><br />
                     <small>Autor:
                         {{ $post->author ? $post->author->name : 'Unbekannt' }}
                         | Veröffentlicht am:
                         {{ \Carbon\Carbon::parse($post->created_at)->format('d.m.Y') }}
                     </small>
                     <br />
                     <button class='con_btn btn btn-sm' OnClick="$('#starz_{{ $post->id }}').toggle();"><span
                             class='shd'>⭐</span>
                         Bewertung</button>&nbsp;
                     <button class='con_btn btn btn-sm comm' id='cmtbtn-{{ $post->id }}'
                         OnClick="toggleCommentBox('{{ $post->id }}', '{{ $comment['id'] ?? '' }}');">
                         <i class='far fa-chat-bubble'></i> Kommentieren
                     </button>&nbsp;<button class='con_btn btn btn-sm'
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
                                 <img src="/images/icons/{{ $i <= $userRating ? 'star' : 'star-empty' }}.png"
                                     alt="Star" class="star" data-rating="{{ $i }}">
                             @endfor
                             <br />
                             <span id="rating-value-{{ $post->id }}">
                                 Deine Bewertung: {{ $userRating }} von 5 Sternen
                             </span>
                         </div>

                         {{-- <p id="rating-value-{{ $post->id }}">Bewertung: 0 von 5 Sternen</p> --}}
                     </div>
                     <div id='comments-container'>
                         {{-- @if (isset($comments[$post->id])) --}}
                         @include('posts.partials.comment_form', [
                             'posts' => $posts,
                             'comments' => $comments,
                             'table' => $table,
                         ])
                         {{-- @endif --}}


                     </div>
                     <div id='share_{{ $post->id }}' style='display:none;'>
                         @php
                             echo shariff($post, '', 'blog_posts');
                         @endphp

                     </div>
                     <div class='arating'>
                         <strong>Bewertung:</strong>
                         <span id="star-rating-{{ $post->id }}">
                             @php
                                 $ratings_alt[$post->id] = DB::table('ratings')
                                     ->where('image_id', $post->id)
                                     ->where('table', $table)
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
                                 <img src="/images/icons/star-half.png" alt="Halbstern"
                                     style="width: 20px; height: 20px;">
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
                     </div>
                     <script>
                         scrollComments({{ $post->id }});
                     </script>
                 </td>
                 @if (CheckRights(Auth::id(), 'blog_posts', 'edit') || CheckRights(Auth::id(), 'blog_posts', 'delete'))
                     <td valign='top' class='text-end'> <!-- Use CSS classes for alignment -->
                         <nobr>
                             @if (CheckRights(Auth::id(), 'blog_posts', 'edit'))
                                 <div style='display:inline-block;margin-top:0;margin-right:-8px;'>
                                     <a href="{{ route('tables.edit', ['id' => $post->id, 'table' => 'blog_posts', 'edit' => 'blogposts.index']) }}"
                                         class="btn btn-primary btn-sm">Bearbeiten</a>
                                 </div>
                                 &nbsp;&nbsp;
                             @endif
                             @if (CheckRights(Auth::id(), 'blog_posts', 'delete'))
                                 <form
                                     action="{{ route('tables.destroy', ['id' => $post->id, 'table' => 'blog_posts', 'edit' => 'blogposts.index']) }}"
                                     method="POST" style="display:inline;">
                                     @csrf
                                     @method('DELETE')
                                     <button type="submit" class="btn btn-danger btn-sm"
                                         onclick="return confirm('Sind Sie sicher, dass Sie diesen Blogbeitrag löschen möchten?');">Löschen</button>
                                 </form>
                             @endif
                         </nobr>
                     </td>
                 @endif
             </tr>
         </table>
     </li>
 @endforeach
