package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
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
@WebServlet(name = "SvPeliculas", urlPatterns = {"/SvPeliculas"})
public class SvPeliculas extends HttpServlet {

    Controladora control = new Controladora();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {            
        
        }
    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Pelicula>listaPel=new ArrayList<Pelicula>();
        listaPel=control.getPelicula();
        HttpSession misession=request.getSession();
        misession.setAttribute("listaPel", listaPel);
        System.out.println("usuarios: "+listaPel.get(0));
        response.sendRedirect("listar.jsp");
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
            control.crearPelicula(titulo, duracion, publicacion, pais, foto);
            response.sendRedirect("SvPeliculas");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
