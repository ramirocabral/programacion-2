import java.util.Scanner;

public class ej1 {
    public static void main(String[] args){
    String nombre=" ";
    double sueldo=0;
    int edad=0,DNI=0,goles=0,partidos=0,campeonatos=0;

    Scanner in = new Scanner(System.in);

    System.out.println("Generar jugador: ");

    Scanner asd = new Scanner(System.in);
        System.out.println("Ingrese el nombre del empleado: ");
        nombre = asd.next();
        System.out.println("Ingrese el sueldo del empleado: ");
        sueldo = asd.nextDouble();
        System.out.println("Ingrese la edad del empleado: ");
        edad = asd.nextInt();
        System.out.println("Ingrese el DNI del empleado: ");
        DNI = asd.nextInt();

    System.out.println("Ingrese la cantidad de goles: ");

    goles = in.nextInt();

    System.out.println("Ingrese la cantidad de partidos: ");

    partidos = in.nextInt();

        System.out.println("Ingrese el nombre del empleado: ");
        nombre = asd.next();
        System.out.println("Ingrese el sueldo del empleado: ");
        sueldo = asd.nextDouble();
        System.out.println("Ingrese la edad del empleado: ");
        edad = asd.nextInt();
        System.out.println("Ingrese el DNI del empleado: ");
        DNI = asd.nextInt();

    Jugador jugador = new Jugador (nombre,DNI,edad,sueldo,partidos,goles);

    System.out.println("Generar entrenador: ");

    System.out.println("Ingrese la cantidad de campeonatos: ");

    campeonatos = in.nextInt();


    Entrenador entrenador = new Entrenador (nombre,DNI,edad,sueldo,campeonatos);

    System.out.println("Jugador: " + jugador.toString());

    System.out.println("Entrenador: " + entrenador.toString());

    }

}
