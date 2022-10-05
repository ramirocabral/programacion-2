import java.util.Scanner;

public class ej5 {
    public static void main (String[] args){
        String[] array = new String[10];
        Scanner in = new Scanner (System.in);
        int i;

        for (i=0; i<=9; i++){
            System.out.println("Ingrese el string en la posicion "+(i+1));
            array[i] = in.next();
        }
        System.out.println("Palabra generada: ");

        for (i=0; i<=9; i++){
            System.out.print(array[i].charAt(0));
        }
    }
}
