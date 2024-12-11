<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Adminer</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" 
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    
    @yield('page-style')
    
    <style>
        body {
            margin: 0;
            padding: 0;
        }

        .navbar {
            position: sticky;
            z-index: 1000;
            top: 0;
            background: linear-gradient(to right, #1976d2, #42a5f5);
        }

        .navbar .nav-link, .navbar .navbar-brand {
            color: white !important;
        }

        .navbar .nav-link:hover, .navbar .navbar-brand:hover {
            color: white;
            opacity: 0.6;
        }

        a {
            text-decoration: none;
        }
    </style>
</head>

<body>
    @if(Auth::check())
        <!-- Navbar: Mostrar solo si el usuario está autenticado -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <a class="navbar-brand d-flex align-items-center" href="{{ route('welcome') }}">
                    Panell d'Administració
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link {{ str_contains(Route::current()->getName(), 'operacions') ? 'active' : '' }}"
                                href="{{ route('operacions.index') }}">CRUD operacions</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link {{ str_contains(Route::current()->getName(), 'clases') ? 'active' : '' }}"
                                href="{{ route('clases.index') }}">CRUD Clases</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link {{ str_contains(Route::current()->getName(), 'users') ? 'active' : '' }}"
                                href="{{ route('clases.index') }}">CRUD Users</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link {{ str_contains(Route::current()->getName(), 'puntuacuions') ? 'active' : '' }}"
                                href="{{ route('clases.index') }}">CRUD Puntuacions</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="{{ route('logout') }}" onclick="event.preventDefault(); document.getElementById('logout-form').submit();">Tancar Sessió</a>
                            <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                @csrf
                            </form>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    @endif

    @yield('content')

    @yield('page-script')
    <script>
            function toggleForms() {
                var loginForm = document.getElementById('loginForm');
                var registerForm = document.getElementById('registerForm');

                if (loginForm.style.display === "none") {
                    loginForm.style.display = "block";
                    registerForm.style.display = "none";
                } else {
                    loginForm.style.display = "none";
                    registerForm.style.display = "block";
                }
            }
    </script>
</body>

</html>

