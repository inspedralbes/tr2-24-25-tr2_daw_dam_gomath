<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File; // Importamos la clase File para leer el archivo
use Illuminate\Support\Facades\Storage; // Opcional si necesitas usar Storage

class CodisJocSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $json = File::get(database_path('seeders/data/codis.json')); 

        $data = json_decode($json, true);

        foreach ($data as $item) {
            DB::table('joc_codis')->insert([
                'id' => $item['id'],
                'codi_json' => json_encode($item['codi_json']),
                'nivel_dificultad' => $item['nivel_dificultad'],
            ]);
        }
    }
}
