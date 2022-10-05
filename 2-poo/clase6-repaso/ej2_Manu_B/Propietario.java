
public class Propietario extends Vehiculo {
    private int cit;
    private String nombre;
    private String apellido;

    public Propietario(String nombre, String apellido, int cit) {
        this.setNombre(nombre);
        this.setApellido(apellido);
        this.setcit(cit);
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public void setcit(int cit) {
        this.cit = cit;
    }

    public String getNombre() {
        return nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public int getcit() {
        return cit;
    }

    public Propietario() {

    }

    public String toString() {
        return ("Propietario: " + "nombre=" + nombre + ", apellido=" + apellido + ", cit=" + cit + "\n");
    }

    public double calcularImpuesto() {
        return 0;

    }
}
