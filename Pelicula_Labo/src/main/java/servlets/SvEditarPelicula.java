/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Pelicula;

/**
 *
 * @author Holger
 */
@WebServlet(name = "SvEditarPelicula", urlPatterns = {"/SvEditarPelicula"})
public class SvEditarPelicula extends HttpServlet {
    Controladora control = new Controladora();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Pelicula pel = control.traerPelicula(id);
        HttpSession misession=request.getSession();
        misession.setAttribute("editarPel", pel);
        response.sendRedirect("actualizar.jsp");
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            String titulo = request.getParameter("txttitulo");
            String duracionStr = request.getParameter("txtduracion");
            int duracion = Integer.parseInt(duracionStr);
            String fechaStr = request.getParameter("txtpubli");
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date publicacion = null;
            try {
                publicacion = dateFormat.parse(fechaStr);
            } catch (Exception e) {
                e.printStackTrace();
            }
            String pais = request.getParameter("txtpais");
            String foto = request.getParameter("txtfoto");
            Pelicula pel = (Pelicula)request.getSession().getAttribute("editarPel");
            pel.setDuracion(duracion);
            pel.setTitulo(titulo);
            pel.setPublicacion(publicacion);
            pel.setPais(pais);
            pel.setFoto(foto);
            control.editarPelicula(pel);
            response.sendRedirect("SvPeliculas");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
