import java.util.Scanner;

public class Main{
    public static void main (String [] args){
        Scanner in = new Scanner (System.in);
        Solicitud [] solicitudes = new Solicitud[5];
        Persona persona;
        int cantIntegrantes; //solicitud
        String numGestion,fecha,region;
        double ingresosMensuales;
        int numMedidor,cantAparatos; //gas
        double tamanioHogar;
        int nis,cantElectrodomesticos;//energia
        int opcion;

        for (int i = 0; i<=4;i++){
            System.out.println("Ingrese 1 para subsidio de gas, 2 para subsidio de energia");
            opcion = in.nextInt();
            System.out.println("Ingrese numero de gestion");
            numGestion = in.next();
            System.out.println("Ingrese fecha");
            fecha = in.next();
            System.out.println("Ingrese ingresos mensuales");
            ingresosMensuales = in.nextDouble();
            System.out.println("Ingrese cantidad de integrantes");
            cantIntegrantes = in.nextInt();
            System.out.println("Ingrese region");
            region = in.next();
            persona = leerPersona();
            if (opcion == 1){ //gas
                System.out.println("Ingrese numero de medidor");
                numMedidor = in.nextInt();
                System.out.println("Ingrese el tamanio del hogar");
                tamanioHogar = in.nextDouble();
                System.out.println("Ingrese cantidad de aparatos");
                cantAparatos = in.nextInt();
                solicitudes[i] = new Gas(numGestion,fecha,ingresosMensuales,cantIntegrantes,region,persona,numMedidor,tamanioHogar,cantAparatos);
            }
            else{ // energia
                System.out.println("Ingrese numero de identificacion de servicio");
                nis = in.nextInt();
                System.out.println("Ingrese cantidad de electrodomesticos");
                cantElectrodomesticos = in.nextInt();
                solicitudes[i] = new Energia(numGestion,fecha,ingresosMensuales,cantIntegrantes,region,persona,nis,cantElectrodomesticos);
            }
            }

            for (int j=0; j<=4;j++){
                double ingreso = solicitudes[j].getIngresosMensuales();
                String Region = solicitudes[j].getRegion();
                System.out.println("Solicitud 1: \n");
                System.out.println(solicitudes[j].ToString()+"\n");
                if (TarifasNacionalesPorRegion.puedeAccederAlSubsidio(ingreso,Region)){ //si puede acceder en la region
                    if (solicitudes[j].puedeAccederSolicitud()){ //si cumple con los requisitos
                        System.out.println("Puede acceder al subsidio. El subsidio es de: "+solicitudes[j].calcularSubsidio());
                    }
                    else{
                        System.out.println("No puede acceder al subsidio, tarifa total: "+solicitudes[j].calcularTarifaCompleta());
                    }
                }
                else System.out.println("No puede acceder al subsidio, tarifa total: "+solicitudes[j].calcularTarifaCompleta());
            }
        }



    public static Persona leerPersona(){
        Scanner scan = new Scanner (System.in);
        String nom;
        String ape;
        int cuit;
        Persona aux;

        System.out.println("Ingrese el nombre de la persona: ");
        nom = scan.next();
        System.out.println("Ingrese el apellido de la persona: ");
        ape = scan.next();
        System.out.println("Ingrese el cuit de la persona: ");
        cuit = scan.nextInt();
        aux = new Persona (nom,ape,cuit);
        return (aux);
    }

}


