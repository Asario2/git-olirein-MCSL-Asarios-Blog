<div class="comment-bubble-container">
    <img src="/images/_ab/users/sm/{{ $comment->image_path }}" alt="{{ $comment->name }}" class="user-icon">
    <div class="comment-bubble">
        <strong>{{ $comment->name ?: 'Unbekannt' }}:</strong>
        <span style='margin-block-end:0px;'>{!! nl2br(e($comment->content)) !!}</span>
    </div>
</div>
