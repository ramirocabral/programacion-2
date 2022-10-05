import java.util.Scanner;

public class ProgramaEditorial {

    public static Ejemplar cargarLibro (){
        int cod=0,cantPaginas=0,anio=0,dni=0,cantCapitulos=0;
        String resumen=" ",nombreApellido=" ",titulo=" ";
        boolean esDeBolsillo=false;
        Scanner in = new Scanner (System.in);
        System.out.println("Ingrese el codigo del ejemplar: ");
        cod = in.nextInt();
        System.out.println("Ingrese la cantidad de paginas: ");
        cantPaginas = in.nextInt();
        System.out.println("Ingrese el resumen: ");
        resumen = in.next();
        System.out.println("Ingrese el anio: ");
        anio = in.nextInt();
        System.out.println("Ingrese el DNI del responsable: ");
        dni = in.nextInt();
        System.out.println("Ingrese el nombre y apellido del responsable: ");
        nombreApellido = in.next();
        System.out.println("Ingrese el titulo del libro: ");
        titulo = in.next();
        System.out.println("Ingrese la cantidad de capitulos: ");
        cantCapitulos = in.nextInt();
        System.out.println("Es de bolsillo? (true/false): ");
        esDeBolsillo = in.nextBoolean();
        Ejemplar ejemplar = new Libro (cod,cantPaginas,resumen,anio,titulo,cantCapitulos,esDeBolsillo,nombreApellido,dni);
        return ejemplar;
    }


    public static Ejemplar cargarRevista (){
        int cod=0,cantPaginas=0,anio=0,dni=0,cantArticulos=0;
        String resumen=" ",nombreApellido=" ",nombre=" ";
        Scanner in = new Scanner (System.in);
        System.out.println("Ingrese el codigo del ejemplar: ");
        cod = in.nextInt();
        System.out.println("Ingrese la cantidad de paginas: ");
        cantPaginas = in.nextInt();
        System.out.println("Ingrese el resumen: ");
        resumen = in.next();
        System.out.println("Ingrese el anio: ");
        anio = in.nextInt();
        System.out.println("Ingrese el DNI del responsable: ");
        dni = in.nextInt();
        System.out.println("Ingrese el nombre y apellido del responsable: ");
        nombreApellido = in.next();
        System.out.println("Ingrese el nombre de la revista: ");
        nombre = in.next();
        System.out.println("Ingrese la cantidad de articulos: ");
        cantArticulos = in.nextInt();
        Ejemplar ejemplar = new Revista(cod,cantPaginas,resumen,anio,nombre,cantArticulos,nombreApellido,dni);
        return (ejemplar);
    }

    public static void main (String[] args){
        Ejemplar [] ejemplares = new Ejemplar [3];
        Scanner in = new Scanner (System.in);

        for (int i=0 ; i<=2; i++){
            System.out.println("Ingrese 1 para libro, 2 para revista.");
            int opcion = in.nextInt();
            if (opcion == 1){
                ejemplares[i] = cargarLibro();
            } else if (opcion == 2){
                ejemplares[i] = cargarRevista();
            }   

        }

        System.out.println("Terminado de cargar");

        for (int j=0 ; j<=2; j++){
            System.out.println(ejemplares[j].toString());
        }
}

}