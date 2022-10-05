public class triangulos{
    private double lado1;
    private double lado2;
    private double lado3;
    private String relleno;
    private String linea;

    public triangulos(double lado1, double lado2, double lado3, String relleno, String linea){
        this.lado1 = lado1;
        this.lado2 = lado2;
        this.lado3 = lado3;
        this.relleno = relleno;
        this.linea = linea;
    }

    public triangulo (){
    }

    public void setLado1 (double l){
        lado1 = l;
    }

    public void setLado2 (double l2){
        lado2=l2;
    }
    public void setLado3 (double l3){
        lado3=l3;
    }

    public void setRelleno (String r){
        relleno = r;
    }
    public void setLinea (String li){
        linea = li;
    }

    public double calcularArea(){
        double s = ((lado1+lado2+lado3)/2);
        double area = Math.sqrt(s*(s-lado1)*(s-lado2)*(s-lado3));
        return area;
    }

    public double calcularPerimetro (){
        return (lado1+lado2+lado3);
    }

    public double getLado1 (){
        return lado1;
    }
    public double getLado2 (){
        return lado2;
    }
    public double getLado3 (){
        return lado3;
    }

    public String getRelleno(){
        return relleno;
    }

    public String getLinea(){
        return linea;
    }

}