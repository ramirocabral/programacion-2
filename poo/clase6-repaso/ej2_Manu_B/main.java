
import java.util.Scanner;

public class main {

    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        String nombre;
        String apellido;
        double importe;
        String descripcion;
        double importeAdicional;
        String REY;
        String tipo;
        double longitud;
        double tonelaje;
        double valor;
        int pos, CIT, anio, opcion, patente;
        Propietario propietario;
        Vehiculo v[] = new Vehiculo[3];
        int b[] = new int[3];
        System.out.println("Ingrese el numero de la opcion que desea realizar");
        System.out.println("1. Ingresar un Automotor");
        System.out.println("2. Ingresar una Embarcacion");
        System.out.println("0. Salir");
        pos = 0;

        opcion = 0;

        opcion = scan.nextInt();
        while ((opcion != 0) && (pos < 3)) {
            System.out.println("Ingrese la Clave de Identificación tributaria");
            CIT = scan.nextInt();
            System.out.println("Ingrese el nombre del propietario");
            nombre = scan.next();
            System.out.println("Ingrese el apellido del propietario");
            apellido = scan.next();
            propietario = new Propietario(nombre, apellido, CIT);
            System.out.println("Ingrese el anio del vehiculo");
            anio = scan.nextInt();
            System.out.println("Ingrese el importe del vehiculo");
            importe = scan.nextDouble();
            if (opcion == 1) { // Automotor
                b[pos] = 1;
                System.out.println("Ingrese la patente del automotor");
                patente = scan.nextInt();
                System.out.println("Ingrese la descripcion del automotor");
                descripcion = scan.next();
                System.out.println("Ingrese el adicional del automotor");
                importeAdicional = scan.nextDouble();
                v[pos] = new Automotor(patente, descripcion, importeAdicional, anio, importe, propietario);
            }
            if (opcion == 2) { // Embarcacion
                b[pos] = 2;
                System.out.println("Ingrese el REY de la embarcacion");
                REY = scan.next();
                System.out.println("Ingrese el nombre de la embarcacion");
                nombre = scan.next();
                System.out.println("Ingrese el tipo de la embarcacion");
                tipo = scan.next();
                System.out.println("Ingrese la eslora de la embarcacion");
                longitud = scan.nextDouble();
                System.out.println("Ingrese el peso de la embarcacion");
                tonelaje = scan.nextDouble();
                System.out.println("Ingrese el valor de la embarcacion");
                valor = scan.nextDouble();
                v[pos] = new Embarcacion(REY, nombre, tipo, longitud, tonelaje, valor, anio, importe, propietario);
            }
            pos++;
            System.out.println("Ingrese el numero de la opcion que desea realizar");
            System.out.println("1. Ingresar un Automotor");
            System.out.println("2. Ingresar una Embarcacion");
            System.out.println("0. Salir");
            opcion = scan.nextInt();

        }
        for (int i = 0; i < pos; i++) {
            if (b[i] == 1) {
                System.out.println(v[i].calcularImpuesto());
            }
            if (b[i] == 2) {
                System.out.println(v[i].calcularImpuesto());
            }

        }
    }

}