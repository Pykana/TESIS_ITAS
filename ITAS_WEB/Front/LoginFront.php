<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login ITAS</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <style>
        body { overflow: hidden; }
        .margin { margin-top: 200px }
    </style>
</head>
<body>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card mt-5">
                <div class="card-header">
                    <!-- <h3 class="text-center" >Inicio Sesion</h3> -->
                    <div class="d-flex justify-content-center">
                        <img src="img/logo.png" style="width: 100px; height: 100px;">
                    </div>
                    <p class="text-center">INGENIERIA TECNICA  ASESORIA Y SERVICIOS ELECTRICOS Y  ELECTROMECANICOS E.I.R.L</p>
                </div>
                <div class="card-body">
                <form id="loginForm" action="#" method="POST"> 
                  <form action="Back/Services/LoginService.php" method="POST"> 
                        <div class="form-group">
                            <label for="username">Usuario:</label>
                            <input type="text" class="form-control" id="username" name="username" required>
                        </div>
                        <div class="form-group">
                            <label for="password">Contraseña:</label>
                            <input type="password" class="form-control" id="password" name="password" required>
                        </div>
                        <button type="submit" class="btn btn-primary btn-block">Iniciar sesión</button>
                    </form>
                </div>
                <div class="card-footer text-muted">
                    <a href="Front/RegisterBack.php">Registrarse</a>
                    <a href="Front/ForgotPassBack.php" class="float-right">¿Olvidaste tu contraseña?</a>
                </div>
                <!-- <div class="card-footer text-muted">
                    <a class="float-right">INGENIERIA TECNICA  ASESORIA Y SERVICIOS ELECTRICOS Y  ELECTROMECANICOS E.I.R.L</a></div> -->
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>

</body>
</html>
