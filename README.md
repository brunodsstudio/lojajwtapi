## PLUGIN
https://www.positronx.io/laravel-jwt-authentication-tutorial-user-login-signup-api/  

## Endpoints
[get]     /api/lojas   
 
[post]   - /api/addLoja?nome="nomedaloja"  
[delete] - /api/delLoja?nome="nomedaloja"  
[put]    - /api/updateLoja?loja_id=0&nome="novoNomedaloja"  
  
//----------------------------------------------------------------------
[get] -    /api/deptos    

[post] -   /api/addDeptos?nome=Cozinha&loja_id=2  
[delete] - /api/delDepto?nome=Delete  
[put] -    /api/updateDepto?nome=Cozinha e jantar&departamento_id=5   
  
//----------------------------------------------------------------------  
[get] - /api/Produto  
        /api/Produto?filter=loja&busca_id=2&tpp=10    
        /api/Produto?filter=departamento&busca_id=2&tpp=10   
        /api/Produto?filter=produto&busca_id=1&tpp=10  

[post]   - /api/addDProduto?nome=meia&preco=10.50&imagem=/imagens/meia.jpg&loja_id=2&departamento_id=4  
[delete] - /api/delProduto?id=2  
[put]    - /api/updateProduto?nome=meia soquete&preco=9&imagem=/imagens/meiasoquete.jpg&id=1 
  
//----------------------------------------------------------------------  
<h3>AUTH JWT</h3>  
  
[POST]	/api/auth/register  
[POST]	/api/auth/login  
[GET]	/api/auth/user-profile  
[POST]	/api/auth/refresh  
[POST]	/api/auth/logout  