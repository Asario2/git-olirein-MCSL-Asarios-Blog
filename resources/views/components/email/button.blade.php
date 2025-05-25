<!-- resources/views/components/email/button.blade.php -->
@props(['url', 'text'])

<tr>
    <td>
        <a href="{{ $url }}" style="background-color: #007bff; color: #fff; padding: 10px 20px; text-decoration: none; border-radius: 5px;">
            {{ $text }}
        </a>
    </td>
</tr>
