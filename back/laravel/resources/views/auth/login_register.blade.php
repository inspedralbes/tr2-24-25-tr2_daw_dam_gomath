@extends('app')

@section('content')
<div class="container mt-5">
    <div class="row justify-content-center">
        <!-- Formulari Login -->
        <div class="col-md-5" id="loginForm">
            <div class="card shadow-lg border-0">
                <div class="card-body">
                    <h2 class="text-center text-primary fw-bold mb-4">Iniciar Sessió</h2>
                    @if ($errors->any())
                        <div class="alert alert-danger w-100">
                            <ul class="mb-0">
                                @foreach ($errors->all() as $error)
                                    <li>{{ $error }}</li>
                                @endforeach
                            </ul>
                        </div>
                    @endif

                    <form method="POST" action="{{ route('login') }}">
                        @csrf
                        <div class="mb-3">
                            <label for="email" class="form-label text-secondary">Correu Electrònic</label>
                            <input type="email" class="form-control rounded-pill shadow-sm" id="email" name="email" required>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label text-secondary">Contrasenya</label>
                            <input type="password" class="form-control rounded-pill shadow-sm" id="password" name="password" required>
                        </div>
                        <button type="submit" class="btn btn-primary w-100 rounded-pill fw-bold">Iniciar Sessió</button>
                    </form>

                    <div class="d-flex align-items-center justify-content-center pb-4 mt-3">
                        <p class="mb-0 me-2 text-secondary">No tens un compte?</p>
                        <button class="btn btn-outline-primary rounded-pill" onclick="toggleForms()">Crear nova</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Formulari Registre -->
        <div class="col-md-5 ms-4" id="registerForm" style="display: none;">
            <div class="card shadow-lg border-0">
                <div class="card-body">
                    <h2 class="text-center text-primary fw-bold mb-4">Registrar-se</h2>
                    <form method="POST" action="{{ route('register') }}">
                        @csrf
                        <div class="mb-3">
                            <label for="username" class="form-label text-secondary">Nom d'Usuari</label>
                            <input type="text" class="form-control rounded-pill shadow-sm" id="username" name="username" required>
                        </div>
                        <div class="mb-3">
                            <label for="register-email" class="form-label text-secondary">Correu Electrònic</label>
                            <input type="email" class="form-control rounded-pill shadow-sm" id="register-email" name="email" required>
                        </div>
                        <div class="mb-3">
                            <label for="register-password" class="form-label text-secondary">Contrasenya</label>
                            <input type="password" class="form-control rounded-pill shadow-sm" id="register-password" name="password" required>
                        </div>
                        <button type="submit" class="btn btn-primary w-100 rounded-pill fw-bold">Registrar-se</button>
                    </form>

                    <div class="d-flex align-items-center justify-content-center pb-4 mt-3">
                        <p class="mb-0 me-2 text-secondary">Ja tens un compte?</p>
                        <button class="btn btn-outline-primary rounded-pill" onclick="toggleForms()">Iniciar Sessió</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@section('page-script')
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

@endsection
