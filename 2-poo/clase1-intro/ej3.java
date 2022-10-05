import java.util.Scanner;

public class ej3 {
    public static void main(String[] args){
        int i,num,factorial=1;
        System.out.print("Ingrese un numero: ");
        Scanner in = new Scanner(System.in);
        num = in.nextInt();
        in.close();
        for (i=num; i>0 ; i--){  
            factorial = factorial * i;
        }
        System.out.print("El factorial de "+num+" es: "+factorial);
    }
}
