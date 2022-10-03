public abstract class Solicitud {
    private String numGestion;
    private String fecha;
    private double ingresosMensuales;
    private int cantIntregrantes;
    private String region;
    private Persona persona;


    public Solicitud(String numGestion, String fecha, double ingresosMensuales, int cantIntregrantes, String region, Persona persona) {
        this.numGestion = numGestion;
        this.fecha = fecha;
        this.ingresosMensuales = ingresosMensuales;
        this.cantIntregrantes = cantIntregrantes;
        this.region = region;
        this.persona = persona;
    }

    public Solicitud(){
    }

    public String getNumGestion() {
        return numGestion;
    }

    public void setNumGestion(String numGestion) {
        this.numGestion = numGestion;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public double getIngresosMensuales() {
        return ingresosMensuales;
    }

    public void setIngresosMensuales(double ingresosMensuales) {
        this.ingresosMensuales = ingresosMensuales;
    }

    public int getCantIntregrantes() {
        return cantIntregrantes;
    }

    public void setCantIntregrantes(int cantIntregrantes) {
        this.cantIntregrantes = cantIntregrantes;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public Persona getPersona() {
        return persona;
    }

    public void setPersona(Persona persona) {
        this.persona = persona;
    }

    public double calcularTarifaCompleta(){
        return (ingresosMensuales*5/100);
    }

    public String ToString (){
        String aux = persona.ToString();
        return (aux+" -- Numero de gestion: "+numGestion+" - Fecha: "+fecha+" - Ingresos mensuales: "+ingresosMensuales+" - Cantidad de integrantes: "+cantIntregrantes+" - Region: "+region);

    }


    abstract double calcularSubsidio();
    abstract boolean puedeAccederSolicitud();
}
