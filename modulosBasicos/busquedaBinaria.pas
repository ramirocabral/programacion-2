

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
    pri:=1;
    ult:=dimL;
    Writeln('Ingrese el numero a buscar en el vector: ');
    Readln(num);
    if (busquedaBin(v,num,pri,ult) = true) then
        Writeln(num,' se encuentra en el vector.')
    else
        Writeln(num,' no se encuentra en el vector');
end.