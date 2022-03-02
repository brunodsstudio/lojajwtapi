<?php

namespace App\Http\Controllers;
use App\Models\Loja;
use App\Models\Departamento;
use App\Models\Produto;
use Illuminate\View\Middleware\ShareErrorsFromSession;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class LojaController extends Controller
{
    public function getLojas(){
            $loja = Loja::all();
            return response()->json($loja, 200);
    }

    public function addLoja(Request $request){
        $loja = new Loja;
        $loja->nome = $request->nome;
        $loja->save();
        return response()->json(["message" => 'loja inserida com sucesso'], 201);
    }

    public function deleteLoja(Request $request){

       /* $idLoja = DB::select(
                    DB::raw("select loja_id where nome like '%". $request->nome ."%'"));*/

        $res=Loja::where('nome', 'LIKE', "%{$request->nome}%")->delete();


        if($res){
            return response()->json(["message" => 'loja excluida com sucesso'], 201);  
        }else{
            return response()->json(["message" => 'loja não encontrada'], 201);  
        }
    }

    public function updateLoja(Request $request){

       $res =  Loja::where('loja_id' , $request->loja_id)
        ->update(['nome' => $request->nome]);

        if($res){
            return response()->json(["message" => 'loja atualizada com sucesso'], 201);  
        }else{
            return response()->json(["message" => 'loja não encontrada'], 201);  
        }
    }

    //--------------------------------------------

    public function getDeptos(){
        $depto = Departamento::all();
        return response()->json($depto, 200);
    }

    public function addDeptos(Request $request){

        $validated = $request->validate([
            'nome' => 'required|max:200',
            'loja_id' => 'required',
        ]);
    

        $dpt = new Departamento;
        $dpt->nome = $request->nome;
        $dpt->loja_id = $request->loja_id;
        $dpt->save();
        return response()->json(["message" => 'Depto inserido com sucesso'], 201);
    }

    public function deleteDeptos(Request $request){
        
        $res = Departamento::where('nome', 'LIKE', "%{$request->nome}%")->delete();
        if($res){
            return response()->json(["message" => 'Departamento excluido'], 201);  
        }else{
            return response()->json(["message" => 'Departamento não encontrado'], 201);  
        }
    }

    public function updateDeptosId(Request $request){

        $validated = $request->validate([
            'nome' => 'required|max:200',
            'departamento_id' => 'required',
        ]);

        $res =  Departamento::where('departamentos_id' , $request->departamento_id)
        ->update(['nome' => $request->nome]);

        if($res){
            return response()->json(["message" => 'loja atualizada com sucesso'], 201);  
        }else{
            return response()->json(["message" => 'loja não encontrada'], 201);  
        }
    }

    //------------------------------------------------------------------
    public function getProduto(Request $request){

        if($request->filter == "loja"){
            $cnt = Produto::where('loja_id', $request->busca_id)->paginate($request->tpp);


        }else if($request->filter == "departamento"){
            $cnt =  Produto::where('departamento_id', $request->busca_id)->paginate($request->tpp);


        } else if($request->filter == "produto"){
            $cnt =  Produto::where('produto_id', $request->busca_id)->paginate($request->tpp);
         
        } else if($request->filter == "todos") {
            $cnt = Produto::all()->paginate($request->tpp);
        }
        $ar = array($cnt, $request->filter);
        return response()->json($ar, 200);

    }

    public function createProduto(Request $request){

        $validated = $request->validate([
            'nome' => 'required|max:200',
            'preco' => 'required',
            'imagem' => 'required|max:500',
            'loja_id' => 'required',
            'departamento_id' => 'required',
        ]);
    

        $dpt = new Produto;
        $dpt->nome = $request->nome;
        $dpt->loja_id = $request->loja_id;
        $dpt->departamento_id = $request->departamento_id;
        $dpt->preço = $request->preco;
        $dpt->imagem = $request->imagem;
        $dpt->save();
        return response()->json(["message" => 'Produto  inserido'], 201);

    }

    public function deleteProduto(Request $request){


        $res = Produto::where('produto_id', $request->id)->delete();
        if($res){
            return response()->json(["message" => 'Produto deletado'], 201);  
        }else{
            return response()->json(["message" => 'Departamento not found'], 201);  
        } 
    }

    public function updateProduto(Request $request){

        $validated = $request->validate([
            'nome' => 'required|max:200',
            'preco' => 'required',
            'imagem' => 'required|max:500',
        ]);

        
        $res = Produto::where('produto_id' , $request->id)
        ->update(['nome' => $request->nome, 'imagem' => $request->imagem, 'preço' => $request->preco]);

        if($res){
            return response()->json(["message" => 'loja updated sucessfully'], 201);  
        }else{
            return response()->json(["message" => 'loja not found'], 201);  
        }
    }
    
    




}
