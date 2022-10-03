public class Gas extends Solicitud{
    private int numMedidor;
    private double tamanioHogar;
    private int cantAparatos;

    public Gas(String numGestion, String fecha, double ingresosMensuales, int cantIntregrantes, String region, Persona persona, int numMedidor, double tamanioHogar, int cantAparatos) {
        super(numGestion, fecha, ingresosMensuales, cantIntregrantes, region, persona);
        this.numMedidor = numMedidor;
        this.tamanioHogar = tamanioHogar;
        this.cantAparatos = cantAparatos;
    }

    public Gas(){
    }

    public int getNumMedidor() {
        return numMedidor;
    }

    public void setNumMedidor(int numMedidor) {
        this.numMedidor = numMedidor;
    }

    public double getTamanioHogar() {
        return tamanioHogar;
    }

    public void setTamanioHogar(double tamanioHogar) {
        this.tamanioHogar = tamanioHogar;
    }

    public int getCantAparatos() {
        return cantAparatos;
    }

    public void setCantAparatos(int cantAparatos) {
        this.cantAparatos = cantAparatos;
    }

    public double calcularSubsidio(){
        double aux = super.getIngresosMensuales();
        
        if (aux > 300000){
            return (250*(tamanioHogar/2) + (750*cantAparatos));
        }
        else if (aux > 150000){
            return (100*(tamanioHogar/3)+(500*cantAparatos));
        }
        return ((aux*2/100)+1000);
    }

    public boolean puedeAccederSolicitud(){
        double aux = super.getIngresosMensuales();
        double cant = super.getCantIntregrantes();

        if ((((aux/cant)+cantAparatos)) < (aux*40/100))
            return true;
        return false;
    }


    public String ToString(){
    String aux = super.ToString();
    return (aux +"\n"+ " - Numero de Medidor: " + numMedidor +  " - Tamaño del Hogar: " + tamanioHogar + " - Cantidad de Aparatos: " + cantAparatos);
    }

}
