@php
    use App\Http\Controllers\FormController;
@endphp
@foreach ($posts as $row)
    <tr data-id="{{ $row->id }}" class='table-row'>
        <td>{{ $row->id }}</td>
        <td>
            <nobr>
                @if (CheckRights(Auth::id(), $table, 'edit'))
                    <a class="btn btn-primary inl"
                        href="{{ route('tables.edit', ['table' => $table, 'id' => $row->id]) }}">Bearbeiten</a>
                @endif
                @if (CheckRights(Auth::id(), $table, 'delete'))
                    <form class='inl' action="{{ route('tables.destroy', ['table' => $table, 'id' => $row->id]) }}"
                        method="POST">
                        @csrf
                        @method('DELETE')
                        <button class="btn btn-danger inl" type="submit"
                            onclick="return confirm('Möchten Sie diesen Eintrag wirklich löschen?');">Löschen</button>
                    </form>
                @endif
            </nobr>
        </td>
        @foreach ($columns as $column)
            {!! FormController::selectFieldText($column, $row->$column, $table, '', $row->id) !!}
        @endforeach
    </tr>
@endforeach
