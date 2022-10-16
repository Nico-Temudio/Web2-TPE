<?php
require_once "app/models/category.model.php";
require_once "app/views/view.php";
require_once "app/helpers/auth.helper.php";
class CatController{
    private $modelCat;
    private $view;
    private $authHelper;

    function __construct(){
        $this->modelCat = new categoryModel();
        $this->view = new View();

        $this->authHelper = new AuthHelper();
        session_start();
        $this->authHelper->checkLoggedIn();
    }

 
    function Worning($params){
        $this->view->ShowWorning($params);
    }


    function EditCategory(){
        $categoria = $_POST['nombre'];
        $id = $_POST['id'];
        if (!empty($categoria)) {
            $this->modelCat->editCategory($categoria,$id);
            header("Location: " . MENU);
        }
        else {
            $this->view->showError("Complete el nombre de la categoria");
        }
     }
   

    function AddCategory(){
        $categoria = $_POST['nombre'];
        if (!empty($categoria)) {
            $this->modelCat->addCategory($categoria);
            header("Location: " . MENU);
            }
         
        else {
            $this->view->showError("Faltan datos obligatorios");
        }
    }
    function deleteCategory($params = null) {
        $idCategoria = $params;
        $this->modelCat->deleteCategory($idCategoria);
        header("Location: " . MENU);
    }

}



