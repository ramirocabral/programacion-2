public abstract class Ejemplar{
    private int codigo;
    private int cantPaginas;
    private String resumen;
    private int anio;
    private Responsable responsable;
    
    public Ejemplar(int codigo, int cantPaginas, String resumen, int anio, String nombreResponsable, int DNI){
        this.responsable = new Responsable(DNI, nombreResponsable);
        this.codigo = codigo;
        this.cantPaginas = cantPaginas;
        this.resumen = resumen;
        this.anio = anio;
    }

    public Ejemplar(){
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public int getCantPaginas() {
        return cantPaginas;
    }

    public void setCantPaginas(int cantPaginas) {
        this.cantPaginas = cantPaginas;
    }

    public String getResumen() {
        return resumen;
    }

    public void setResumen(String resumen) {
        this.resumen = resumen;
    }

    public int getAnio() {
        return anio;
    }

    public void setAnio(int anio) {
        this.anio = anio;
    }

    public String getNombreResponsable () {
        return responsable.getNombreApellido();
    }

    

}