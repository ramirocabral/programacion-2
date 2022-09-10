import java.util.Scanner;

public class ej1 {
    public static void main(String[] args) {
        int a,b,c;
        Scanner in = new Scanner  (System.in);
        System.out.print("Ingrese el valor de a: ");
        a = in.nextInt();
        System.out.print("Ingrese el valor de b: ");
        b = in.nextInt();
        System.out.print("Ingrese el valor de c: ");
        c = in.nextInt();
        in.close();

        if ((a < (b+c)) && (b < (a+c)) && (c < (a+b))) {
            System.out.println("Los valores ingresados corresponden a un triangulo");
            System.out.println("El perimetro del triangulo es: " + (a+b+c));}
         else {
            System.out.println("Los valores ingresados no corresponden a un triangulo");
         }
    }     
}
