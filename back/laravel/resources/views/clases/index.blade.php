@extends('app')

@section('content')
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Listado de Clases</title>
    <link rel="stylesheet" href="{{ asset('css/style.css') }}">
</head>
<body>

<h1>Clases</h1>



<form method="GET" action="{{ route('clases.index') }}">
            <div class="input-group mb-3">
                <input type="text" name="query" class="form-control" placeholder="Nom de la classe" value="{{ request()->input('query') }}">
                <button class="btn btn-outline-secondary" type="submit">Buscar</button>
            </div>
</form>

<a href="{{ route('clases.create') }}">Crear Nova Classe</a>

<table border="1">
    <thead>
        <tr>
            <th>ID</th>
            <th>Nom de la Clase</th>
            <th>Accions</th>
        </tr>
    </thead>
    <tbody>
        @foreach ($clases as $clase)
            <tr>
                <td>{{ $clase->id }}</td>
                <td>{{ $clase->nombre_clase }}</td>
                <td>
                    <a href="{{ route('clases.edit', $clase->id) }}">Editar</a>
                    <form action="{{ route('clases.destroy', $clase->id) }}" method="POST" style="display:inline;">
                        @csrf
                        @method('DELETE')
                        <button type="submit">Eliminar</button>
                    </form>
                </td>
            </tr>
        @endforeach
    </tbody>
</table>

</body>
</html>
@endsection('content')
