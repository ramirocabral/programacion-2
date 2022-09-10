import java.util.Scanner;
public class ej8 {
    public static void main (String[] args){
        int puntajes[]=new int [4], i,j,punt,sum;

        Scanner in = new Scanner (System.in);


        for (i=0; i<3; i++){
            puntajes[i]=0;
        }

        for (i=1; i<=5; i++){
            for (j=0; j<=3; j++){
                System.out.println("Ingrese el puntaje del servicio " + j);
                punt = in.nextInt();
                puntajes[j]=puntajes[j]+punt;
            }
        }

        sum=0;

        for (j=0; j<=3; j++){
            sum=sum+puntajes[j];
        }

        System.out.println("El puntaje promedio es: " + sum/4);
    }
}
