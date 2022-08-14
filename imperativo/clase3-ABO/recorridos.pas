program recorridos;

type 
    arbol = ^nodoA;

    nodoA = record
        datos:integer;
        HI:arbol;
        HD:arbol;
    end;

    listaNivel = ^nodoN;
    nodoN = record
    info: arbol;
    sig: listaNivel;
    end;

    lista = ^nodo;
    nodo = record
        datos: integer;
        sig: lista;
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

{------------------Imprimir por nivel---------------}

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

{------------------se genera un arbol en base a la lista---------------}

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


{----------------------------------------------------}



{-----------------se recorre el arbol-----------------------}


procedure preOrden (a:arbol);

begin
    if a <> nil then 
    begin
        write(a^.datos, '-');
        preOrden(a^.HI);
        preOrden(a^.HD);
    end;
end;

procedure enOrden (a:arbol);

begin
    if a <> nil then 
    begin
        enOrden(a^.HI); 
        write(a^.datos,'-');
        enOrden(a^.HD);
    end;
end;

procedure posOrden (a:arbol);

begin
    if a <> nil then 
    begin
        posOrden(a^.HI);
        posOrden(a^.HD);
        write(a^.datos,'-');
    end;
end;

var 
    a:arbol;
    l:lista;
    n:integer;
begin
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

    generarArbol (a,l);

    writeln('arbol generado: ');

    imprimirpornivel(a);

    writeln();
    writeln('preOrden: ');
    preOrden(a);
    writeln();
    writeln('enOrden: ');
    enOrden(a);
    writeln();
    writeln('posOrden: ');
    posOrden(a);

end.