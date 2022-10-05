import java.util.Scanner;

public class ej1 {
    public static void main (String[] args){
        double l1,l2,l3,area,perimetro;
        String r,li;

        triangulos t = new triangulos();

        Scanner in = new Scanner(System.in);
        System.out.println("Ingrese el lado 1 :");
        l1 = in.nextDouble();
        t.setLado1(l1);
        System.out.println("Ingrese el lado 2 :");
        l2 = in.nextDouble();
        t.setLado2(l2);
        System.out.println("Ingrese el lado 3 :");
        l3 = in.nextDouble();
        t.setLado3(l3);
        
        area = t.calcularArea();
        System.out.println("Area : "+area);

        perimetro = t.calcularPerimetro();
        System.out.println("Perimetro : "+perimetro);
    }
}
