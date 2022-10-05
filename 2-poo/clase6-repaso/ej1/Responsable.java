
public class Responsable {
    private int DNI;
    private String nombreApellido;


    public Responsable(int DNI, String nombreApellido) {
        this.DNI = DNI;
        this.nombreApellido = nombreApellido;
    }

    public Responsable() {
    }

    public int getDNI() {
        return DNI;
    }

    public void setDNI(int DNI) {
        this.DNI = DNI;
    }

    public String getNombreApellido() {
        return nombreApellido;
    }

    public void setNombreApellido(String nombreApellido) {
        this.nombreApellido = nombreApellido;
    }
    
}
