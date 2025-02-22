    @extends('layouts.app')

    @section('content')
        <div class="container my-4">
            <div class="row">
                <div id="main">
                    @if (CheckRights(Auth::id(), 'images', 'add'))
                        <a class='btn btn-success mb-3'
                            href="{{ route('tables.create-table', ['table' => 'images', 'edit' => 'images']) }}">Neues Bild
                            Hochladen</a>
                    @endif

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
                    <div class="inner">
                        <section class="tiles">
                            {!! StyleID('asd') !!}
                            @foreach ($data as $ima)
                                <div class="col-md-3 col-sm-6 col-12 mb-4">
                                    <article class="style{{ StyleID() }}">


                                        <span class='image'><img class='im_cat_img'
                                                src="/images/_ab/images_cat/{{ $ima->name }}.jpg"
                                                alt="{!! ucfirst($ima->shortname) !!}">
                                        </span>
                                        <a class='tbcl' href='pictures/{{ $ima->shortname }}'>
                                            <h5>{!! ucfirst($ima->name) !!}</h5>
                                            <div class="content">

                                                <p class="shd">{!! html_entity_decode($ima->heading_alt) !!}</p>
                                            </div>
                                        </a>
                                    </article>
                                </div>
                            @endforeach

                        </section>
                    </div>
                </div>
            </div>

            <script src="/js/browser.min.js"></script>
            <script src="/js/breakpoints.min.js"></script>
            <script src="/js/util.js"></script>
            <script src="/js/main.js"></script>
        @endsection
