<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class RoleSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::statement("SET foreign_key_checks=0");
        DB::table('roles')->truncate();
        DB::statement("SET foreign_key_checks=1");

        DB::table('roles')->insert([
            [
                "id" => "1",
                "name" => "user",
                "created_at" => now(),
                "updated_at" => now(),
            ],
            [
                "id" => "2",
                "name" => "admin",
                "created_at" => now(),
                "updated_at" => now(),
            ],
        ]);
    }
}
