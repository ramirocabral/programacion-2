public class Entrenador extends Empleado{

    private int campeonatos;

    public Entrenador (String nom, int DNI, int edad, double sueldo, int campeonatos){
        super(nom, DNI, edad, sueldo);
        this.setCampeonatos(campeonatos);
    }

    public Entrenador(){
        super();
    }

    public void setCampeonatos(int campeonatos){
        this.campeonatos = campeonatos;
    }

    public int getCampeonatos(){
        return campeonatos;
    }

    private double bonus (){
        if (campeonatos <= 4){
            return(5000);
        }
        if (campeonatos <= 10){
            return(30000);
        }
        return(50000);
    }

    public double calcularSueldoACobrar(){
        return (super.getSueldo()*(bonus()));
    }

    
}
