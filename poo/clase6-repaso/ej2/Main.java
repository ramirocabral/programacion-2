import java.util.Scanner;

public class Main{

    public static void main(String[] args){
        Scanner scan = new Scanner(System.in);
        String nombre,apellido; //Propietario
        int CIT;
        int anio;    //Vehiculo
        double importe;
        Propietario propietario;
        int patente;    //Automotor
        double adicional;
        String descripcion;
        String REY,nom,tipo;    //Embarcacion
        double eslora,peso,valor;
        int opcion,pos=0; //Menu

        Vehiculo[] vehiculos = new Vehiculo[3];

        System.out.println("Ingrese el numero de la opcion que desea realizar");
        System.out.println("1. Ingresar un Automotor");
        System.out.println("2. Ingresar una Embarcacion");
        System.out.println("0. Salir");

        opcion = scan.nextInt();

        while ((opcion !=0) && (pos < 3)){
            System.out.println("Ingrese el CIT del propietario"); CIT = scan.nextInt();
            System.out.println("Ingrese el nombre del propietario"); nombre = scan.next();
            System.out.println("Ingrese el apellido del propietario"); apellido = scan.next();
            propietario = new Propietario (CIT,nombre,apellido);
            System.out.println("Ingrese el anio del vehiculo"); anio = scan.nextInt();
            System.out.println("Ingrese el importe del vehiculo"); importe = scan.nextDouble();
            if (opcion == 1){   // Automotor
                System.out.println("Ingrese la patente del automotor"); patente = scan.nextInt();
                System.out.println("Ingrese la descripcion del automotor"); descripcion = scan.next();
                System.out.println("Ingrese el adicional del automotor"); adicional = scan.nextDouble();
                vehiculos[pos] = new Automotor(patente,adicional,descripcion,anio,importe,propietario);
            }
            if (opcion == 2){   //Embarcacion
                System.out.println("Ingrese el REY de la embarcacion"); REY = scan.next();
                System.out.println("Ingrese el nombre de la embarcacion"); nom = scan.next();
                System.out.println("Ingrese el tipo de la embarcacion"); tipo = scan.next();
                System.out.println("Ingrese la eslora de la embarcacion"); eslora = scan.nextDouble();
                System.out.println("Ingrese el peso de la embarcacion"); peso = scan.nextDouble();
                System.out.println("Ingrese el valor de la embarcacion"); valor = scan.nextDouble();
                vehiculos[pos] = new Embarcacion(REY,nom,tipo,eslora,peso,valor,anio,importe,propietario);
            }
            pos++;
            System.out.println("Ingrese el numero de la opcion que desea realizar");
            System.out.println("1. Ingresar un Automotor");
            System.out.println("2. Ingresar una Embarcacion");
            System.out.println("0. Salir");
            opcion = scan.nextInt();

        }

        for (int i=0; i<pos; i++){
            System.out.println(vehiculos[i].calcularImpuestos());
        }

    }

}

