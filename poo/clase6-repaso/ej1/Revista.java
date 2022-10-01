
public class Revista extends Ejemplar{
    private String nombre;
    private int numVolumen;
    private int cantArticulos;
    
    public Revista(int codigo, int cantPaginas, String resumen, int anio, String nombre, int cantArticulos, String nombreResponsable, int DNI) {
        super(codigo, cantPaginas, resumen, anio, nombreResponsable, DNI);
        this.nombre = nombre;
        this.cantArticulos = cantArticulos;
        this.numVolumen=Generador.getNroVolumen();
    }

    public Revista() {
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getNumVolumen() {
        return numVolumen;
    }

    public void setNumVolumen(int numVolumen) {
        numVolumen = Generador.getNroVolumen();
    }

    public int getCantArticulos() {
        return cantArticulos;
    }

    public void setCantArticulos(int cantArticulos) {
        this.cantArticulos = cantArticulos;
    }

    public String toString (){
        return ("Revista: " + this.nombre + " - Volumen: " + this.numVolumen );
    }
}
