public abstract class Empleado{
    private String nom;
    private int DNI;
    private int edad;
    private double sueldo;

    public Empleado (String nom, int DNI, int edad, double sueldo){
        this.setNombre(nom);
        this.setDNI(DNI);
        this.setEdad(edad);
        this.setSueldo(sueldo);
    }

    public Empleado(){

    }

    public void setNombre (String nom){
        this.nom = nom;
    }

    public void setDNI (int DNI){
        this.DNI = DNI;
    }

    public void setEdad (int edad){
        this.edad = edad;
    }

    public void setSueldo (double sueldo){
        this.sueldo = sueldo;
    }

    public String getNombre (){
        return nom;
    }

    public int getDNI (){
        return DNI;
    }

    public int getEdad (){
        return edad;
    }

    public double getSueldo (){
        return sueldo;
    }

    abstract double calcularSueldoACobrar();

    public String toString(){
        return ("Nombre: " + nom +" Sueldo: " + calcularSueldoACobrar());
    }

}