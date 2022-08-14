
Program listas;

Type 
    lista =   ^Nodo;

    Nodo =   Record
        datos:   integer;
        sig:   lista;
    End;


Procedure AgregarAdelante (Var l:lista; num:integer);

Var nue:   lista;
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

{---------------------Fin de se dispone----------------------}

//Funcion para determinar el elemento minimo de una lista

Function minimoLista(l:lista):   integer;

Begin
    If (l^.sig <> Nil) Then
        Begin
            If (l^.datos < minimoLista(l^.sig)) Then
                minimoLista := l^.datos
            Else
                minimoLista := minimoLista(l^.sig);
        End
    Else
        minimoLista := l^.datos;
End;

Procedure epsonl395 (l:lista);

Begin

End;

Var 
    l:   lista;
    n:   integer;

Begin
    l := Nil;
    randomize;
    n := random (100);
    While (n<>0) Do
        Begin
            AgregarAdelante (l, n);
            n := random (100);
        End;
    writeln ('lista generada: ');
    imprimir (l);
    Writeln('Numero minimo de la lista: ',minimoLista(l));
End.
