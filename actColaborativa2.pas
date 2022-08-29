program actColaborativa2;

type 

    paciente=record
        dni:integer;
        codPostal:integer;
        ciudad:string;
    end;

    arbolPacientes = ^nodoArbolPacientes;

    nodoArbolPacientes = record
        dni:integer;
        izq:arbolPacientes;
        der:arbolPacientes;
    end;
    
    arbolCiudades = ^nodoArbolCiudades;

    nodoArbolCiudades = record
        codPostal:integer;
        nomCiudad:string;
        pacientes:arbolPacientes;
        HI:arbolCiudades;
        HD:arbolCiudades;
    end;

procedure insertarArbolPacientes (var a:arbolPacientes; dato:integer);

begin
    if (a=nil) then
    begin
        new(a);
        a^.dni := dato;
        a^.izq:=nil;
        a^.der:=nil;
    end
    else if (dato > a^.dni) then
        insertarArbolPacientes(a^.der,dato)
    else
        insertarArbolPacientes(a^.izq,dato);
end;




procedure insertarArbol (var a:arbolCiudades; data:paciente);

begin
    if (a = nil) then
    begin
        new(a);
        a^.codPostal := data.codPostal;
        a^.nomCiudad := data.ciudad;
        a^.pacientes:=nil;
        insertarArbolPacientes(a^.pacientes,data.dni);
    end
    else 
    begin
        if (data.codPostal < a^.codPostal) then
            insertarArbol(a^.HI,data)
        else if (data.codPostal > a^.codPostal) then
            insertarArbol(a^.HD,data)
        else
            ;
    end;
end;

procedure enOrden (a:arbolPacientes ; var cant:integer);

begin
    if (a <> nil) then
    begin
        enOrden(a^.izq,cant);
        cant:=cant+1;
        enOrden(a^.der,cant);
    end;
end;

procedure verValoresEnRango (a:arbolCiudades);

var cant:integer;

begin
    if (a <> nil) then
        if (a^.codPostal >= 1800) then
        begin
            if (a^.codPostal <=1900) then       
            begin
                Writeln(a^.nomCiudad);
                cant:=0;
                enOrden(a^.pacientes,cant);
                Writeln(cant);
                verValoresEnRango(a^.HI);
                verValoresEnRango(a^.HD);
            end
            else
            verValoresEnRango(a^.HI);
        end
        else
            verValoresEnRango(a^.HD);
end;

//leer datos de cada paciente por teclado

procedure leerDatos (var pac:paciente);

Begin
    Writeln('Ingrese el codigo postal: ');
    Readln(pac.codPostal);
    if (pac.codPostal <> -1) then
    begin
        Writeln('Ingrese el nombre de la ciudad: ');
        Readln(pac.ciudad);
        Writeln('Ingrese el DNI: ');
        Readln(pac.DNI);
    end;
end;

//ingresar datos al arbol


procedure cargarArbol (var a:arbolCiudades);

var pac:paciente;

begin
    leerDatos(pac);
    while (pac.codPostal <> -1) do
    begin
        insertarArbol(a,pac);
        leerDatos(pac);
    end;
end;

var a:arbolCiudades;

begin
    a:=nil;

    cargarArbol(a);


    verValoresEnRango(a);

end.

