<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\LojaController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

/*Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});*/


   Route::get('/lojas', [LojaController::class, 'getLojas']);    
   Route::post('/addLoja', [LojaController::class, 'addLoja']);   
   Route::delete('/delLoja', [LojaController::class, 'deleteLoja']); 
   Route::put('/updateLoja', [LojaController::class, 'updateLoja']); 
//----------------------------------------------------------------------
   Route::get('/deptos', [LojaController::class, 'getDeptos']);    
   Route::post('/addDeptos', [LojaController::class, 'addDeptos']);   
   Route::delete('/delDepto', [LojaController::class, 'deleteDeptos']); 
   Route::put('/updateDepto', [LojaController::class, 'updateDeptosId']);
//----------------------------------------------------------------------
   Route::get('/Produto', [LojaController::class, 'getProduto']);    
   Route::post('/addDProduto', [LojaController::class, 'createProduto']);   
   Route::delete('/delProduto', [LojaController::class, 'deleteProduto']); 
   Route::put('/updateProduto', [LojaController::class, 'updateProduto']);



Route::group([
    'middleware' => 'api',
    'prefix' => 'auth'
], function ($router) {
    Route::post('/login', [AuthController::class, 'login']);
    Route::post('/register', [AuthController::class, 'register']);
    Route::post('/logout', [AuthController::class, 'logout']);
    Route::post('/refresh', [AuthController::class, 'refresh']);
    Route::get('/user-profile', [AuthController::class, 'userProfile']);    
});

