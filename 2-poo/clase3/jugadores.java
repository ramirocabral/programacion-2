public class jugadores {
    private String nombre;
    private int DNI;
    private int edad; 
    private int partidos; 
    private int goles; 
    
    public jugadores(String unNombre, int unDNI, int unaEdad, int part, int g){
        nombre = unNombre;
        DNI = unDNI;
        edad = unaEdad; 
        partidos = part;
        goles = g;
    }
    
    public jugadores(){
     
    }

    public int getDNI() {
        return DNI;
    }

    public int getPartidos() {
        return partidos;
    }
    public int getGoles() {
        return goles;
    }

    public int getEdad() {
        return edad;
    }

    public String getNombre() {
        return nombre;
    }

    public void setDNI(int unDNI) {
        DNI = unDNI;
    }

    public void setPartidos(int n){
        partidos = n;
    }

    public void setGoles(int asd){
        partidos = asd;
    }

    public void setEdad(int unaEdad) {
        edad = unaEdad;
    }

    public void setNombre(String unNombre) {
        nombre = unNombre;
    }
    
}
