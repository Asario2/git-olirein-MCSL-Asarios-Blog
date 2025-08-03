@php
    $openComments = isset($_GET['open_comments']) ? $_GET['open_comments'] : '';
    $opc = rawurldecode($openComments);
    $opc = explode(',', $opc);

    $disp = in_array($post->id, $opc) ? 'block' : 'none';
    if (empty($opc[0]) || $opc[0] == 'undefined') {
        $disp = 'none';
    }
@endphp
<form action="{{ route('comments.store', ['table' => 'images', 'id' => $post->id]) }}" id="form_com_{{ $post->id }}"
    method="POST" style="display:$disp;">
    @csrf
    <input type='hidden' name='post_id' value='{{ $post->id }}'>
    <div id="comment-list-{{ $post->id }}" class="comment-list">
        <!-- Existierende Kommentare für dieses Bild werden hier angezeigt -->
        @if (isset($post->id) && isset($comments[$post->id]))
            @foreach ($comments[$post->id] as $comment)
                <div class='comment-box'>
                    <div class='u-icon'>
                        <img src='/images/_ab/users/thumbs/{{ $comment->image_path }}' class='uicon'>
                    </div>
                    <div class="comment">
                        <strong>{{ $comment->name ? $comment->name : 'Unbekannt' }}:</strong>
                        <span class='comment-text'>{{ $comment->content }}</span>
                    </div>
                </div>
            @endforeach
        @endif
        @php
            $disp_for = in_array($post->id, $opc) ? 'block' : 'none';
        @endphp
        {{-- <div id='format' style='display:{{ $disp_for }}'> --}}
        <input type="text" class="comment-input" id="comment-input-{{ $post->id }}"
            placeholder="Dein Kommentar..." maxlength="100" name="comment"
            oninput="checkInputLength({{ $post->id }})" size='32' />
        <textarea class="commentTextarea" id="comment-textarea-{{ $post->id }}" placeholder="Dein Kommentar..."
            name="comment2" cols="60" rows="4" style="display: none;" maxlength="500"></textarea>
        <button class='btn btn-sm con_sub'
            onclick="$('#form_com_{{ $post->id }}').submit();return false;">Senden</button>
        {{-- </div> --}}

    </div>

</form>
