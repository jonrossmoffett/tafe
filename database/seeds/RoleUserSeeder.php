<?php

use Illuminate\Database\Seeder;

class RoleUserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::statement("SET foreign_key_checks=0");
        DB::table('role_user')->truncate();
        DB::statement("SET foreign_key_checks=1");

        DB::table('role_user')->insert([
            [
                "role_id" => "1",
                "user_id" => "2",
            ],
            [
                "role_id" => "2",
                "user_id" => "1",
            ],
            [
                "role_id" => "2",
                "user_id" => "3",
            ],
        ]);
    }
}
