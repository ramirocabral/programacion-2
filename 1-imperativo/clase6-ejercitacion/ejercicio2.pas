program ejercicio2;

type

    pasajero=record
        dni:longint;
        nombreApellido:string;
        puntaje:integer;
    end;

    venta=record
        codVuelo:string;
        millas:integer;
        dni:integer;
        nombreApellido:string;
        clase:string;
    end;

    arbol=^nodoArbol;

    nodoArbol=record
        dato:pasajero;
        HI:arbol;
        HD:arbol;
    end;

procedure leerDatos (var v:venta);

begin
    with v do begin
        writeln('Ingrese el codigo de vuelo');
        readln(codVuelo);
        if (codVuelo <> 'ZZZ') then begin
            writeln('Ingrese las millas');
            readln(millas);
            writeln('Ingrese el dni');
            readln(dni);
            writeln('Ingrese el nombre y apellido');
            readln(nombreApellido);
            writeln('Ingrese la clase');
            readln(clase);
        end;
    end;
end;

function calcularPuntaje(clase:string; millas:integer):integer;

begin
    if (clase = 'ejecutiva') then
        calcularPuntaje:= 100 *millas
    else
        if (clase = 'turista') then
            calcularPuntaje:= 25*millas;
end;


procedure insertar (var a:arbol; v:venta);

begin
    if (a = nil) then 
    begin
        new(a);
        a^.dato.dni:=v.dni;
        a^.dato.nombreApellido:=v.nombreApellido;
        a^.dato.puntaje:=calcularPuntaje(v.clase, v.millas);
        a^.HI:=nil;
        a^.HD:=nil;
    end
    else 
    begin
        if (v.dni < a^.dato.dni) then
            insertar(a^.HI, v)
        else if (v.dni > a^.dato.dni) then
            insertar(a^.HD, v)
        else
            a^.dato.puntaje:=a^.dato.puntaje + calcularPuntaje(v.clase,v.millas);
    end;
end;

procedure generarArbol (var a:arbol);

var v:venta;

begin
    leerDatos(v);
    while (v.codVuelo <> 'ZZZ') do 
    begin
        insertar(a, v);
        leerDatos(v);
    end;
end;


function maximoPuntaje (a:arbol):integer;

begin
    if (a <> nil) then
    begin
        maximoPuntaje := a^.dato.puntaje;
        if (maximoPuntaje < maximoPuntaje(a^.Hi) ) then
            maximoPuntaje := maximoPuntaje(a^.Hi)
        else if (maximoPuntaje < maximoPuntaje(a^.Hd) ) then
            maximoPuntaje := maximoPuntaje(a^.Hd);
    end;
end;


function maximoPuntajeAcotado (a:arbol):integer;

begin
    if (a <> nil)  and (a^.dato.dni <= 50000000)  then
    begin
        maximoPuntajeAcotado := a^.dato.puntaje;
        if (maximoPuntajeAcotado < maximoPuntajeAcotado(a^.Hi) ) then
            maximoPuntajeAcotado := maximoPuntajeAcotado(a^.Hi)
        else if (maximoPuntajeAcotado < maximoPuntajeAcotado(a^.Hd) ) then
            maximoPuntajeAcotado := maximoPuntajeAcotado(a^.Hd);
    end;
end;


function buscar (a:arbol):arbol;

begin
    if (a = nil) then
        buscar := nil
    else
    begin
        if (40000000 < a^.dato.dni) then
            buscar := buscar(a^.HD)
        else
            buscar := a;
    end;
end;


var a:arbol;


begin
    generarArbol(a);    
    Writeln('Arbol generado.');
    Writeln('El maximo puntaje es: ', maximoPuntaje(a));
    Writeln('El maximo puntaje de dni entre 40.000.000 y 50.000.000 es: ', maximoPuntajeAcotado(buscar(a)));
end.

