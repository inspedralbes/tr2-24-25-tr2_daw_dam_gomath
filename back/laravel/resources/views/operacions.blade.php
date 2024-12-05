@extends('app')

@section('content')
<!DOCTYPE html>
<html lang="ca">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Productes</title>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.5/css/jquery.dataTables.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.5/js/jquery.dataTables.min.js"></script>
</head>

<body>
    <h2>Agregar un nou problema</h2>

    <!-- Formulario de creación -->
    <form action="{{ route('operacions.store') }}" method="POST">
        @csrf
        <div>
            <label for="question">Pregunta:</label>
            <input type="text" id="question" name="question" required>
        </div>
        
        <div>
            <label for="answers">Respostes:</label>
            <div>
                <input type="text" id="answer_1" name="answers[0][value]" required>
                <input type="radio" name="answers[0][is_correct]" value="true"> Correcta
            </div>
            <div>
                <input type="text" id="answer_2" name="answers[1][value]" required>
                <input type="radio" name="answers[1][is_correct]" value="true"> Correcta
            </div>
            <div>
                <input type="text" id="answer_3" name="answers[2][value]" required>
                <input type="radio" name="answers[2][is_correct]" value="true"> Correcta
            </div>
            <div>
                <input type="text" id="answer_4" name="answers[3][value]" required>
                <input type="radio" name="answers[3][is_correct]" value="true"> Correcta
            </div>
        </div>

        <div>
            <label for="difficulty">Dificultat:</label>
            <select name="difficulty" id="difficulty">
                <option value="easy">Fácil</option>
                <option value="medium">Medi</option>
                <option value="hard">Difícil</option>
            </select>
        </div>

        <div>
            <label for="operation_type">Tipus d'operació:</label>
            <select name="operation_type" id="operation_type">
                <option value="addition">Sumación</option>
                <option value="subtraction">Restación</option>
                <option value="multiplication">Multiplicación</option>
                <option value="division">División</option>
            </select>
        </div>

        <button type="submit">Afegir problema</button>
    </form>

    <h2>Llista de Comandes</h2>
    <table id="productsTable">
        <thead>
            <tr>
                <th>ID</th>
                <th>Pregunta</th>
                <th>Resposta</th>
                <th>Dificultat</th>
                <th>Operació</th>
                <th>Accions</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($operaciones as $operacion)
            <tr>
                <td>{{ $operacion->id }}</td>
                <td>{{ $operacion->decoded_problem->question ?? 'N/A' }}</td>
                <td>
                    @php
                    $respuesta = $operacion->decoded_problem->answers ?? 'N/A';
                    if (is_array($respuesta)) {
                        $respuesta = implode(', ', array_map(function ($item) {
                            return $item->value ?? 'N/A';
                        }, $respuesta));
                    }
                    @endphp
                    {{ $respuesta }}
                </td>
                <td>{{ $operacion->nivel_dificultad }}</td>
                <td>{{ $operacion->tipo_operacion }}</td>
                <td>
                    <!-- Botón de editar -->
                    <a href="{{ route('operacions.edit', $operacion->id) }}" class="btn btn-primary">Editar</a>

                    <!-- Formulario para eliminar -->
                    <form action="{{ route('operacions.destroy', $operacion->id) }}" method="POST"
                        style="display:inline;">
                        @csrf
                        @method('DELETE')
                        <button type="submit"
                            onclick="return confirm('¿Estás seguro de que deseas eliminar esta operación?')"
                            class="btn btn-danger">Eliminar</button>
                    </form>
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>

    <script>
        $(document).ready(function () {
            $('#productsTable').DataTable();
        });
    </script>
</body>

</html>
@endsection
