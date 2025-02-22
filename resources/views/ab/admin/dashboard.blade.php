@extends('layouts.admin')

@php
    use App\Http\Controllers\FormController;
@endphp
@section('content')
    <div class="container-fluid">
        <div class="row">
            <!-- Stats Cards -->

            <div class="col-lg-3 col-6">
                <div class="small-box bg-success">
                    <div class="inner">
                        <h3>{{ $stats['posts'] }}</h3>
                        <p>Blog Posts</p>
                    </div>

                    <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 512 512">
                        <path fill="white"
                            d="M428 224H288a48 48 0 0 1-48-48V36a4 4 0 0 0-4-4h-92a64 64 0 0 0-64 64v320a64 64 0 0 0 64 64h224a64 64 0 0 0 64-64V228a4 4 0 0 0-4-4m-92 160H176a16 16 0 0 1 0-32h160a16 16 0 0 1 0 32m0-80H176a16 16 0 0 1 0-32h160a16 16 0 0 1 0 32" />
                        <path fill="white"
                            d="M419.22 188.59L275.41 44.78a2 2 0 0 0-3.41 1.41V176a16 16 0 0 0 16 16h129.81a2 2 0 0 0 1.41-3.41" />
                    </svg>

                    {{-- {{ route('admin.posts.index') }} --}}
                    <a href="#neues" class="small-box-footer blk">Weitere Infos <i
                            class="fas fa-arrow-circle-right"></i></a>
                </div>
            </div>
            <div class="col-lg-3 col-6">
                <div class="small-box bg-info">
                    <div class="inner">
                        <h3>{{ $stats['users'] }}</h3>
                        <p>Benutzer</p>
                    </div>
                    <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 512 512">
                        <path fill="white"
                            d="M332.64 64.58C313.18 43.57 286 32 256 32c-30.16 0-57.43 11.5-76.8 32.38c-19.58 21.11-29.12 49.8-26.88 80.78C156.76 206.28 203.27 256 256 256s99.16-49.71 103.67-110.82c2.27-30.7-7.33-59.33-27.03-80.6M432 480H80a31 31 0 0 1-24.2-11.13c-6.5-7.77-9.12-18.38-7.18-29.11C57.06 392.94 83.4 353.61 124.8 326c36.78-24.51 83.37-38 131.2-38s94.42 13.5 131.2 38c41.4 27.6 67.74 66.93 76.18 113.75c1.94 10.73-.68 21.34-7.18 29.11A31 31 0 0 1 432 480" />
                    </svg>
                    {{-- {{ route('admin.index') }} --}}
                    <a href="#user" class="small-box-footer blk">Weitere Infos <i
                            class="fas fa-arrow-circle-right"></i></a>
                </div>
            </div>


            <!-- Add more stat cards as needed -->
        </div>

        <!-- Data Table Section -->
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Neuste Einträge</h3>
                    </div>
                    <h3 id='neues'>Blog</h3>
                    <div class="card-body">
                        <div class='table-responsive'>
                            <table id="example1" class="table table-hover table-bordered table-striped">
                                <thead class='thead-dark'>
                                    <tr>
                                        <th>ID</th>
                                        <th>Typ</th>
                                        <th>Überschrift</th>
                                        <th>Content</th>
                                        <th>Erstellt am:</th>
                                        <th>Aktionen</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($posts as $post)
                                        <tr>
                                            <td>{{ $post->id }}</td>
                                        <td>{{ $post->cat }}</td>
                                            <td>{!! smi($post->title) !!}</td>
                                            <td>{!! smi(shorter($post->content)) !!}</td>
                                            <td width='16'>
                                                <nobr>{{ date('d.m.Y', $post->created_at) }}</nobr>
                                            </td>
                                            <td class="text-right" width='16'>
                                                <nobr>
                                                    {!! FormController::publish('pub', $post->pub, 'blog_posts', $post->id, 'blog_posts') !!}
                                                    {{-- {{ route('admin.users.edit', $user->id) }} --}}
                                                    &nbsp;
                                                    <a href="/tables/blog_posts/edit/{{ $post->id }}"
                                                        class="btn btn-sm btn-primary">Bearbeiten</a>
                                                    &nbsp;&nbsp;
                                                    {{-- {{ route('admin.users.destroy', $user->id) }} --}}
                                                    <form action="/table/blog_posts/delete/{{ $post->id }}"
                                                        method="POST" style='display:inline'>
                                                        @csrf
                                                        @method('DELETE')
                                                        <button class="btn btn-danger inl" type="submit"
                                                            onclick="return confirm('Möchten Sie diesen Eintrag wirklich löschen?');">Löschen</button>
                                                    </form>
                                                </nobr>
                                            </td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <h3 id='user'>Benutzer</h3>
                    <div class="card-body">
                        <div class='table-responsive'>
                            <table id="example1" class="table table-hover table-bordered table-striped">
                                <thead class='thead-dark'>
                                    <tr>
                                        <th>ID</th>
                                        <th>Name</th>
                                        <th>Email</th>
                                        <th>
                                            <nobr>Erstellt am:</nobr>
                                        </th>
                                        <th>Aktionen</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($users as $user)
                                        <tr>
                                            <td>{{ $user->id }}</td>
                                            <td>{{ $user->name }}</td>
                                            <td>{{ $user->email }}</td>
                                            <td width='16'>
                                                <nobr>{{ date('d.m.Y', $user->created_at) }}</nobr>
                                            </td>
                                            <td class="text-right" width='16'>
                                                <nobr>
                                                    <a href="/tables/users/edit/{{ $user->id }}"
                                                        class="btn btn-sm btn-primary">Bearbeiten</a>
                                                    {{-- {{ route('admin.users.destroy', $user->id) }} --}}
                                                    <form action="/table/users/delete/{{ $user->id }}" method="POST"
                                                        style='display:inline'>
                                                        @csrf
                                                        @method('DELETE')
                                                        <button class="btn btn-danger inl" type="submit"
                                                            onclick="return confirm('Möchten Sie diesen Eintrag wirklich löschen?');">Löschen</button>
                                                    </form>
                                                </nobr>
                                            </td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
