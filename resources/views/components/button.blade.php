<!-- resources/views/components/email/button.blade.php -->
@props(['url', 'text'])

<tr>
    <td>
        <a href="{{ $url }}" class="button" style="background-color: #3490dc; color: white; padding: 12px 24px;">
            {{ $slot }}
        </a>
    </td>
</tr>
