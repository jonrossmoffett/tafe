<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Enquiry;
use App\User;
use Faker\Generator as Faker;
use Illuminate\Support\Str;

$factory->define(Enquiry::class, function (Faker $faker) {
    return [
        'user_id' => factory(User::class),
        'unique_id' => (string) Str::uuid(),
        'title' => $faker->sentence,
        'name' => $faker->name,
        'type' => $faker->randomElement([1,2,3,4]),
        'email' => $faker->email,
        'phone' => $faker->phoneNumber,
        'description' => $faker->paragraph,
        'status' => 1,
        'is_solved' => $faker->randomElement([0,1]),
    ];
});


