<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {

        DB::statement("SET foreign_key_checks=0");
        DB::table('users')->truncate();
        DB::statement("SET foreign_key_checks=1");

        DB::table('users')->insert([
            [
                "id" => "1",
                'name' => 'Jon-Ross',
                'email' => 'jrmoffett1@gmail.com',
                'email_verified_at' => now(),
                'password' => '$2y$10$BTqWzQmKXLGiy.F7kqtZ.eqTrSgOOdMOuFgHu.Ts/eITsXaaz6eZu',
                'remember_token' => 'ied3S3C3BLkREIaUyfHwJYzbvmbm7aqENXprOo4EQks4tTbL4ys8yhlSjwqW',
                'api_token' => 'gUbbGDFTYNlR8ziJpYffouCRjfvRxvDB',
                "created_at" => now(),
                "updated_at" => now(),
            ],
            [
                "id" => "2",
                'name' => 'user',
                'email' => 'user@gmail.com',
                'email_verified_at' => now(),
                'password' => '$2y$10$q0FR30F3tc4eUXUKK/.WZuTAqXy04UTjcgghdbX.wjYeBvazogDBe',
                'remember_token' => null,
                'api_token' => 'Js3lrgy2oswVXHgHdamq70aaYv3IUxLP',
                "created_at" => now(),
                "updated_at" => now(),
            ],
            [
                "id" => "3",
                'name' => 'Nia Doyle',
                'email' => 'admin@streamview.com',
                'email_verified_at' => now(),
                'password' => '$2y$10$q0FR30F3tc4eUXUKK/.WZuTAqXy04UTjcgghdbX.wjYeBvazogDBe',
                'remember_token' => 'HCuKZJ8Eq4WLsNj6Y3MlcINFQTI0LOvWyr76irt9LtI57IS68nlzM0rzkqni',
                'api_token' => 'Q2BW5ls44oUMoHXl8tQ9y09jMQl27fhG',
                "created_at" => now(),
                "updated_at" => now(),
            ],

        ]);
    }
}
