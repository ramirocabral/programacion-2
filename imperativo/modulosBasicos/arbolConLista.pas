
Program arbolConLista;

Type 
  lista = ^nodo;

  nodo = Record
    datos: integer;
    sig: lista;
  End;

  arbol = ^nodoArbol;

  nodoArbol = Record
    dato: integer;
    HI: arbol;
    HD: arbol;
  End;

{---------------se genera una lista aleatoria de enteros-------------}



Procedure AgregarAdelante (Var l:lista; num:integer);

Var nue: lista;
Begin
  New(nue);
  nue^.datos := num;
  nue^.sig := l;
  l := nue;
End;


Procedure Imprimir (l:lista);
Begin
  While (l <> Nil) Do
    Begin
      write (l^.datos, ' ');
      l := l^.sig
    End;
  writeln;
End;

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
    Begin
      If (data < a^.datos) Then
        insertarArbol(a^.HI,data)
      Else
        If (data > a^.datos) Then
          insertarArbol(a^.HD,data);
    End;
End;

Procedure generarArbol (Var a:arbol; l:Lista);

Begin
  While (l <> Nil) Do
    Begin
      insertarArbol(a,l^.datos);
      l := l^.sig;
    End;
End;

{programa principal}

Begin
  //generar lista random

  Randomize;
  l := Nil;
  n := random (100);
  While (n<>0) Do
    Begin
      AgregarAdelante (l, n);
      n := random (100);
    End;
  writeln ('lista generada: ');
  imprimir (l);

End.
