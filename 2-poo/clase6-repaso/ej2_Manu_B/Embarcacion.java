
public class Embarcacion extends Vehiculo {
    private String REY;
    private String nombre;
    private String tipo;
    private double longitud;
    private double tonelaje;
    private double valor;
    private int que;

    public void setREY(String REY) {
        this.REY = REY;
    }

    public void setnombre(String nombre) {
        this.nombre = nombre;
    }

    public void settipo(String tipo) {
        this.tipo = tipo;
    }

    public void setlongitud(double longitud) {
        this.longitud = longitud;
    }

    public void settonelaje(double tonelaje) {
        this.tonelaje = tonelaje;
    }

    public void setvalor(double valor) {
        this.valor = valor;
    }

    public String getnombre() {
        return nombre;
    }

    public String getREY() {
        return REY;
    }

    public String gettipo() {
        return tipo;
    }

    public double getlongitud() {
        return longitud;
    }

    public double gettonelaje() {
        return tonelaje;
    }

    public double getvalor() {
        return valor;
    }

    public Embarcacion() {

    }

    public Embarcacion(String REY, String nombre, String tipo, double longitud, double tonelaje, double valor, int anio,
            double importe, Propietario propietario) {
        super(anio, importe, propietario);
        this.setREY(REY);
        this.setnombre(nombre);
        this.settipo(tipo);
        this.setlongitud(longitud);
        this.settonelaje(tonelaje);
        this.setvalor(valor);

    }

    public String toString() {
        String aux = super.toString();
        return (aux + "\n Embarcacion{" + "REY=" + REY + ", nom=" + nombre + ", tipo=" + tipo + ", eslora=" + longitud
                + ", peso=" + tonelaje + ", valor=" + valor + '}');
    }

    public double calcularImpuesto() {
        if (valor <= 6000) {
            return (valor / 100) * 4;
        }
        if (valor <= 180000) {
            return (valor / 100) * 2;
        }
        if (valor > 180000) {
            return (valor / 100) * 5;

        }
        return 0;
    }
}
