<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Clase</title>
    <link rel="stylesheet" href="{{ asset('css/style.css') }}">

</head>
<body>

<h1>Editar Clase</h1>

<form action="{{ route('clases.update', $clase->id) }}" method="POST">
    @csrf
    @method('PUT')
    <label for="nombre_clase">Nombre de la Clase:</label>
    <input type="text" name="nombre_clase" id="nombre_clase" value="{{ $clase->nombre_clase }}" required>
    <button type="submit">Actualizar Clase</button>
</form>
<a href="{{ route('clases.index') }}" class="back-button">Volver al índice</a>
</body>
</html>
