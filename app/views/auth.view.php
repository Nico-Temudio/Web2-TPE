<?php
require_once "libs/Smarty.class.php";

class AuthView {
    private $smarty;

    public function __construct() {
        $this->smarty = new Smarty(); // inicializo Smarty
    }

    function showLogin($error = null) {
        $this->smarty->assign("error", $error);
        $this->smarty->display('Login.tpl');
    }
}
