{include file="header.tpl"}
{$id_producto = $params}

<main class="container d-flex p-2 justify-content-center mb-5">
  <div class="row">
    <div class="col">
      <div class="card" style="width: 18rem;">
        <h2 class="card-subtitle">{$productById->nombre_categoria}</h2>
        {if empty($productById->imagen)}
          <img class="card-img-top" src="./images/logo1.png">

        {else}
          <img class="card-img-top" src="{$productById->imagen}">
        {/if}

        <div class="card-body">
          <h4 class="card-title">{$productById->nombre}</h4>
          <h5 class="card-subtitle">{$productById->descripcion}</h5>
          <h5 >${$productById->precio}</h5>
          {if isset($smarty.session.IS_LOGGED)}
            <a href="eliminar/{$productById->id}" type="button" class="btn btn-primary" value="{$productById->id}">&#128465</a>
          {/if}
        </div>
      </div>
    </div>
    {if isset($smarty.session.IS_LOGGED)}
      <div class="col">
        {include file="form-product.tpl"}
      </div>
    {/if}
  </div>  
</main>

{include file="footer.tpl"}