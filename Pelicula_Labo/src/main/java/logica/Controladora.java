
package logica;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import persistencia.ControladoraPersistencia;
/**
 *
 * @author Holger
 */


public class Controladora {
    
    ControladoraPersistencia controlPersis = new ControladoraPersistencia();
    
    public void crearPelicula(String titulo,int duracion,Date publicacion, String pais,String foto){
        Pelicula peli = new Pelicula();
        peli.setTitulo(titulo);
        peli.setDuracion(duracion);
        peli.setPais(pais);
        peli.setPublicacion(publicacion);
        peli.setFoto(foto);
        controlPersis.crearPelicula(peli);
    }
    
    public List<Pelicula> getPelicula() {
        return controlPersis.getPelicula();
    }
    
    public void borrarPelicula(int id) {
        controlPersis.borrarPelicula(id);
    }
    
    public Pelicula traerPelicula(int id){
        return controlPersis.traerPelicula(id);
    }
    
    public void editarPelicula(Pelicula pel){
        controlPersis.editarPelicula(pel);
    }
}

