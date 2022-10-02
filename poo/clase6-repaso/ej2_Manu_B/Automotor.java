
public class Automotor extends Vehiculo {
    private int patente;
    private String descripcion;
    private double importeAdicional;
    private int que;

    public void setpatente(int patente) {
        this.patente = patente;
    }

    public void setdescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public void setimporteAdicional(double importeAdicional) {
        this.importeAdicional = importeAdicional;
    }

    public int getpatente() {
        return patente;
    }

    public String getdescripcion() {
        return descripcion;
    }

    public double getimporteAdicional() {
        return importeAdicional;
    }

    public Automotor() {

    }

    public Automotor(int patente, String descripcion, double importeAdicional, int anio, double importe,
            Propietario propietario) {
        super(anio, importe, propietario);
        this.setpatente(patente);
        this.setdescripcion(descripcion);
        this.setimporteAdicional(importeAdicional);

    }

    public String toString() {
        String aux = super.toString();
        return (aux + "\n Automotor{" + "patente=" + patente + ", adicional=" + importeAdicional + ", descripcion="
                + descripcion + '}');
    }

    public double calcularImpuesto() {
        return (super.getimporte() + importeAdicional);
    }
}