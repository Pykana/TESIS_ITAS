<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Validar Token</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <style>
        .margin { margin-top: 200px }
    </style>
</head>

<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-xs-12 col-sm-10 col-md-8 col-lg-6">
                <div class="card mt-2">
                    <div class="card-header">
                        <h2>Validar Token</h2>
                        <form action="MainBack.php" method="post">
                            <div class="form-group">
                                <label for="token">Token:</label>
                                <input type="text" class="form-control" id="token" name="token" required>
                            </div>
                            <button type="submit" class="btn btn-primary">Validar</button>
                            <a href="../index.php" class="btn btn-secondary">Volver</a>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
