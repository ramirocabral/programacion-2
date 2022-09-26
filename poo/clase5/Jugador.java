
public class Jugador extends Empleado{

    private int partidos; 
    private int goles;

    public Jugador (String nom, int DNI, int edad, double sueldo, int partidos, int goles){
        super(nom, DNI, edad, sueldo);
        this.setPartidos(partidos);
        this.setGoles(goles);
    }

    public Jugador(){
        super();
    }

    public void setPartidos (int partidos){
        this.partidos = partidos;
    }

    public void setGoles (int goles){
        this.goles = goles;
    }

    public int getPartidos (){
        return partidos;
    }

    public int getGoles (){
        return goles;
    }

    public double calcularSueldoACobrar(){
    double s = super.getSueldo();
        if ((goles/partidos) >= 0.5){
            return (s*2);}
        return (s);
    }


    
}
