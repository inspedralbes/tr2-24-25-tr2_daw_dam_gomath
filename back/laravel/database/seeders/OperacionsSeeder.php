<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Hash;

class OperacionsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $jsonData = File::get(database_path('seeders/data/operacions.json'));
        $operacions = json_decode($jsonData, true);

        foreach ($operacions as $operacion) {
            DB::table('operacions')->insert([
                'id' => $operacion['id'],
                'problem_json' => $operacion['problem_json'],
                'nivel_dificultad' => $operacion['nivel_dificultad'],
                'tipo_operacion' => $operacion['tipo_operacion'],
            ]);
        }
    }
}
