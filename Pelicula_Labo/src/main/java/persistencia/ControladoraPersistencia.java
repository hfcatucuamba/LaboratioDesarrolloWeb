package persistencia;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import logica.Pelicula;
import persistencia.exceptions.NonexistentEntityException;

/**
 *
 * @author Holger
 */
public class ControladoraPersistencia {
    PeliculaJpaController pelJPA = new PeliculaJpaController();
    
    public ControladoraPersistencia() {
    }
    
    public void crearPelicula(Pelicula peli){
        pelJPA.create(peli);
    }
    
    public List<Pelicula>getPelicula(){
        return pelJPA.findPeliculaEntities();
    }
    
    public void borrarPelicula(int id){
        try {
            pelJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public Pelicula traerPelicula(int id){
        return pelJPA.findPelicula(id);
    }
    
    public void editarPelicula(Pelicula pel){
        try {
            pelJPA.edit(pel);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
