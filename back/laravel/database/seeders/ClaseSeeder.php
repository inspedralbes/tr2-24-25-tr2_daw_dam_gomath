<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Hash;

class ClaseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run()
    {
        $json = File::get(database_path('seeders/data/clases.json'));
        $clases = json_decode($json, true);

        foreach ($clases as $clase) {
            DB::table('clases')->insert([
                'id' => $clase['id'],
                'nombre_clase' => $clase['nombre_clase'],
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
    }
}
