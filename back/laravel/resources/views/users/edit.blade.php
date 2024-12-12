@extends('app')

@section('content')
<div class="container mt-4">
    <h1>Editar Usuario</h1>
    <form action="{{ route('users.update', $user->id) }}" method="POST">
        @csrf
        @method('PUT')
        <div class="mb-3">
            <label for="name" class="form-label">Nombre</label>
            <input type="text" name="name" id="name" class="form-control" value="{{ $user->name }}" required>
        </div>
        <div class="mb-3">
            <label for="email" class="form-label">Correo</label>
            <input type="email" name="email" id="email" class="form-control" value="{{ $user->email }}" required>
        </div>
        <div class="mb-3">
            <label for="rol" class="form-label">Rol</label>
            <select name="rol" id="rol" class="form-select" required>
                <option value="student" {{ $user->rol == 'student' ? 'selected' : '' }}>Estudiante</option>
                <option value="professor" {{ $user->rol == 'professor' ? 'selected' : '' }}>Profesor</option>
            </select>
        </div>
        <button type="submit" class="btn btn-warning">Actualizar</button>
    </form>
</div>
@endsection
