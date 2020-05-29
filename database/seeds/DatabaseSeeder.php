<?php

use App\Enquiry;
use App\RoleUser;
use App\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        $this->call([
            UserSeeder::class,
            RoleSeeder::class,
            RoleUserSeeder::class,
            EnquiryTypeSeeder::class,
        ]);

        $users = factory(User::class, 3)->create();

        DB::table('enquiries')->truncate();

        $users->each(function ($user) {

            factory(RoleUser::class)->create([
                'user_id' => $user->id,
            ]);

            factory(Enquiry::class, 7)->create([
                'user_id' => $user->id,
                'name' => $user->name,
            ]);
        });


    }
}
