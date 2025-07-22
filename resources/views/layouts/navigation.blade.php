@php
    $subdomain = SD();
    $dm = @$_SESSION['dm'];
    $dm = $dm ? $dm : 'dark';
    $fullUri = @$_SERVER['REQUEST_URI'];

    // Entfernt den Query-String, um nur den Pfad zu erhalten
    $path = parse_url($fullUri, PHP_URL_PATH);
    $ps = explode('/', $path);
    $host = $ps[1];
@endphp
<div align='center'>
    <div class="d-block d-sm-none sm_logo">
        <nobr>
            <img src='{{ asset('images/_ab/logo_sm.png') }}' />
            <img src='{{ asset('images/_ab/poweredbymcs_sm.png') }}' class='poweredby_sm'>
        </nobr>
    </div>
    <div class="d-none d-sm-block">
        <img src='{{ asset('images/_ab/logo.png') }}' />
        <img src='{{ asset('images/_ab/poweredbymcs.png') }}' class='poweredby'>
    </div>

</div>
<nav
    class="navbar ab_nav_ab nvi_{{ $host }} items-center justify-center  justify-content-center navbar-expand-lg navbar-{{ $dm }} bg-{{ $dm }}">
    <div class="container">

        <a style='display:inline' class="navbar-brand" href="{{ route('blogposts.index') }}">Asarios Blog</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto bpad">
                <li class="nav-item">
                    <a class="nav-link" href="{{ route('devmod') }}">devmod</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/profil/1">Über mich</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/pictures">Bilder</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/profil">Benutzer</a>
                </li>
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item dropdown">
                        <a id="navbarDropdown" class="nav-link dropdown-toggle" href="#" role="button"
                            data-toggle="dropdown" OnClick="$y('#navBarDropDown').toggle();" aria-haspopup="true"
                            aria-expanded="false" v-pre>
                            Fun Section <span class="caret2"></span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="/didyouknow">
                                DidYouKnow
                            </a>
                            <a class="dropdown-item" href="/shortpoems">
                                Shortpoems
                            </a>
                        </div>
                </ul>
                <li class="nav-item">
                    <a class="nav-link" href="/privacy">Datenschutz</a>
                </li>
                <li class='nav-item'>
                    <button id='darkModeToggle' class='nav-link ohov'><i
                            class='fas fa-moon-{{ $dm }}'></i></button>
                </li>
            </ul>

            <ul class="navbar-nav ms-auto">

            </ul>
        </div>
    </div>


    </div>

</nav>
