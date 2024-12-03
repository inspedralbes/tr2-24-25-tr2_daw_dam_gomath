<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run()
    {
        $json = File::get(database_path('seeders/data/users.json'));
        $users = json_decode($json, true);

        foreach ($users as $user) {
            DB::table('users')->insert([
                'id' => $user['id'],
                'name' => $user['name'],
                'email' => $user['email'],
                'password' => Hash::make($user['password']),
                'rol' => $user['rol'],
                'clase_id' => $user['clase_id'],
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
    }
}
