@extends('app')

@section('content')
<div class="container d-flex align-items-center justify-content-center" style="height: 80vh; margin-top:20px;">
    <div class="text-center p-5 rounded-3 shadow-lg" style="background-color: #f7f9fc; max-width: 600px;">
        <h1 class="display-6 fw-bold" style="color: #2d9bf7;">Benvingut al Panell de Control de GoMath, {{ Auth::user()->name }}!</h1>
        <p class="lead mt-3" style="color: #555;">Afegir frase eslogan</p>
        
        <div class="d-grid gap-2 mt-4">
            <a href="{{ route('clases.index') }}" class="btn btn-primary btn-lg" style="background-color: #16cfe5; border-color: #16cfe5;">
                Panell de Operacions
            </a>
            <a href="{{ route('clases.index') }}" class="btn btn-primary btn-lg" style="background-color: #16cfe5; border-color: #16cfe5;">
                Panell de Classes
            </a>
            <a href="{{ route('clases.index') }}" class="btn btn-primary btn-lg" style="background-color: #16cfe5; border-color: #16cfe5;">
                Panell de Usuaris
            </a>
            <a href="{{ route('clases.index') }}" class="btn btn-primary btn-lg" style="background-color: #16cfe5; border-color: #16cfe5;">
                Panell de Puntuacions
            </a>
        </div>
    </div>
</div>
@endsection
