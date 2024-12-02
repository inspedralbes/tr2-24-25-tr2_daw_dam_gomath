<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;

class OperacionsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $jsonPath = resource_path('json/operacions.json');

        $jsonData = File::get($jsonPath);
        $operacions = json_decode($jsonData, true);

        foreach ($operacions as $operacion) {
            DB::table('operacions')->insert([
                'id' => $operacion['id'],
                'problem_json' => json_encode($operacion['problem_json']),
                'nivel_dificultad' => $operacion['nivel_dificultad'],
                'tipo_operacion' => $operacion['tipo_operacion'],
            ]);
        }
    }
}
