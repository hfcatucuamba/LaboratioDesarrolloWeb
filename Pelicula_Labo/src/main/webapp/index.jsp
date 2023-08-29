<%-- 
    Document   : listar
    Created on : 28 ago 2023, 03:42:00
    Author     : Holger
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Laboratorio en Grupo</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        
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
            h1 {
                color: #333;
                margin-bottom: 10px;
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
            .header {
                text-align: center;
                background-color: #e;
                padding: 10px;
                margin-bottom: 20px;
                border-radius: 5px;
            }
        </style>
    </head>
    <body>
        <div class="header">
            <img src="img/espe.png" width="800" alt="alt"/>
            <h1>Desarrollo Web para la Integración de Tecnologías</h1>
            <h3>Laboratorio en Grupo</h3>
            <p>Autores: </p>
            <p>Adrian Bravo</p> 
            <p>Holger Catucuamba</p>
        </div>
        <a href="SvPeliculas">Crud Peliculas</a>
    </body>
</html>