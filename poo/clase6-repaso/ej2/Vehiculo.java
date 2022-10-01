
public abstract class Vehiculo
{
   private int anio;
   private double importe;
   private Propietario propietario;
   
    public Vehiculo (int anio, double importe, Propietario propietario)
    {
        this.anio=anio;
        this.importe=importe;
        this.propietario=propietario;
    }

    public void setPropietario(Propietario propietario){
        this.propietario=propietario;
    }
    public void setAnio(int anio){
        this.anio=anio;
    }
    public void setImporte(double importe){
        this.importe=importe;
    }
    public int getAnio(){
        return anio;
    }
    public double getImporte(){
        return importe;
    }
    public Propietario getPropietario(){
        return propietario;
    }   

    public String toString(){
        String aux= propietario.toString();
        return (aux +'\n'+ "Vehiculo: " + "anio=" + anio + ", importe=" + importe);
    }

    abstract double calcularImpuestos();
}
