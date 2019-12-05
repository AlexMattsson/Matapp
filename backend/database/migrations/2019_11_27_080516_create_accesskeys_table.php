<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAccesskeysTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('accesskeys', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('access_key', 64);
            $table->timestamps();
        });
        DB::table('accesskeys')->insert([
            'access_key' => 'OXZHmKDD1lpdW2A89BtT81ZirL1OFZDeLYChPm1YjYNpzT7acMi3oHgPkl5cShDs'
            ]
        );
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('accesskeys');
    }
}
