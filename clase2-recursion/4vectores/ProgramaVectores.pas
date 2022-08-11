program Arreglos;

const
    dimF = 8;  {Dimensi�n f�sica del vector}

type

    vector = array [1..dimF] of LongInt;

    dim = 0..dimF;


{-----------------------------------------------------------------------------
CARGARVECTOR - Carga nros aleatorios entre 0 y 100 en el vector hasta que
llegue el nro 99 o hasta que se complete el vector}
Procedure cargarVector ( var vec: vector; var dimL: dim);
var
   d: integer;
begin
     Randomize;  { Inicializa la secuencia de random a partir de una semilla}
     dimL := 0;
     d:= random(100);
     while (d <> 99)  and ( dimL < dimF ) do begin
           dimL := dimL + 1;
           vec[dimL] := d;
           d:= random(100);
     end;
End;

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

{----------------------------------Fin de se dispone--------------------------------}

//Funcion para encontrar el maximo valor en un vector, se considera que no esta sorteado

function maximo (v:vector; i,dimL:integer):integer;

begin
    if (dimL <> 0) then
        if (i = dimL) then
            maximo := v[i]
        else
            if (v[i] > maximo(v,i+1,dimL))
                then maximo := v[i]
            else 
                maximo := maximo(v,i+1,dimL);
end;    

{PROGRAMA PRINCIPAL}
var
   v: vector;
   dimL : dim;
   pri,ult,i:integer;

begin

     cargarVector(v,dimL);
     writeln('Nros almacenados: ');
     imprimirVector(v, dimL);
    Writeln(maximo(v,i,dimL));
end.
