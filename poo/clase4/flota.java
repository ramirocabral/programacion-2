public class flota {
    private micro micros [] = new micro [15];
    private int cantidadMicros;

    public flota(){
        for (int i=0; i<15; i++){
            micros[i] = null;
        }
        cantidadMicros=0;
    }

    public boolean flotaCompleta(){
        if (cantidadMicros == 15){
            return true;
        }
        else{
            return false;
        }
    }

    public void agregarMicro(micro Micro){
            micros[cantidadMicros] = Micro;
            cantidadMicros++;
    }

    public void eliminarMicro(String patente){
        int i = 0;
        if (buscarMicro(patente) != null){
            while ((i <= cantidadMicros) && (!(micros[i].getPatente().equals(patente)))){
                i++;
            }
            if (i <= cantidadMicros){
                for (int j = i; j < cantidadMicros; j++){
                    micros[j] = micros[j+1];
                }
                cantidadMicros--;
            }
        }
    }

    public micro buscarMicro(String patente){
        int i = 0;
        while ((i < cantidadMicros) && (!(micros[i].getPatente().equals(patente)))){
            i++;
        }
        if (i < 15){
            return micros[i];
        }
        else{
            return null;
        }
    }

    public micro buscarDestino (String destino){
        int i = 0;
        while ((i < cantidadMicros) && (!(micros[i].getDestino().equals(destino)))){
            i++;
        }
        if (i < 15){
            return micros[i];
        }
        else{
            return null;
        }
    }

}
