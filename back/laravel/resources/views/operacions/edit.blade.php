@extends('app')

@section('page-style')
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Roboto', 'Open Sans', sans-serif;
        }

        h1 {
            color: #343a40;
            font-weight: 600;
            margin-bottom: 20px;
        }

        form {
            background: #ffffff;
            border: 1px solid #dee2e6;
            border-radius: 8px;
            padding: 20px;
            max-width: 600px;
            margin: 0 auto;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            font-weight: 600;
            margin-bottom: 5px;
            color: #495057;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ced4da;
            border-radius: 5px;
            box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1);
        }

        input[type="radio"] {
            margin-right: 5px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-check {
            margin-bottom: 10px;
        }

        .form-check-label {
            margin-left: 5px;
        }

        button[type="submit"] {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button[type="submit"]:hover {
            background-color: #0056b3;
        }

        .container {
            margin-top: 50px;
        }
    </style>
@endsection

@section('content')
<div class="container">
    <h1 class="text-center">Editar Operación</h1>

    <form action="{{ route('operacions.update', $operacion->id) }}" method="POST">
        @csrf
        @method('PUT')

        <!-- Pregunta -->
        <div class="form-group">
            <label for="question">Pregunta</label>
            <input type="text" class="form-control" id="question" name="problem_json[question]" value="{{ $operacion->decoded_problem['question'] }}" required>
        </div><br>

        <!-- Respuestas -->
        <div class="mb-3">
            <label for="answers" class="form-label">Respuestas:</label>
            <div id="answers">
                @foreach ($operacion->decoded_problem['answers'] as $index => $answer)
                <div class="d-flex align-items-center mb-2">
                    <input type="text" class="form-control me-2" name="problem_json[answers][{{ $index }}][value]" value="{{ $answer['value'] }}" required>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="correct_answer" value="{{ $index }}" {{ $answer['is_correct'] ? 'checked' : '' }}>
                        <label class="form-check-label">Correcta</label>
                    </div>
                </div>
                @endforeach
            </div>
        </div>

        <!-- Dificultad -->
        <br><div class="form-group">
            <label for="nivel_dificultad">Dificultad</label>
            <input type="text" class="form-control" id="nivel_dificultad" name="nivel_dificultad" value="{{ $operacion->nivel_dificultad }}" required>
        </div>

        <!-- Tipo de operación -->
        <br><div class="form-group">
            <label for="tipo_operacion">Tipo de Operación</label>
            <input type="text" class="form-control" id="tipo_operacion" name="tipo_operacion" value="{{ $operacion->tipo_operacion }}" required>
        </div><br>

        <button type="submit" class="btn btn-primary w-100">Guardar Cambios</button><br><br>
        <a href="{{ route('operacions.index') }}" class="btn btn-danger w-100 text-white">Cancelar</a>
        </form>
</div>
@endsection
