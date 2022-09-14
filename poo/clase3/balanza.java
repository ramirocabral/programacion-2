public class balanza{
    private double monto;
    private double items;

    public void iniciarCompra (){
        monto=0;
        items=0;
    }

    public void registrarProducto (double precioxKg, double peso){
        monto = monto + precioxKg*peso;
        items++;
    }

    public double devolverMontoAPagar(){
        return monto;
    }

    public String devolverResumenDeCompra(){
        return ("Total a pagar: "+monto+" ; por la compra de "+items+" productos.");    
    }
}