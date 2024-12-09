<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Crear Clase</title>
    <link rel="stylesheet" href="{{ asset('css/style.css') }}">

</head>
<body>

<h1>Crear Nueva Clase</h1>

<form action="{{ route('clases.store') }}" method="POST">
    @csrf
    <label for="nombre_clase">Nombre de la Clase:</label>
    <input type="text" name="nombre_clase" id="nombre_clase" required>
    <button type="submit">Crear Clase</button>
</form>

<a href="{{ route('clases.index') }}" class="back-button">Volver al índice</a>

</body>
</html>
