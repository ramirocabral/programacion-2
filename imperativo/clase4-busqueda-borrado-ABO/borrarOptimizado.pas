program busquedaAcotada;

type 
    arbol = ^nodoArbol;

    nodoArbol=record
        datos:integer;
        HI,HD:arbol;
    end;

    lista = ^nodo;

    nodo=record 
        datos:integer;
        sig:lista;
    end;

    listaNivel = ^nodoN;
    nodoN = record
        info: arbol;
        sig: listaNivel;
    end;

//imprimir por nivel:

// CONTARELEMENTOS - Devuelve la cantidad de elementos de una lista l

function ContarElementos (l: listaNivel): integer;
  var c: integer;
begin
 c:= 0;
 While (l <> nil) do begin
   c:= c+1;
   l:= l^.sig;
 End;
 contarElementos := c;
end;

//  AGREGARATRAS - Agrega un elemento atrás en l

Procedure AgregarAtras (var l, ult: listaNivel; a:arbol);
 var nue:listaNivel;

 begin
 new (nue);
 nue^.info := a;
 nue^.sig := nil;
 if l= nil then l:= nue
           else ult^.sig:= nue;
 ult:= nue;
 end;


// IMPRIMIRPORNIVEL - Muestra los datos del árbol a por niveles

Procedure imprimirpornivel(a: arbol);
var
   l, aux, ult: listaNivel;
   nivel, cant, i: integer;
begin
   l:= nil;
   if(a <> nil)then begin
                 nivel:= 0;
                 agregarAtras (l,ult,a);
                 while (l<> nil) do begin
                    nivel := nivel + 1;
                    cant:= contarElementos(l);
                    write ('Nivel ', nivel, ': ');
                    for i:= 1 to cant do begin
                      write (l^.info^.datos, ' - ');
                      if (l^.info^.HI <> nil) then agregarAtras (l,ult,l^.info^.HI);
                      if (l^.info^.HD <> nil) then agregarAtras (l,ult,l^.info^.HD);
                      aux:= l;
                      l:= l^.sig;
                      dispose (aux);
                     end;
                     writeln;
                 end;
               end;
end;



{---------------se genera una lista aleatoria de enteros-------------}



Procedure AgregarAdelante (var l:lista; num:integer);
Var nue:lista;
  Begin
    New(nue);
    nue^.datos:=num;
    nue^.sig:=l;
    l:=nue;
  End;


Procedure Imprimir (l:lista);
Begin
   while (l <> NIL) do begin
     write (l^.datos, ' ');
     l:= l^.sig
  end;
  writeln;
end;

{Inserta un arbol a partir de los datos de una lista}

Procedure insertarArbol (Var a:arbol ; data:integer);

Var nue: arbol;

Begin
    If (a = Nil) Then
        Begin
            new(nue);
            nue^.datos := data;
            nue^.HI := Nil;
            nue^.HD := Nil;
            a := nue;
        End
    Else
    begin
        If (data < a^.datos) Then
            insertarArbol(a^.HI,data)
        Else
        If (data > a^.datos) Then
            insertarArbol(a^.HD,data);
    end;
End;

procedure generarArbol (var a:arbol; l:Lista);

begin
    While (l <> Nil) Do
    Begin
        insertarArbol(a,l^.datos);
        l := l^.sig;
    End;
end;

//imprimir contenido del arbol en forma creciente:

procedure imprimirArbol (a:arbol);

begin
    if (a <> nil) then
    begin
        imprimirArbol(a^.HI);
        write(a^.datos, ' ');
        imprimirArbol(a^.HD);
    end;
end;

{borrar un valor del arbol}

function buscarMinimo (a:arbol):arbol;

begin
    if (a <> nil) then
    begin
        if (a^.HI = nil) then
            buscarMinimo := a
        else
            buscarMinimo := buscarMinimo(a^.HI);
    end;
end;


procedure borrar(var a:arbol; num:integer; var exito:boolean);

var aux:arbol;

begin
    if (a <> nil) then
    begin
        if (num > a^.datos) then
            borrar(a^.HD,num,exito)
        else if (num < a^.datos) then
            borrar(a^.HI,num,exito)
        else    {se encontro el datos a borrar}
            if (a^.HI = nil) then
            begin
                writeln('Sin hijo izq');
                aux:=a;
                a:=a^.HD;
                dispose(aux);
                exito:=true;
            end
            else if (a^.HD = nil) then
            begin
                writeln('sin Hijo Derecho');
                aux:=a;
                a:=a^.HI;
                dispose(aux);
                exito:=true;
            end
            else if (a^.HD <> nil) and (a^.HI <>  nil) then
            begin
                writeln('Dos Hijos');
                a^.datos:=buscarMinimo(a^.HD)^.datos;
                borrar(a^.HD,a^.datos,exito);
                exito:=true;
            end
            else
            Begin
                exito:=true;
            end;
    end
    else    
        exito := false;
end;


{programa principal}

var a:arbol;
    l:lista;
    n,valor,inf,sup:integer;
    exito:boolean;

Begin
    //generar lista random

    Randomize;
    l:=nil;
    n := random (100);
    while (n<>0) do 
    begin
      AgregarAdelante (l, n);
      n := random (100);
    end;
    writeln ('lista generada: ');
    imprimir (l);

    generarArbol(a,l);

    Writeln('Arbol generado: ');
    Writeln();
    imprimirPorNivel(a);

    Writeln('Ingrese el valor a borrar en el arbol:');
    Readln(valor);
    borrar(a,valor,exito);
    if (exito = true) then
    begin
        Writeln('Arbol borrado: ');
        imprimirPorNivel(a);
    end
    else    
        Writeln('No se encontro el valor en el arbol');
end.

