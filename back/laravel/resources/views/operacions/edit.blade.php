@extends('app')

@section('content')
<h1>Editar Operación</h1>

<form action="{{ route('operacions.update', $operacion->id) }}" method="POST">
    @csrf
    @method('PUT')

    <!-- Pregunta -->
    <div>
        <label for="question">Pregunta</label>
        <input type="text" id="question" name="problem_json[question]" value="{{ $operacion->decoded_problem['question'] }}" required>
    </div>

    <!-- Respuestas -->
    <div>
        <label>Respuestas:</label>
        <div id="answers">
            @foreach ($operacion->decoded_problem['answers'] as $index => $answer)
                <div>
                    <input type="text" name="problem_json[answers][{{ $index }}][value]" value="{{ $answer['value'] }}" required>
                    <label>
                        <input type="radio" name="correct_answer" value="{{ $index }}" {{ $answer['is_correct'] ? 'checked' : '' }}>
                        Correcta
                    </label>
                </div>
            @endforeach
        </div>
    </div>

    <!-- Dificultad -->
    <div>
        <label for="nivel_dificultad">Dificultad</label>
        <input type="text" id="nivel_dificultad" name="nivel_dificultad" value="{{ $operacion->nivel_dificultad }}" required>
    </div>

    <!-- Tipo de operación -->
    <div>
        <label for="tipo_operacion">Tipo de Operación</label>
        <input type="text" id="tipo_operacion" name="tipo_operacion" value="{{ $operacion->tipo_operacion }}" required>
    </div>

    <button type="submit">Guardar Cambios</button>
</form>
@endsection
