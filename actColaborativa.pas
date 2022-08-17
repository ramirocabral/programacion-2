{Enunciado 1
Una empresa de micros de larga distancia gestiona sus ventas. Necesita almacenar 
la siguiente información para sus destinos de viaje: nombre del destino, distancia en kilómetros 
y la cantidad de pasajes vendidos para dicho destino. 

    a. Se nos pide diseñar una estructura eficiente de manera tal que por cada destino se almacene su distancia 
    y la cantidad de pasajes vendidos para el mismo. La estructura generada debe ser la más eficiente en cuanto 
    a la búsqueda de un destino.

    b. Creen un programa que muestre un menú de opciones para:
    • Inicializar las estructuras de datos a utilizar en su funcionamiento.
    • Cargar un destino a la estructura utilizada.
    • Imprimir la información contenida en la estructura de datos utilizada.
    • Buscar un destino dentro de la estructura de datos utilizada y mostrar toda su información.
    • Buscar e informar el destino más cercano.
    • Sumar una cantidad X de pasajes a un destino.

Nota: Declarar todas las estructuras necesarias para el funcionamiento. 
Modularizar el código en base a las funcionalidades pedidas. }

program actividad;

type
    cadena20=string[20];
    destino = record
        nombre: cadena20;
        nom: integer;
        pasajes: integer;
    end;

    arbol=^nodoArbol;

    nodoArbol = record
        datos:destino;
        HI:arbol;
        HD:arbol;
    end;

//ingresar un valor en el arbol

procedure insertarArbol (var a:arbol; data:destino);


Begin
    If (a = Nil) Then
        Begin
            new(a);
            a^.datos := data;
            a^.HI := Nil;
            a^.HD := Nil;
        End
    Else
    begin
        If (data.nom < a^.datos.nom) Then
            insertarArbol(a^.HI,data)
        Else
        If (data.nom > a^.datos.nom) Then
            insertarArbol(a^.HD,data)
        else
            a^.datos.pasajes := a^.datos.pasajes + data.pasajes;
    end;
End;

procedure agregarDestino (var a:arbol);

var dest:destino;

begin
    writeln('Ingrese el nombre del destino: ');
    readln(dest.nombre);
    writeln('Ingrese la distancia: ');
    readln(dest.nom);
    writeln('Ingrese la cantidad de pasajes vendidos: ');
    readln(dest.pasajes);
    insertarArbol(a,dest); 
end;

//buscarPorNombre un valor por nombre en el arbol

function buscarPorNombre (a:arbol; nom:cadena20):arbol;

begin
    If (a <> Nil) Then
    Begin
        If (nom = a^.datos.nombre) Then
            buscarPorNombre := a
        Else
        if (buscarPorNombre(a^.HI,nom) <> Nil) Then
                buscarPorNombre := buscarPorNombre(a^.HI,nom)
            else
                buscarPorNombre := buscarPorNombre(a^.HD,nom);
        End
    Else
        buscarPorNombre := Nil;
end;


//imprimir los elementos del arbol

procedure imprimirDestino (d:destino);

begin
    Writeln('Nombre: :',d.nombre, ' ');
    Write('Distancia :',d.nom,' ');
    Write('Pasajes vendidos: ',d.pasajes);
end;

procedure buscarPorNombre (a:arbol);

var nom:cadena20;

begin
    Writeln('Ingrese el nombre del destino a buscarPorNombre: ');
    Readln(nom);
    if (buscarPorNombre(a,nom) <> nil) then
        imprimirDestino(buscarPorNombre(a,nom)^.datos)
    else
        Writeln('El destino no existe.');
end;


procedure preOrden (a:arbol);

begin
    if a <> nil then 
    begin
        imprimirDestino(a^.datos);
        preOrden(a^.HI);
        preOrden(a^.HD);
    end;
end;

//determinar el destino más cercano

function minimo (a:arbol):arbol;

begin
    if (a = nil) then
        minimo := nil
    else
        if (a^.HI = nil) then
            minimo := a
        else
            minimo := minimo(a^.HI);
end;

//agregar pasajes a un destino

procedure agregarPasajes (a:arbol);

var nom:cadena20;
    cant:integer;

begin
    Writeln('Ingrese el destino y los pasajes a agregar: ');
    Readln(nom);
    Readln(cant);
    if (buscarPorNombre(a,nom) <> nil) then
        buscarPorNombre(a,nom)^.datos.pasajes := buscarPorNombre(a,nom)^.datos.pasajes + cant
    else
        Writeln('El destino no existe.');
end;

//lee la opcion ingresada por el usuario:

procedure leerOpcion (var opcion:integer);

begin
    Writeln('Ingrese: ');
    Writeln('1: Agregar un destino.');
    Writeln('2: Buscar un destino.');
    Writeln('3: Imprimir los destinos.');
    Writeln('4: Imprimir el destino mas cercano.');
    Writeln('5: Agregar pasajes a un destino.');
    Writeln('-1: Salir.');
    Readln(opcion);
end;

var opcion:integer;
    a:arbol;


begin
    a:=nil;
    leerOpcion(opcion);
    while (opcion <> -1) do
    begin
        leeropcion(opcion);
        case opcion of
            1:  agregarDestino(a);
            2:  buscarPorNombre(a);
            3:  preOrden(a);
            4:  Writeln('Destino mas cercano: ', minimo(a)^.datos.nom);
            5:  agregarPasajes(a);
        else if (opcion <> -1) then
            Writeln('Opcion no valida.');
        end;
        leerOpcion(opcion);
    end;
end.