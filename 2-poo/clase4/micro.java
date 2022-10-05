public class micro {
private String patente;
private String destino;
private String salida;
private boolean asientos [] = new boolean[20];
private int ocupados=0;

    public micro (String patente, String destino, String salida){
        this.setPatente(patente);
        this.setDestino(destino);
        this.setSalida(salida);
    }

    public micro(){
    
    }

    public void setPatente(String patente) {
        this.patente = patente;
    }

    public void setDestino(String destino) {
        this.destino = destino;
    }

    public void setSalida(String salida) {
        this.salida = salida;
    }

    public String getPatente() {
        return patente;
    }

    public int getAsientosOcupados (){
        return ocupados;
    }

    public String getDestino (){
        return destino;
    }

    public String getSalida (){
        return salida;
    }

    public boolean estaLleno(){
        if (ocupados == 20){
            return true;
        }
        else{
            return false;
        }
    }

    public boolean validarAsiento (int asiento){
        if ((asiento >=0) && (asiento< 20)){
            return true;
        }
        else{
            return false;
        }
    
    }

    public boolean estadoAsiento (int asiento){
        if (asientos[asiento] == true){
            return true;
        }
            return false;
    }

    public void ocuparAsiento (int asiento){
                asientos[asiento] = true;
                ocupados++;
    }

    public void liberarAsiento (int asiento){
        asientos[asiento]=false;
    }

    public int asientoLibre (){
        int i=0;
        while (i<=19){
            if (!asientos[i]){
                return (i+1);
            }
        }
        return 0;
    }

}