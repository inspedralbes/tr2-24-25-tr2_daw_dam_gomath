@extends('app')

@section('content')
<div class="container mt-4">
    <h1>Lista de Usuarios</h1>
    <a href="{{ route('users.create') }}" class="btn btn-primary mb-3">Crear Usuario</a>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Email</th>
                <th>Rol</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            @foreach($user as $user2)
            <tr>
                <td>{{ $user2->id }}</td>
                <td>{{ $user2->name }}</td>
                <td>{{ $user2->email }}</td>
                <td>{{ $user2->rol }}</td>
                <td>
                    <a href="{{ route('users.edit', $user2->id) }}" class="btn btn-warning btn-sm">Editar</a>
                    <form action="{{ route('users.destroy', $user2->id) }}" method="POST" style="display: inline-block;">
                        @csrf
                        @method('DELETE')
                        <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('¿Estás seguro?')">Eliminar</button>
                    </form>
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>
</div>
@endsection
