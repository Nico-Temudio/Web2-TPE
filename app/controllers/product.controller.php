<?php
require_once "app/models/product.model.php";
require_once "app/models/category.model.php";
require_once "app/views/view.php";
require_once "app/helpers/auth.helper.php";

class Controller{
        private $model;
        private $modelCat;
        private $view;
        private $authHelper;

    function __construct(){
        $this->model = new productModel();
        $this->modelCat = new categoryModel();
        $this->view = new View();

        $this->authHelper = new AuthHelper();
        session_start();
        
    }


    function ShowInicio(){

        $this->view->ShowInicio();

    }

    function ShowMenu($params=null){
            $productos = $this->model->getProductos();
            $categorias = $this->modelCat->getCategories();
            $this->view->ShowMenu($params,$productos,$categorias);
    }

    function ShowMenuFiltrado(){
        $category = $_POST['id'];
        $productos = $this->model->getProductsByCategory($category);
        $categorias = $this->modelCat->getCategories();
        $this->view->ShowMenu($params=null,$productos,$categorias);
    }


    function ShowProduct($params){
        $categorias = $this->modelCat->getCategories();
        $productById = $this->model->getProductById($params);
        $this->view->ShowProduct($params, $categorias, $productById);
    }


    function EditProducto(){
        $this->authHelper->checkLoggedIn();
        $nombre = $_POST['nombre'];
        $precio = $_POST['precio'];
        $categoria = $_POST['categoria'];
        $id = $_POST['id'];
        $descripcion = $_POST['descripcion'];
        if (!empty($nombre) && !empty($precio) && !empty($categoria)) {
            if($_FILES['input_name']['type'] == "image/jpg" || $_FILES['input_name']['type'] == "image/jpeg" 
            || $_FILES['input_name']['type'] == "image/png" ) {
                    $this->model->edit($nombre, $precio,$categoria,$id,$descripcion,$_FILES['input_name']['tmp_name']);
                }
                else {
                    $this->model->edit($nombre, $precio,$categoria,$id,$descripcion,null);
                }
                header("Location: " . PRODUCT . "/$id");
            }
        
        else {
            $this->view->showError("Faltan datos obligatorios");
        }
    }


    function AddProducto(){
        $this->authHelper->checkLoggedIn();
        $nombre = $_POST['nombre'];
        $precio = $_POST['precio'];
        $categoria = $_POST['categoria'];
        $descripcion = $_POST['descripcion'];

        if (!empty($nombre) && !empty($precio) && !empty($categoria)) {
            if($_FILES['input_name']['type'] == "image/jpg" || $_FILES['input_name']['type'] == "image/jpeg" 
            || $_FILES['input_name']['type'] == "image/png" ) {

                $this->model->save($nombre, $precio,$categoria, $descripcion, $_FILES['input_name']['tmp_name']);
            }
            else {
                $this->model->save($nombre, $precio,$categoria, $descripcion);
            }
            header("Location: " . MENU);
            }
        
        else {
            $this->view->showError("Faltan datos obligatorios");
        }

    }

    function deleteProduct($params = null) {
        $this->authHelper->checkLoggedIn();
        $idProducto = $params;
        $this->model->delete($idProducto);
        header("Location: " . MENU);
    }


}
