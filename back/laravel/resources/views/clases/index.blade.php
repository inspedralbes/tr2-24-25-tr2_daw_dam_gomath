@extends('app')

@section('page-style')
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: 'Arial', sans-serif;
        background-color: #f8f9fa;
        color: #333;
        line-height: 1.6;
        padding: 20px;
    }

    h1 {
        color: #343a40;
        text-align: center;
        margin-bottom: 20px;
        font-weight: 600;
    }

    a {
        display: inline-block;
        padding: 10px 20px;
        border-radius: 5px;
        text-decoration: none;
        font-size: 16px;
        margin-bottom: 20px;
        transition: background-color 0.3s;
    }

    a:hover {
        opacity: 0.8;
    }

    form {
        display: flex;
        justify-content: center;
        margin-bottom: 20px;
    }

    .input-group {
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .input-group input {
        padding: 12px;
        font-size: 18px;
        border: 1px solid #ddd;
        border-radius: 5px;
        width: 1000px; 
    }

    .input-group button {
        padding: 12px 20px;
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        margin-left: 10px;
    }

    .input-group button:hover {
        background-color: #0056b3;
    }

    table {
        width: 100%;
        margin-top: 20px;
        border-collapse: collapse;
        background-color: #fff;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
        overflow: hidden;
    }

    th, td {
        padding: 12px;
        text-align: center;
        border: 1px solid #ddd;
    }

    th {
        background-color: #007bff;
        color: #fff;
    }

    tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    /* Botón eliminar */
    button {
        background-color: #dc3545;
        color: #fff;
        border: none;
        padding: 5px 10px;
        border-radius: 5px;
        cursor: pointer;
        font-size: 14px;
        transition: background-color 0.3s;
    }

    button:hover {
        background-color: #c82333;
    }

    .btn-edit:hover {
        background-color: #218838; 
    }

    .flash-message {
        padding: 15px;
        margin-bottom: 20px;
        border-radius: 5px;
        text-align: center;
        font-size: 16px;
    }

    .flash-message.success {
        background-color: #28a745;
        color: #fff;
    }

    .flash-message.error {
        background-color: #dc3545;
        color: #fff;
    }

    .button-group {
        display: flex;
        justify-content: center;
        gap: 10px;
    }

    .button-group form {
        display: inline;
    }
</style>
@endsection

@section('content')
<div class="container">
    <h1>Clases</h1>

    <form method="GET" action="{{ route('clases.index') }}">
        <div class="input-group mb-3">
            <input type="text" name="query" class="form-control" placeholder="Nom de la classe" value="{{ request()->input('query') }}">
            <button class="btn btn-outline-secondary" type="submit">Buscar</button>
        </div>
    </form>

    <a href="{{ route('clases.create') }}">Crear Nova Classe</a>

    <table>
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
                        <div class="button-group">
                            <a href="{{ route('clases.edit', $clase->id) }}" class="btn btn-primary btn-sm">Editar</a>
                            <form action="{{ route('clases.destroy', $clase->id) }}" method="POST">
                                @csrf
                                @method('DELETE')
                                <button type="submit" onclick="return confirm('¿Estás seguro de que deseas eliminar esta clase?')" class="btn btn-danger btn-sm">
                                    Eliminar
                                </button>
                            </form>
                        </div>
                    </td>
                </tr>
            @endforeach
        </tbody>
    </table>
</div>
@endsection
