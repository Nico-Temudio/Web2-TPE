<!DOCTYPE html>
<html lang="en">
<head>
    <base href="{BASE_URL}">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cafeteria</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light" style="background-color: rgb(255, 227, 136);">
    <div class="container-fluid">
        <img src="./images/logo1.png" alt="" width="50" height="50" class="d-inline-block align-text-top">
        <a class="navbar-brand" >La Cafeteria</a>
        <div class="collapse navbar-collapse" id="navbarText">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" href="inicio">Home </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="menu">Menu</a>
                </li>
            </ul>
            {if isset($smarty.session.IS_LOGGED)}
                <a type="button" class="btn btn-primary" href="logout">Logout ({$smarty.session.USER_NAME})</a>
            {else}
                <a type="button" class="btn btn-primary"href="login" >Login</a>
            {/if}    
        </div>
    </div>
</nav>