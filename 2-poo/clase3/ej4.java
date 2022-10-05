import java.util.Scanner;

public class ej4 {
    public static void main (String[] args){

        jugadores[] vector = new jugadores [3];
        leerJugadores(vector);
        System.out.println("Cantidad de jugadores con mas de 100 partidos: "+cant100Partidos(vector));

    }

    public static void leerJugadores (jugadores[] v){
        int goles,partidos,dni,edad;
        String nom;
        int i;
        Scanner in = new Scanner (System.in);
        for (i=0; i<3; i++){
            System.out.println("Ingrese el nombre del jugador");
            nom = in.next();
            System.out.println("Ingrese la cantidad de goles del jugador");
            goles = in.nextInt();
            System.out.println("Ingrese la cantidad de partidos jugados del jugador");
            partidos = in.nextInt();
            System.out.println("Ingrese el DNI del jugador");
            dni = in.nextInt();
            System.out.println("Ingrese la edad del jugador");
            edad = in.nextInt();
            v[i] = new jugadores(nom,dni,edad,partidos,goles);
        }
    }

    public static int cant100Partidos (jugadores[] v){
        int i, cant;
        cant = 0;
        for (i=0; i<3; i++){
            if (v[i].getPartidos() > 100){
                cant++;
            }
        }
        return cant;
    }
}
