public class ej4 {
    public static void main (String[] args){
    int i,j,num=9,factorial;
        System.out.println("Factorial del 1 hasta el 9: ");
        for (j=num+1;j>0;j--){
            factorial = 1;
            for (i=j; i>0 ; i--){  
                factorial = factorial * i;
            }
            System.out.println("El factorial de "+j+" es: "+factorial);
        }
    }
}
