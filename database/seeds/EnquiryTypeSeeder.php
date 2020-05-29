<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class EnquiryTypeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('enquiry_types')->truncate();


        DB::table('enquiry_types')->insert([
            ["name" => "Product Enquiry"],
            ["name" => "Livestock Enquiry"],
            ["name" => "Warranty"],
            ["name" => "Others"],
        ]);
    }
}
