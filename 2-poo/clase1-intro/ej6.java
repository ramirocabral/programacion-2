import java.util.Scanner;
public class ej6 {
    public static void main(String[] args){
        int fila,columna,i,j,num=0,sum,sum2,buscar,m[][]= new int [10][10], v[]=new int [10];
        boolean exito;

        //inicializar la matriz

        for (i=0; i<10; i++){
            for (j=0; j<10; j++){
                m[i][j]=num;
                num=num+2;
            }
        }

        //imprimir el contenido de la matriz

        System.out.println("Contenido de la matriz: ");
        for (i=0; i<10; i++){
            for (j=0; j<10; j++){
                System.out.print(m[i][j] + "|");
            }
            System.out.println();
        }

        //sumar los elementos entre las filas 2 y 9 y las columnas 0 y 3

        sum=0;
        for (i = 2; i <= 9; i++) {
            for (j = 0; j <= 3; j++) {
                sum = sum + m[i][j];
            }
        }

        System.out.println("Suma: " + sum);

        for (i=0; i<10; i++){
            sum2=0;
            for (j=0; j<10; j++){
                sum2=sum2+m[i][j];
            }   
            v[i]=sum2;
        }

        //imprimir vector

        for (i=0; i<10; i++){
            System.out.println("v[" + i + "]=" + v[i]);
        }

        System.out.println("Ingrese el numero a buscar en la matriz: ");

        Scanner in = new Scanner(System.in);
        buscar = in.nextInt();

        exito=false;

        i=0;
        fila=0;
        columna=0;

        while (i<10 && !exito){
            j=0;
            while (j<10 && !exito){
                if (m[i][j]==buscar){
                    exito=true;
                    fila=i;
                    columna=j;
                }
                j++;
            }
            i++;
        }

        if (exito){
            System.out.println("El numero " + buscar + " se encuentra en la matriz");
            System.out.println("Fila: " + fila + " Columna: " + columna);
        }
        else{
            System.out.println("El numero" + buscar + "no se encuentra en la matriz");
        }
    }
}
