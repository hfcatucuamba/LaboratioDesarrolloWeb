<%-- 
    Document   : insertar
    Created on : 25 ago 2023, 16:29:07
    Author     : Holger
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        
        <title>Añadir Pelicula</title>
        <style>
            /* Estilos incorporados */
            body {
                font-family: Arial, sans-serif;
                background-color: #f5f5f5;
                margin: 0;
                padding: 0;
                height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
                flex-direction: column;
            }
            h3 {
                color: #333;
            }
            .form-control {
                width: 100%;
                padding: 10px;
                margin: 5px 0;
                box-sizing: border-box;
            }
            .btn {
                padding: 10px 20px;
                margin-right: 10px;
            }
            a {
                text-decoration: none;
                color: #007BFF;
                border: 1px solid #007BFF;
                padding: 10px 20px;
                border-radius: 5px;
                transition: background-color 0.2s;
            }
            a:hover {
                background-color: #007BFF;
                color: white;
            }
            .container {
                background-color: #fff;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h3>Agregar Pelicula</h3>
            <form action="SvPeliculas" method="POST">
                Titulo:
                <br><input class="form-control" type="text" id="txttitulo" name="txttitulo"><br>
                Duración:
                <br><input class="form-control" type="number" id="txtduracion" name="txtduracion"><br>
                Publicación:
                <br><input class="form-control" type="date" id="txtpubli" name="txtpubli"><br>
                Pais:
                <br><input class="form-control" type="text" id="txtpais" name="txtpais"><br>
                Foto:
                <br><input class="form-control" type="file" id="txtfoto" name="txtfoto"><br><br>
                <input class="btn btn-primary"  type="submit" name="accion" value="Guardar">
                <a href="SvPeliculas">Regresar</a>
            </form>
        </div>
    </body>
</html>