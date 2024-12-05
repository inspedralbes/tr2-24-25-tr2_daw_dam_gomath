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

    <h1>Llista de Comandes</h1>
    <table id="productsTable">
        <thead>
            <tr>
                <th>ID</th>
                <th>Pregunta</th>
                <th>Resposta</th>
                <th>Dificultad</th>
                <th>Operacion</th>
                <th>Accions</th> <!-- Añadido para el botón de editar -->
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