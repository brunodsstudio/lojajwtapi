<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateLojaTable extends Migration
{
    public function up()
    {
        Schema::create('loja', function (Blueprint $table) {

		$table->id('loja_id');
		$table->string('nome',50)->nullable()->default(NULL);
		$table->float('lat')->nullable()->default(NULL);
		$table->float('long')->nullable()->default(NULL);
        });
    }

    public function down()
    {
        Schema::dropIfExists('loja');
    }
}