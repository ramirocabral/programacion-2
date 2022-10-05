program VectorOrdenado;

const
    dimF = 8;  {Dimensi�n f�sica del vector}

type

    vector = array [1..dimF] of integer;

    dim = 0..dimF;

{-----------------------------------------------------------------------------
CARGARVECTORORDENADO - Carga ordenadamente nros aleatorios entre 0 y 100 en el
vector hasta que llegue el nro 99 o hasta que se complete el vector}

Procedure cargarVectorOrdenado ( var vec: vector; var dimL: dim);
var
   d, pos, j: integer;
begin
    Randomize;  { Inicializa la secuencia de random a partir de una semilla}
    dimL := 0;
    d:= random(100);
    while (d <> 99)  and ( dimL < dimF ) do begin
       pos:= 1;
       while (pos <= dimL) and (vec[pos]< d) do pos:= pos + 1;
       for  j:= dimL downto pos do vec[j+1]:= vec[j] ;
       vec[pos]:= d;
       dimL := dimL + 1;
       d:= random(100)
     end;
end;

{-----------------------------------------------------------------------------
IMPRIMIRVECTOR - Imprime todos los nros del vector }

Procedure imprimirVector ( var vec: vector; var dimL: dim );
var
   i: dim;
begin
     for i:= 1 to dimL do
         write ('-----');
     writeln;
     write (' ');
     for i:= 1 to dimL do begin
        if(vec[i] < 9)then
            write ('0');
        write(vec[i], ' | ');
     end;
     writeln;
     for i:= 1 to dimL do
         write ('-----');
     writeln;
     writeln;
End;

//-----------------------------------------------------------------------------------------------------

{Busqueda Binaria}


function busquedaBin(v:vector; num,pri,ult:integer):boolean;

var i:integer;

begin
    i:=(pri+ult) div 2;
    if (v[i]=num) then
        busquedaBin:=true
    else
    if (pri = ult) then
        busquedaBin := false
    else
        if (num < v[i]) then
            busquedaBin := busquedaBin(v,num,pri,i-1)
        else
            busquedaBin := busquedaBin(v,num,i+1,ult);
end;        

{PROGRAMA PRINCIPAL}
var
   v: vector;
   dimL : dim;
   num,pri,ult,i:integer;

begin
    cargarVectorOrdenado(v,dimL);
    pri:=1;
    ult:=dimL;
    writeln('Nros almacenados: ');
    imprimirVector(v, dimL);
    Writeln('Ingrese el numero a buscar en el vector: ');
    Readln(num);
    if (busquedaBin(v,num,pri,ult) = true) then
        Writeln(num,' se encuentra en el vector.')
    else
        Writeln(num,' no se encuentra en el vector');
end.