<?php

use Illuminate\Database\Seeder;

class UserTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('users')->insert([
            'name' => 'Fikri Purqon Azis',
            'email' => 'Fikri@email.com',
            'password' => bcrypt('admin'),
            'created_at' => time(),
            'updated_at' => time(),
        ]);
    }
}
