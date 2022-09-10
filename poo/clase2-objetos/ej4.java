import java.util.Scanner;

public class ej4 {
    
    public static void Cargar (Partido[] v){
        int i,gL,gV;
        String l,visitante;
        Scanner in = new Scanner (System.in);

        for (i=0; i<=2; i++){
            System.out.println("Ingrese el nombre del equipo local: ");
            l = in.next();
            System.out.println("Ingrese los goles del equipo local: ");
            gL = in.nextInt();
            System.out.println("Ingrese el nombre del equipo visitante: ");
            visitante = in.next();
            System.out.println("Ingrese los goles del equipo visitante: ");
            gV = in.nextInt();
            v[i] = new Partido(l,visitante,gL,gV);
        }
    }
    
    public static int GanadosRiber (Partido[] v){
        int i,aux=0;
        String ganador = " ";
        for (i=0; i<=2; i++){
            ganador = v[i].getGanador();
            if (ganador.equals("River")){
                aux++;
            }    
        }
        return aux;
    }


    public static int GolesBoquita (Partido[] v){
        int i,cant=0,goles=0;
        for (i=0; i<=2; i++){
            if (v[i].getLocal().equals("Boca")){
                goles = v[i].getGolesLocal();
                cant = cant + goles;
            }
        }        
        return cant;
    }


    public static double Empates(Partido[] v){
        int i,cant=0;
        boolean empatado=false;
        for (i=0; i<=2; i++){
            empatado = v[i].hayEmpate();
            if (empatado){
                cant++;
            }
        }
        return (cant*100/3);
        } 

    public static void main (String[] args){
        Partido[] vector = new Partido[3];
        Cargar(vector);
        System.out.println("Partidos ganador por Riber: "+GanadosRiber(vector));
        System.out.println("Cantidad de goles de boca jugando de local: " +GolesBoquita(vector));
        System.out.println("Porcentaje de partidos finalizados con empate: " +Empates(vector));
        }
    }

