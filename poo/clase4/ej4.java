import java.util.Scanner;

public class ej4{
    public static void main (String[] args){
        micro Micro = new micro();
        String patente=" ",destino=" ",salida=" ";
        flota Flota = new flota();
        Scanner in = new Scanner (System.in);
        System.out.println("Ingrese la patente: ");
        patente = in.next();
        System.out.println(patente);
        if (!(patente.equals("ZZZ000"))){
            System.out.println("Ingrese el destino: ");
            destino = in.next();
            System.out.println("Ingrese la hora de salida: ");
            salida = in.next();
            Micro = new micro (patente,destino,salida);
            leerAsientos(Micro);
            }
        while ((!(patente.equals("ZZZ000"))) && (!(Flota.flotaCompleta()))){
            Flota.agregarMicro(Micro);
            System.out.println("Ingrese la patente: ");
            patente = in.next();
            System.out.println(patente);
            if (!(patente.equals("ZZZ000"))){
                System.out.println("Ingrese el destino: ");
                destino = in.next();
                System.out.println("Ingrese la hora de salida: ");
                salida = in.next();
                Micro = new micro (patente,destino,salida);
                leerAsientos(Micro);
            }
        }

        patente = in.next();

        Flota.eliminarMicro(patente);

        destino = in.next();

        Micro = Flota.buscarDestino(destino);

        if (Micro !=null){
            System.out.println(Micro.getPatente());
            System.out.println(Micro.getSalida());
        }
        else{
            System.out.println("No hay micros con destino a "+destino);
        }
    }

    public static void leerAsientos(micro Micro){
        Scanner in = new Scanner (System.in);
        int asiento=0;
        System.out.println("Ingrese el asiento que desea ocupar: ");
        asiento = in.nextInt()-1;
        while ((asiento != -2 )&& (!(Micro.estaLleno()))){
        if (Micro.validarAsiento(asiento)){
            if (Micro.estadoAsiento(asiento)){
                System.out.println("El asiento "+(asiento+1) +" ya esta ocupado");
            }
            else{
                Micro.ocuparAsiento(asiento);
                System.out.println("Asiento "+(asiento+1) +" ocupado");
            }
        }
        else{
            System.out.println("El asiento "+(asiento+1)+" no existe");
        }
        System.out.println("Ingrese el asiento que desea ocupar: ");
        asiento = in.nextInt()-1;
        }
    }


    }
