import java.util.Scanner;

public class ej2 {
    public static void main (String[] args){
        int patente,validos,total;
        System.out.print("Ingrese la patente del vehiculo: ");
        Scanner in = new Scanner (System.in);
        patente = in.nextInt();
        validos = 0;
        total = 0;
        while (patente != 0) {
            if (patente % 2 == 0) {
                System.out.println("El vehiculo con patente " + patente + " puede circular");
                validos ++;
            } else {
                System.out.println("El vehiculo con patente " + patente + " no puede circular");
            }
            total++;
            System.out.print("Ingrese la patente del vehiculo: ");
            patente = in.nextInt();
        }
        in.close();
        System.out.println("Porcentaje de vehiculos que ingresaron: " + (validos*total/100));
    }
}
