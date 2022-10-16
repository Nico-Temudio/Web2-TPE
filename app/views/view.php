<?php
require_once "libs/Smarty.class.php";

class View{

    private $smarty;

    function __construct(){
        $this->smarty = new Smarty();
    }

    function ShowInicio() {
        $this->smarty->display('templates/home.tpl');    
    }

    function ShowMenu($params,$productos,$categorias){
        $this->smarty->assign('productos',$productos);
        $this->smarty->assign('categorias',$categorias);
        $this->smarty->assign('id_category',$params);
        $this->smarty->display('templates/menu.tpl');  

    }

    function ShowProduct($params,$categorias,$productById){
        $this->smarty->assign('params',$params);
        $this->smarty->assign('categorias',$categorias);
        $this->smarty->assign('productById',$productById);
        $this->smarty->display('templates/product.tpl');  
    }

    function ShowWorning($params){
        $this->smarty->assign('id_category',$params);
        $this->smarty->display('templates/advertencia.tpl');  
    }

    function showError($msgError) {
        echo "<h1>ERROR!</h1>";
        echo "<h2>{$msgError}</h2>";
    }

}