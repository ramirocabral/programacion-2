public class Libro extends Ejemplar{
    private String titulo;
    private int cantCapitulos;
    private boolean esDeBolsillo;

    public Libro(int codigo, int cantPaginas, String resumen, int anio, String titulo, int cantCapitulos, boolean esDeBolsillo,String nombreResponsable, int DNI) {
        super(codigo, cantPaginas, resumen, anio, nombreResponsable, DNI);
        this.titulo = titulo;
        this.cantCapitulos = cantCapitulos;
        this.esDeBolsillo = esDeBolsillo;
    }

    public Libro() {
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public int getCantCapitulos() {
        return cantCapitulos;
    }

    public void setCantCapitulos(int cantCapitulos) {
        this.cantCapitulos = cantCapitulos;
    }

    public boolean EsDeBolsillo() {
        return esDeBolsillo;
    }

    public void setEsDeBolsillo(boolean esDeBolsillo) {
        this.esDeBolsillo = esDeBolsillo;
    }

    public String toString (){
        if (esDeBolsillo){
            return (titulo + " - Es de bolsillo. Codigo: "+super.getCodigo()+"; Responsable: "+super.getNombreResponsable());
        }
            return (titulo + "; Codigo: "+super.getCodigo()+"; Responsable: "+super.getNombreResponsable());

    }
}