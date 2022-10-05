import java.util.Scanner;

public class ej1 {
    
    public static void puntoA (Persona[] v){
        int edad,dni,i;
        String nombre;
        Scanner in = new Scanner (System.in);
        for (i=0; i<15; i++){
            System.out.println("Ingrese el nombre de la persona");
            nombre = in.next();
            System.out.println("Ingrese la edad de la persona");
            edad = in.nextInt();
            System.out.println("Ingrese el dni de la persona");
            dni = in.nextInt();
            v[i] = new Persona(nombre,edad,dni);
        }
    }

    public static int puntoB (Persona[] v){
        int i, cant;
        cant = 0;
        for (i=0; i<15; i++){
            if (v[i].getEdad() > 65){
                cant++;
            }
        }
        return cant;
    }

    public static String puntoC (Persona[] v){
        int i,menor = 99999999,num;
        String aux = " ";
        for (i=0; i<15; i++){
            num = v[i].getDNI();
            if (num < menor){
                menor=num;
                aux= v[i].toString();
            }
        }
        return aux;
    }

    public static void main (String[] args){
        Persona[] vector;
        vector = new Persona[15];
        puntoA(vector);
        System.out.println(puntoB(vector));
        System.out.println(puntoC(vector));
        }
}

