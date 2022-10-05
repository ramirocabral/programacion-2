program actividad;

type 
    alumno=record
        nom:string;
        ap:string;
        dni:integer;
    end;

    arbol=^nodoArbol;

    nodoArbol=record
        datos:alumno;
        HI:arbol;
        HD:arbol;
    end;

procedure insertarArbol(var a:arbol; data:alumno);

begin
    if (a = nil) then
    begin
        new(a);
        a^.datos:=data;
        a^.HI:=nil;
        a^.HD:=nil;
    end
    else
    begin
        if (data.dni > a^.datos.dni) then
            insertarArbol(a^.HD,data)
        else
            insertarArbol(a^.HI,data)    
    end;
end;

procedure imprimirAlumno (data:alumno);

begin
    Writeln('Nombre: ',data.nom);
    Writeln('Apellido: ',data.ap);
    Writeln('DNI: ',data.DNI);
end;


function buscarNodoDNI(a:arbol; dni:integer):arbol;

begin
    if ( a= nil) then
        buscarNodoDNI:=nil
    else
    begin
        if (dni > a^.datos.dni) then
            buscarNodoDNI := buscarNodoDNI(a^.HD,dni)
        else if (dni < a^.datos.dni) then
            buscarNodoDNI := buscarNodoDNI(a^.HI,dni)
        else
            buscarNodoDNI:=a;
    end;
end;

procedure buscarDNI (a:arbol);

var dni:integer;

begin
    Writeln('Ingrese el numero de DNI a buscar: ');
    Readln(dni);
    if (buscarNodoDNI(a,dni) <> nil) then
        imprimirAlumno(buscarNodoDNI(a,dni)^.datos)
    else
        Writeln('El numero de DNI no es valido.')
end;

procedure buscarApellido(a:arbol; apellido:string);

begin
    if (a <> nil) then
    begin
        if (a^.datos.ap = apellido) then
            imprimirAlumno(a^.datos);
        buscarApellido(a^.HI,apellido);
        buscarApellido(a^.HD,apellido);
    end;
end;


procedure imprimirPorApellido (a:arbol);

var apellido:string;

begin
    Writeln('Ingrese el apellido a buscar en el arbol: ');
    Readln(apellido);
    buscarApellido(a,apellido);
end;


procedure leerAlumno (var alum:alumno);

begin
    Writeln('Ingrese el nombre'); Readln(alum.nom);
    if (alum.nom <> 'zzz') then
    begin
        Writeln('Ingrese el apellido'); Readln(alum.ap);
        Writeln('Ingrese el DNI'); Readln(alum.dni);
    end;
end;


var a:arbol;
    alum:alumno;

begin
    a:=nil;
    leerAlumno(alum);
    while (alum.nom <> 'zzz') do
    begin
        insertarArbol(a,alum);
        leerAlumno(alum);
    end;
    buscarDNI(a);
    imprimirPorApellido(a);
end.
