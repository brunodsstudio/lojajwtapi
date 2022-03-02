<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDepartamentosTable extends Migration
{
    public function up()
    {
        Schema::create('departamentos', function (Blueprint $table) {
		$table->id('departamentos_id');
        $table->string('nome',11)->nullable()->default(NULL);
        $table->unsignedBigInteger('loja_id');
        $table->foreign('loja_id')->references('loja_id')->on('loja');
        $table->timestamps();

        });
    }

    public function down()
    {
        Schema::dropIfExists('departamentos');
    }
}