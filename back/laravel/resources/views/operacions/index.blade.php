@extends('app')

@section('page-style')
<style>
    body {
        background-color: #f8f9fa;
        font-family: 'Roboto', 'Open Sans', sans-serif;
    }

    h2 {
        color: #343a40;
        font-weight: 600;
        margin-bottom: 20px;
    }

    label {
        font-weight: 600;
        margin-bottom: 5px;
    }

    input[type="text"], select {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #ced4da;
        border-radius: 5px;
    }

    .btn-primary, .btn-danger {
        font-weight: 600;
    }

    table {
        background: #ffffff;
        border-radius: 8px;
        overflow: hidden;
        margin: 20px auto;
    }

    th {
        background: #007bff;
        color: white;
        padding: 10px;
        text-align: left;
    }

    td {
        padding: 10px;
        vertical-align: middle;
    }

    #searchInput {
        margin: 20px auto;
        display: block;
        width: 80%;
        padding: 10px;
        border: 1px solid #ced4da;
        border-radius: 5px;
    }
</style>
@endsection

@section('content')
<div class="container">
    <h2 class="text-center">Agregar un Nou Problema</h2>

    <form action="{{ route('operacions.store') }}" method="POST">
        @csrf
        <div class="mb-3">
            <label for="question" class="form-label">Pregunta:</label>
            <input type="text" class="form-control" id="question" name="question" required>
        </div>
        <div class="mb-3">
            <label for="answers" class="form-label">Respuestas:</label>
            <div id="answers">
                @for ($i = 0; $i < 4; $i++)
                <div class="d-flex align-items-center mb-2">
                    <input type="text" class="form-control me-2" name="answers[{{ $i }}][value]" required>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="correct_answer" value="{{ $i }}" id="correct_{{ $i }}">
                        <label class="form-check-label" for="correct_{{ $i }}">Correcta</label>
                    </div>
                </div>
                @endfor
            </div>
        </div>
        <div class="mb-3">
            <label for="difficulty" class="form-label">Dificultad:</label>
            <select name="difficulty" id="difficulty" class="form-select">
                <option value="fácil">Fácil</option>
                <option value="intermedio">Medi</option>
                <option value="difícil">Difícil</option>
            </select>
        </div>
        <div class="mb-3">
            <label for="operation_type" class="form-label">Tipo de Operación:</label>
            <select name="operation_type" id="operation_type" class="form-select">
                <option value="suma">Suma</option>
                <option value="resta">Resta</option>
                <option value="multiplicación">Multiplicación</option>
                <option value="division">División</option>
            </select>
        </div>
        <button type="submit" class="btn btn-primary w-100">Agregar Problema</button>
    </form>

    <h2 class="text-center mt-5">Llista de Comandes</h2>

    <input type="text" id="searchInput" placeholder="Buscar operació..." onkeyup="filterTable()"><br><br>

    <table id="productsTable" class="table table-striped table-bordered">
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
                    <a href="{{ route('operacions.edit', $operacion->id) }}" class="btn btn-primary btn-sm">Editar</a>
                    <form action="{{ route('operacions.destroy', $operacion->id) }}" method="POST" style="display:inline;">
                        @csrf
                        @method('DELETE')
                        <button type="submit" onclick="return confirm('¿Estás seguro de que deseas eliminar esta operación?')" class="btn btn-danger btn-sm">Eliminar</button>
                    </form>
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>
</div>

<script>
    function filterTable() {
        const searchInput = document.getElementById("searchInput").value.toLowerCase();
        const table = document.getElementById("productsTable");
        const rows = table.getElementsByTagName("tr");

        for (let i = 1; i < rows.length; i++) {
            const cells = rows[i].getElementsByTagName("td");
            let match = false;
            for (let j = 0; j < cells.length; j++) {
                if (cells[j].textContent.toLowerCase().includes(searchInput)) {
                    match = true;
                    break;
                }
            }
            rows[i].style.display = match ? "" : "none";
        }
    }
</script>
@endsection
