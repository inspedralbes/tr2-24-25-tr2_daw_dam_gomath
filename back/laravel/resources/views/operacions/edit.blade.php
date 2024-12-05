HAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA!!!
@extends('app')

@section('content')
<!DOCTYPE html>
<html lang="ca">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Operación</title>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.5/css/jquery.dataTables.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.5/js/jquery.dataTables.min.js"></script>
</head>
<body>

<h1>Editar Operación</h1>

<!-- Formulario de edición -->
<form action="{{ route('operacions.update', $operacion->id) }}" method="POST">
    @csrf
    @method('PUT')
    
    <div>
        <label for="question">Pregunta</label>
        <input type="text" id="question" name="question" value="{{ $operacion->decoded_problem->question ?? '' }}" required>
    </div>

    <div>
        <label for="answers">Respuestas</label>
        <input type="value" id="answers" name="answers" value="{{ implode(', ', array_map(function ($item) { return $item->value ?? 'N/A'; }, $operacion->decoded_problem->answers ?? [])) }}" required>
    </div>

    <div>
        <label for="difficulty">Dificultad</label>
        <input type="text" id="difficulty" name="difficulty" value="{{ $operacion->nivel_dificultad }}" required>
    </div>

    <div>
        <label for="operation_type">Tipo de Operación</label>
        <input type="text" id="operation_type" name="operation_type" value="{{ $operacion->tipo_operacion }}" required>
    </div>

    <button type="submit">Guardar Cambios</button>
</form>

</body>
</html>
@endsection
