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
                <th>Problema</th>
                <th>Dificutlad</th>
                <th>Operacion</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($operaciones as $operacion)
                <tr>
                    <td>{{ $operacion->id }}</td>
                    <td>{{ $operacion->problem_json }}</td>
                    <td>{{ $operacion->nivel_dificultad }}</td>
                    <td>{{ $operacion->tipo_operacion }}</td>
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
