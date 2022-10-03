public class Energia extends Solicitud{
    private int NIS;
    private int cantElectrodomesticos;

    public  Energia (String numGestion, String fecha, double ingresosMensuales, int cantIntregrantes, String region, Persona persona, int NIS, int cantElectrodomesticos) {
        super(numGestion, fecha, ingresosMensuales, cantIntregrantes, region, persona);
        this.NIS = NIS;
        this.cantElectrodomesticos = cantElectrodomesticos;
    }


    public int getNIS() {
        return NIS;
    }

    public void setNIS(int NIS) {
        this.NIS = NIS;
    }

    public int getCantElectrodomesticos() {
        return cantElectrodomesticos;
    }

    public void setCantElectrodomesticos(int cantElectrodomesticos) {
        this.cantElectrodomesticos = cantElectrodomesticos;
    }

    public double calcularSubsidio(){
        double aux = super.getIngresosMensuales();
        
        if (aux > 300000){
            return (500*cantElectrodomesticos);
        }
        else if (aux > 150000){
            return (100*cantElectrodomesticos/2+(aux*2/100));
        }
        return ((1.5*aux/100)+(400*super.getCantIntregrantes()));
    }

    public boolean puedeAccederSolicitud(){
        double aux = super.getIngresosMensuales();
        double cant = super.getCantIntregrantes();

        if (aux/cant < (aux*45/100)) 
            return true;
        return false;
    }

    public String ToString(){
    String aux= super.ToString();
    return (aux+ "\n"+ " - Nis: " + NIS +" - Cantidad de electrodomesticos: " + cantElectrodomesticos);
    }

}