{include file="header.tpl"}
<div class="row justify-content-between">
    <div class="col">
        <h1 class="titulo1">"Menu"</h1>
        <main class="container mt-5" style="width: 30%;">
            {foreach from=$productos item=$product}
                <div class="row">
                    <div class="col">
                        <div class="card mb-2">
                            <div class="card-header">
                                {$product->nombre_categoria}
                            </div>
                            <div class="card-body">
                                <blockquote class="blockquote mb-0">
                                <p><a href="product/{$product->id}">{$product->nombre}</a></p>
                                </blockquote>
                            </div>
                        </div>
                    </div>
                </div>
            {/foreach} 
            {if isset($smarty.session.IS_LOGGED)}
                {{include file="form-product.tpl"}}
            {/if}
        </main>
    </div>
    <div class="col-3">
        <aside class="container mt-5">
            <h1 >Categorias</h1>
            <div class="row">
                <div class="col">
                    <div class="list-group">
                        {foreach from=$categorias item=$category}
                            <div class="row">
                                <div class="col" >
                                    <blockquote class="blockquote mb-0">
                                        <form method="POST" action="filtrar-categoria">
                                            <input type="hidden" name="id" value="{$category->id}">
                                            <button type="submit" class="list-group-item list-group-item-action" id="{$category->id}">{$category->nombre}</button>
                                        </form>  
                                    </blockquote>
                                </div>
                                    {if isset($smarty.session.IS_LOGGED)}
                                        <div class="col" >
                                            <a href="advertencia/{$category->id}" type="button" class="btn btn-primary" value="{$category->id}">&#128465</a>
                                            <a href="menu/{$category->id}" type="button" class="btn btn-primary">&#128393 </a>
                                        </div>
                                    {/if}
                            </div>
                        {/foreach}
                        <a class="list-group-item list-group-item-action" href="menu">Todas las categorias</a>
                    </div>
                </div>
            <div>
            {if isset($smarty.session.IS_LOGGED)}
                {{include file="form-category.tpl"}}
            {/if}
        </aside>
    </div>
</div>


    <table class="tabla">
        <tr>
            <td> 
                <h4>Brownie</h4> 
                <p>La especialidad de esta cafeteria </p>
            </td>
            <td> <img src="./images/torta2.png" alt="ahf"> </td>
            <td> 
                <h4>Chocotorta</h4> 
                <p>La torta mas famosa de Argentina</p>
            </td>
            <td> <img src="./images/torta3.png" alt=""> </td>
        </tr>
        <tr>
            <td> <img src="./images/cafe2.png" alt=""> </td>
            <td>
                <h4>Lagrima</h4> 
                <p>Perfecta para acompañar con torta</p>
            </td>
            <td> <img src="./images/submarino.png" alt=""> </td>
            <td> 
                <h4>Submarino</h4> 
                <p>La mejor merienda para chicos y grandes</p>
            </td>
        </tr>
    </table>

    {include file="footer.tpl"}






    
  
