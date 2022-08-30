


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

Program actividad;

Type 
  cadena20 = string[20];
  destino = Record
    nombre: cadena20;
    nom: integer;
    pasajes: integer;
  End;

  arbol = ^nodoArbol;

  nodoArbol = Record
    datos: destino;
    HI: arbol;
    HD: arbol;
  End;

  //ingresar un valor en el arbol

Procedure insertarArbol (Var a:arbol; data:destino);


Begin
  If (a = Nil) Then
    Begin
      new(a);
      a^.datos := data;
      a^.HI := Nil;
      a^.HD := Nil;
    End
  Else
    Begin
      If (data.nom < a^.datos.nom) Then
        insertarArbol(a^.HI,data)
      Else
        If (data.nom > a^.datos.nom) Then
          insertarArbol(a^.HD,data)
      Else
        a^.datos.pasajes := a^.datos.pasajes + data.pasajes;
    End;
End;

Procedure agregarDestino (Var a:arbol);

Var dest: destino;

Begin
  writeln('Ingrese el nombre del destino: ');
  readln(dest.nombre);
  writeln('Ingrese la distancia: ');
  readln(dest.nom);
  writeln('Ingrese la cantidad de pasajes vendidos: ');
  readln(dest.pasajes);
  insertarArbol(a,dest);
End;

//buscarPorNombre un valor por nombre en el arbol

Function buscarPorNombre (a:arbol; nom:cadena20): arbol;

Begin
  If (a <> Nil) Then
    Begin
      If (nom = a^.datos.nombre) Then
        buscarPorNombre := a
      Else
        If (buscarPorNombre(a^.HI,nom) <> Nil) Then
          buscarPorNombre := buscarPorNombre(a^.HI,nom)
      Else
        buscarPorNombre := buscarPorNombre(a^.HD,nom);
    End
  Else
    buscarPorNombre := Nil;
End;


//imprimir los elementos del arbol

Procedure imprimirDestino (d:destino);

Begin
  Writeln('Nombre: :',d.nombre, ' ');
  Write('Distancia :',d.nom,' ');
  Write('Pasajes vendidos: ',d.pasajes);
End;

Procedure buscarPorNombre (a:arbol);

Var nom: cadena20;

Begin
  Writeln('Ingrese el nombre del destino a buscarPorNombre: ');
  Readln(nom);
  If (buscarPorNombre(a,nom) <> Nil) Then
    imprimirDestino(buscarPorNombre(a,nom)^.datos)
  Else
    Writeln('El destino no existe.');
End;


Procedure preOrden (a:arbol);

Begin
  If a <> Nil Then
    Begin
      imprimirDestino(a^.datos);
      preOrden(a^.HI);
      preOrden(a^.HD);
    End;
End;

//determinar el destino más cercano

Function minimo (a:arbol): arbol;

Begin
  If (a = Nil) Then
    minimo := Nil
  Else
    If (a^.HI = Nil) Then
      minimo := a
  Else
    minimo := minimo(a^.HI);
End;

//agregar pasajes a un destino

Procedure agregarPasajes (a:arbol);

Var nom: cadena20;
  cant: integer;

Begin
  Writeln('Ingrese el destino y los pasajes a agregar: ');
  Readln(nom);
  Readln(cant);
  If (buscarPorNombre(a,nom) <> Nil) Then
    buscarPorNombre(a,nom)^.datos.pasajes := buscarPorNombre(a,nom)^.datos.pasajes + cant
  Else
    Writeln('El destino no existe.');
End;

//lee la opcion ingresada por el usuario:

Procedure leerOpcion (Var opcion:integer);

Begin
  Writeln('Ingrese: ');
  Writeln('1: Agregar un destino.');
  Writeln('2: Buscar un destino.');
  Writeln('3: Imprimir los destinos.');
  Writeln('4: Imprimir el destino mas cercano.');
  Writeln('5: Agregar pasajes a un destino.');
  Writeln('-1: Salir.');
  Readln(opcion);
End;

Var opcion: integer;
  a: arbol;


Begin
  a := Nil;
  leerOpcion(opcion);
  While (opcion <> -1) Do
    Begin

      Case opcion Of 
        1:  agregarDestino(a);
        2:  buscarPorNombre(a);
        3:  preOrden(a);
        4:  Writeln('Destino mas cercano: ', minimo(a)^.datos.nom);
        5:  agregarPasajes(a);
        Else If (opcion <> -1) Then
               Writeln('Opcion no valida.');
      End;
      leerOpcion(opcion);
    End;
End.
