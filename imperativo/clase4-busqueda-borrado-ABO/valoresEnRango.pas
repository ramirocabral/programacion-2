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

{ver valores entre un rango dado}

procedure verValoresEnRango (a:arbol; inf,sup:integer);

begin
    if (a <> nil) then
        if (a^.datos >= inf) then
        begin
            if (a^.datos <=sup) then       
            begin
                Writeln(a^.datos);
                verValoresEnRango(a^.HI,inf,sup);
                verValoresEnRango(a^.HD,inf,sup);
            end
            else
            verValoresEnRango(a^.HI,inf,sup);
        end
        else
            verValoresEnRango(a^.HD,inf,sup);
end;

{programa principal}

var a:arbol;
    l:lista;
    n,inf,sup:integer;

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
    imprimirArbol(a);
    Writeln();

    Writeln('Ingrese el valor inferior: '); Readln(inf);
    Writeln('Ingrese el valor superior: '); Readln(sup);
    verValoresEnRango(a,inf,sup);
end.