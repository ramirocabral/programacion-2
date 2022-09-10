import java.util.Scanner;

public class ej5 {
    public static void main(String[] args){
        int i,prom,total,cant,alturas []= new int[15];
        Scanner in = new Scanner(System.in);
        for (i=0;i<15;i++){
            System.out.println("Introduzca la altura del jugador:");
            alturas[i] = in.nextInt();
        }
        in.close();
        total = 0;
        cant=0;
        for (i=0;i<15;i++){
            total = total + alturas[i];
        }    
        prom = total/15;
        System.out.println("La altura promedio es " + prom);
        for (i=0;i<15;i++){
            if (alturas[i] > prom){
                cant = cant + 1;
            }
        }
        System.out.println("La cantidad de jugadores que superan la altura promedio es " + cant);
}
}