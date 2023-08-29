<%-- 
    Document   : listar
    Created on : 25 ago 2023, 16:18:04
    Author     : Holger
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="logica.Pelicula"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Laboratorio Grupal</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <style>
            /* Estilos incorporados */
            body {
                font-family: Arial, sans-serif;
                background-color: #f5f5f5;
                margin-top: 20%;
                padding: 5%;
                height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
                flex-direction: column;
            }
            h3 {
                color: #333;
            }
            .form-control, .btn {
                margin: 5px 0;
                padding: 10px;
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
            table {
                width: 100%;
                border-collapse: collapse;
            }
            table, th, td {
                border: 1px solid #aaa;
            }
            th, td {
                padding: 8px 15px;
                text-align: center;
            }
            th {
                background-color: #ddd;
            }
        </style>
    </head>
    <body>
        <header>
             <br>
             <br>
              <br>
            <br>
           <h2>PELICULAS</h2> 
           <br>
           <center>
            <a href="insertar.jsp">Nuevo</a>
            </center>
            <br>
            <br>
            
        </header>
        <div class="container mt-5">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th class="text-center">Id</th>
                        <th class="text-center">Titulo</th>
                        <th class="text-center">Duracion</th>
                        <th class="text-center">Publicacion</th>
                        <th class="text-center">Pais</th>
                        <th class="text-center">Foto</th>
                        <th class="text-center">Acciones</th>
                    </tr>
                </thead>
                <% List<Pelicula> listaPel=(List)request.getSession().getAttribute("listaPel"); %>
                <tbody>
                    <% for (Pelicula pel : listaPel){
                        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                        Date fechaPublicacion = pel.getPublicacion();
                        String fechaFormateada = dateFormat.format(fechaPublicacion); %>
                        <tr>
                            <td><%= pel.getId() %></td>
                            <td><%= pel.getTitulo()%></td>
                            <td><%= pel.getDuracion() %></td>
                            <td><%= fechaFormateada %></td>
                            <td><%= pel.getPais() %></td>
                            <td><img src="img/<%= pel.getFoto() %>" alt="<%= pel.getTitulo() %> " width="100"></td>
                            <td>
                                <form action="SvEditarPelicula" method="GET">
                                    <input type="hidden" id="id" name="id" value="<%= pel.getId() %>">
                                    <input class="btn btn-warning" type="submit" name="accion" value="Editar">
                                </form>
                                <form action="SvEliminarPelicula" method="POST">
                                    <input type="hidden" name="id" value="<%= pel.getId() %>">
                                    <input class="btn btn-danger" type="submit" name="accion" value="Eliminar">
                                </form>
                            </td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </body>
</html>