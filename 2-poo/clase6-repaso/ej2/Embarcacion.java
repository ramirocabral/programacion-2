public class Embarcacion extends Vehiculo{
    private String REY;
    private String nom;
    private String tipo;
    private double eslora;
    private double peso;
    private double valor;
    
    public Embarcacion (String REY, String nom, String tipo, double eslora, double peso, double valor, int anio, double importe, Propietario propietario){
        super(anio, importe, propietario);
        this.setREY(REY);
        this.setNom(nom);
        this.setTipo(tipo);
        this.setEslora(eslora);
        this.setPeso(peso);
        this.setValor(valor);
    }

    public void setREY(String REY) {
        this.REY = REY;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public void setEslora(double eslora) {
        this.eslora = eslora;
    }

    public void setPeso(double peso) {
        this.peso = peso;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }

    public String getREY() {
        return REY;
    }

    public String getNom() {
        return nom;
    }

    public String getTipo() {
        return tipo;
    }

    public double getEslora() {
        return eslora;
    }

    public double getPeso() {
        return peso;
    }

    public double getValor() {
        return valor;
    }

    public double calcularImpuestos(){
        if (valor <= 6000) 
            return(valor*4/100);
        else if (valor >= 180000) 
            return (valor*2/100);
        return (valor*5/100);
    }

    public String toString(){
        String aux = super.toString();
        return (aux + "\n Embarcacion{" + "REY=" + REY + ", nom=" + nom + ", tipo=" + tipo + ", eslora=" + eslora + ", peso=" + peso + ", valor=" + valor + '}');
    }
}
