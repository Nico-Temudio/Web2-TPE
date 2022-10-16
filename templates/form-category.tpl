<div class="col">
    <div class="card" style="width: 30rem;">
        <div class="card-header">
        {if (empty($id_category ))}
            <h4>Agregar Categoria</h4>
            {else}
                <h4>Editando categoria:{foreach from=$categorias item=$category}
                    {if ($category->id == $id_category)}
                    {$category->nombre}
                    {/if}
                    {{/foreach}}
                    </h4>
        {/if}
        
        </div>
        <div class="card-body">
        {if (empty($id_category ))}
            <form action="agregarCat" method="POST" enctype="multipart/form-data">
            {else}
            <form action="editarCat" method="POST" enctype="multipart/form-data">
                <input type="hidden" id="id_producto" name="id" value="{$id_category}">
        {{/if}} 
                    <div class="col" style="width: 95%;">
                        <div class="form-group">
                            <input name="nombre" type="text" placeholder="Nombre" class="form-control">
                        </div>
                    </div>             
                {if (empty($id_category ))}
                    <button type="submit" class="btn btn-primary" id="btn-agregar">Agregar</button>
                    {else}
                        <button type="submit" class="btn btn-primary" id="btn-agregar">Editar</button>
                {/if} 
            </form>
        </div>    
    </div>
</div>