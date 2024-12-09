<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Operacion;
class OperacionController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function operacionsFiltro(Request $request)
{
    $operacion = $request->input('operacion');
    $modo = $request->input('modo');
    $cantidad = $request->input('cantidad');

    if (!$operacion || !in_array($operacion, ['suma', 'resta', 'multiplicacion', 'division'])) {
        return response()->json(['error' => 'Operación no válida o no especificada'], 400);
    }
    $operaciones = Operacion::where('tipo_operacion', $operacion)->inRandomOrder()->get();

    return response()->json([
        'filtro_aplicado' => $operacion,
        'operaciones_filtradas' => $operaciones,
    ]);
}

    public function index()
    {
        $operaciones = Operacion::all();

        if (request()->is('api/*')) {
            return response()->json($operaciones);
        }
        foreach ($operaciones as $operacion) {
            $operacion->decoded_problem = json_decode($operacion->problem_json);
        }

        return view('operacions', compact('operaciones'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {

    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        // Valida la entrada
        $request->validate([
            'question' => 'required|string',
            'answers' => 'required|array',
            'difficulty' => 'required|string|in:easy,medium,hard',
            'operation_type' => 'required|string|in:addition,subtraction,multiplication,division',
        ]);

        // Crear el objeto de la pregunta en formato JSON
        $problem_json = [
            'question' => $request->question,
            'answers' => array_map(function ($answer, $index) use ($request) {
                return [
                    'value' => $answer['value'],
                    'is_correct' => $request->has("answers.$index.is_correct") && $request->input("answers.$index.is_correct") === 'true',
                ];
            }, $request->input('answers', []), array_keys($request->input('answers'))),
        ];

        // Guardar la operación
        Operacion::create([
            'problem_json' => json_encode($problem_json),  // Almacenamos el JSON en la base de datos
            'nivel_dificultad' => $request->difficulty,
            'tipo_operacion' => $request->operation_type,
        ]);

        return redirect()->route('operacions.index')->with('success', 'Problema agregado correctamente.');
    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit($id)
    {
        $operacion = Operacion::findOrFail($id);

        // Decodificar el problem_json como un array
        $operacion->decoded_problem = json_decode($operacion->problem_json, true);

        return view('operacions.edit', compact('operacion'));
    }


    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        $data = $request->validate([
            'problem_json' => 'required|array',
            'problem_json.question' => 'required|string',
            'problem_json.answers' => 'required|array',
            'nivel_dificultad' => 'required|string',
            'tipo_operacion' => 'required|string',
        ]);

        // Encontrar la operación que se va a actualizar
        $operacion = Operacion::find($id);
        if (!$operacion) {
            return response()->json(['error' => 'Operación no encontrada'], 404);
        }

        // Decodificar el JSON como un array
        $problem = json_decode($operacion->problem_json, true);

        // Recibir las respuestas y marcar la correcta
        $answers = [];
        foreach ($request->input('problem_json.answers') as $index => $answer) {
            $answers[] = [
                'value' => $answer['value'],
                'is_correct' => ($index == $request->input('correct_answer'))  // Marcar la respuesta correcta
            ];
        }

        // Actualizar los datos
        $problem['question'] = $request->input('problem_json.question');
        $problem['answers'] = $answers;

        // Guardar el nuevo JSON
        $operacion->problem_json = json_encode($problem);
        $operacion->nivel_dificultad = $data['nivel_dificultad'];
        $operacion->tipo_operacion = $data['tipo_operacion'];
        $operacion->save();

        // Si es una API, devolver mensaje JSON
        if (request()->is('api/*')) {
            return response()->json(['message' => 'Operación actualizada correctamente']);
        }

        // Si es una vista, redirigir con mensaje de éxito
        return redirect()->route('operacions')->with('success', 'Operación actualizada correctamente');
    }



    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        $operacion = Operacion::find($id);
        if (!$operacion) {
            return response()->json(['error' => 'Operacion no encontrada'], 404);
        }
        $operacion->delete();
        if (request()->is('api/*')) {
            return response()->json(['message' => 'Operacion borrada correctamente']);
        }
        return redirect()->route('operacions')->with('success', 'Operación eliminada correctamente.');
    }
}
