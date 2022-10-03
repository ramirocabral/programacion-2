public class Persona {
    private String nombre;
    private String apellido;
    private int cuit;

    Persona (String nombre, String apellido, int cuit){
        this.nombre = nombre;
        this.apellido = apellido;
        this.cuit = cuit;
    }

    Persona(){
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public int getCuit() {
        return cuit;
    }

    public void setCuit(int cuit) {
        this.cuit = cuit;
    }
    
    public String ToString(){
        String aux= ("Nombre: " + nombre + " - Apellido: " + apellido + " - Cuit: " + cuit);
        return aux;
    }
}
