<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProdutoTable extends Migration
{
    public function up()
    {
        Schema::create('produto', function (Blueprint $table) {

		$table->id('produto_id');
		$table->string('nome',50)->default('');
		$table->float('preço')->default(0);
		$table->string('imagem',500)->default('');
        $table->unsignedBigInteger('loja_id');
        $table->foreign('loja_id')->references('loja_id')->on('loja');
        $table->unsignedBigInteger('departamento_id');
        $table->foreign('departamento_id')->references('departamento_id')->on('departamento');
        $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('produto');
    }
}