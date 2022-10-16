
<div class="col">
    <div class="card" style="width: 30rem;">
        <div class="card-header">
        {if (empty($id_producto ))}
            <h4>Agregar producto</h4>
            {else}
                <h4>Editar producto:{$productById->nombre}</h4>
        {/if}
        
        </div>
        <div class="card-body">
        {if (empty($id_producto ))}
            <form action="agregar" method="POST" enctype="multipart/form-data">
            {else}
            <form action="editar" method="POST" enctype="multipart/form-data">
                <input type="hidden" id="id_producto" name="id" value="{$id_producto}">
        {{/if}}   
                <div class="col" style="width: 95%;">
                    <div class="form-group">
                        <input name="nombre" type="text" placeholder="Nombre" class="form-control">
                    </div>
                </div>
                <div class="col" style="width: 95%;">
                    <div class="form-group">
                    <input name="precio" type="text" placeholder="Precio" class="form-control">
                    </div>
                </div>
                <div class="col" style="width: 95%;">
                    <div class="form-group">
                    <textarea name="descripcion" type="text" placeholder="Descripcion" class="form-control"></textarea>
                    </div>
                </div>
                <div class="col">
                    <input type="file" name="input_name" id="imageToUpload">
                </div>
                <div class="col">
                    <select name="categoria" class="form-select" aria-label="Default select example">
                        <option selected>Seleccionar Categoria</option>
                            {foreach from=$categorias item=$category}
                            <option value="{$category->id}">{$category->nombre}</option>
                            {/foreach}
                    </select>
                </div>
                    <button type="submit" class="btn btn-primary" id="btn-agregar">Editar</button>
            </form>
        </div>    
    </div>
</div>



