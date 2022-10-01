public class Automotor extends Vehiculo {
    private int patente;
    private double adicional;
    private String descripcion;

    public Automotor(int patente,  double adicional, String descripcion, int anio, double importe, Propietario propietario) {
        super(anio, importe, propietario);
        this.setPatente(patente);
        this.setAdicional(adicional);
        this.setDescripcion(descripcion);
    }

    public void setPatente(int patente) {
        this.patente = patente;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public void setAdicional(double adicional) {
        this.adicional = adicional;
    }

    public int getPatente() {
        return patente;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public double getAdicional() {
        return adicional;
    }

    public double calcularImpuestos(){
        return (super.getImporte()+adicional);
    }


    public String toString() {
    String aux = super.toString();
        return (aux+ "\n Automotor{" + "patente=" + patente + ", adicional=" + adicional + ", descripcion=" + descripcion + '}');
    }
}
