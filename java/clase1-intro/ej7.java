import java.util.Scanner;
public class ej7 {
    public static void main(String[] args){
        int i,max,cant=0,tipo, tipos[] = new int [4];

        Scanner in = new Scanner(System.in);
        System.out.println("Ingrese:");
        System.out.println("0 : cobro de cheque");
        System.out.println("1 : deposito/extraccion");
        System.out.println("2 : pago de impuestos o servicio");
        System.out.println("3 : cobro de jubilacion");
        System.out.println("4 : cobro de planes");
        System.out.println("Ingrese el tipo de operacion: ");
        tipo = in.nextInt();
        while (tipo != 999){
            cant++;
            tipos[tipo]=tipos[tipo]+1;
            System.out.println("Ingrese el tipo de operacion: ");
            tipo = in.nextInt();
        }

        max=0;

        for (i=0; i<4; i++){
            if (tipos[i]>max){
                max=i;
            }
        }

        System.out.println("El tipo de operacion mas frecuente es: " + max);
    }
}
