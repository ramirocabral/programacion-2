import java.util.Scanner;

public class ej2 {
    public static void main (String[] args){
        double precioKg,peso;

        balanza compra = new balanza();
        Scanner in = new Scanner(System.in);
        compra.iniciarCompra();

        System.out.println("Ingrese el precio por kg: ");
        precioKg = in.nextDouble();
        System.out.println("Ingrese el peso: ");
        peso = in.nextDouble();

        while (peso != 0){
            compra.registrarProducto(precioKg,peso);
            System.out.println("Ingrese el precio por kg: ");
            precioKg = in.nextDouble();
            System.out.println("Ingrese el peso: ");
            peso = in.nextDouble();
        }

        System.out.println(compra.devolverResumenDeCompra());
    }
    

}
