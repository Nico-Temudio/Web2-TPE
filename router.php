<?php
require_once "app/controllers/product.controller.php";
require_once "app/controllers/Category.controller.php";
require_once "app/controllers/auth.controller.php";
define('BASE_URL', '//'.$_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']).'/');
define('PRODUCT', '//'.$_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']).'/product');
define('MENU', '//'.$_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']).'/menu');
define('CATEGORY', '//'.$_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']).'/categorias');
$action = 'inicio'; // acción por defecto
if (!empty($_GET['action'])) {
    $action = $_GET['action'];
}
$params = explode('/', $action);


switch ($params[0]) {
    case 'login':
        $authController = new AuthController();
        $authController->showLogin();
        break;
    case 'validate':
        $authController = new AuthController();
        $authController->validateUser();
        break;

    case 'logout':
        $authController = new AuthController();
        $authController->logout();
        break;

    case 'inicio':
        $Controller = new Controller();
        $Controller->ShowInicio();
        break;
    case 'menu':
        if (empty($params[1])) {
            $Controller = new Controller();
            $Controller->ShowMenu();
        } else {
            $Controller = new Controller();
            $Controller->ShowMenu($params[1]);
        }
        break;
        
    case 'filtrar-categoria':
        $Controller = new Controller();
        $Controller->ShowMenuFiltrado();
        break;
    case 'product':
            $Controller = new Controller();
            $Controller->ShowProduct($params[1]);
        break;
    case 'editar':
        $Controller = new Controller();
        $Controller->Editproducto();
        break;
    case 'agregar':
        $Controller = new Controller();
        $Controller->AddProducto();
        break;
    case 'eliminar':
        $Controller = new Controller();
        $Controller->deleteProduct($params[1]);
        break;
    case 'editarCat':
        $CatController = new CatController();
        $CatController->EditCategory();
        break;
    case 'agregarCat':
        $CatController = new CatController();
        $CatController->AddCategory();
        break;  
    case 'advertencia':
        $CatController = new CatController();
        $CatController->Worning($params[1]);
        break;
    case 'eliminarCat':
        $CatController = new CatController();
        $CatController->deleteCategory($params[1]);
        break;
default:
        echo('404 Page not found');
        break;
}
