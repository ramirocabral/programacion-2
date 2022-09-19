import java.util.Scanner;

public class ej3{
    public static void main (String[] args){
        int asiento=0;
        micro Micro = new micro("ABC123","Mar del Plata","05:00");
        Scanner in = new Scanner(System.in);
        while (asiento != -2){
            System.out.println("Ingrese el asiento que desea ocupar: ");
            asiento = (in.nextInt()-1);
            if (Micro.validarAsiento(asiento)){
                if (Micro.estadoAsiento(asiento)){
                    System.out.println("El asiento "+(asiento+1) +" ya esta ocupado");
                }
                else{
                    Micro.ocuparAsiento(asiento);
                    System.out.println("Asiento "+(asiento+1) +" ocupado");
                }
            }
            else{
                System.out.println("El asiento "+(asiento+1)+" no existe");
            }
        }
        System.out.println("Cantidad de asientos ocupados: "+Micro.getAsientosOcupados());
    }

}