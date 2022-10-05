import javax.lang.model.util.ElementScanner6;

public class entrenador {
    private String nombre;
    private double sueldoBasico;
    private int cantCampeonatos; 
    
    public entrenador(String unNombre, double num, int camp){
        nombre = unNombre;
        sueldoBasico = num;
        cantCampeonatos = camp;
    }

    public entrenador(){
    
    }

    
    public String getNombre() {
        return nombre;
    }

    public double getSueldoBasico() {
        return sueldoBasico;
    }

    public double getcantCamp() {
        return cantCampeonatos;
    }

    public void setCamp(int camp) {
        cantCampeonatos = camp;
    }

    public void setSueldo(double num) {
        sueldoBasico = num;
    }

    public void setNombre(String unNombre) {
        nombre = unNombre;
    }

    public double calcularSueldo (){
        if (cantCampeonatos <= 4){
            return (sueldoBasico+5000);
        }
        else if (cantCampeonatos <= 10){
            return (sueldoBasico+30000);
        }
        return (sueldoBasico+50000);
    }
    
}
