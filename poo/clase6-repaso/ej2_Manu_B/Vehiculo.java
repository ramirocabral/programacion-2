
public abstract class Vehiculo {
    private int anio;
    private double importe;
    private Propietario propietario;

    public void setpropietario(Propietario propietario) {
        this.propietario = propietario;
    }

    public void setanio(int anio) {
        this.anio = anio;
    }

    public void setimporte(double importe) {
        this.importe = importe;
    }

    public int getanio() {
        return anio;
    }

    public double getimporte() {
        return importe;
    }

    public Propietario getpropietario() {
        return propietario;
    }

    public Vehiculo() {

    }

    public Vehiculo(int año, double importe, Propietario propietario) {
        this.setanio(anio);
        this.setimporte(importe);
        this.setpropietario(propietario);
    }

    public String toString() {
        String aux = propietario.toString();
        return (aux + '\n' + "Vehiculo: " + "anio=" + anio + ", importe=" + importe);
    }

    public abstract double calcularImpuesto();

}
