Program listas;
Type
  lista= ^Nodo;

  Nodo= Record
           datos: integer;
           sig: lista;
        End;


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

{---------------------Fin de se dispone----------------------}

//Funcion para determinar el elemento minimo de una lista

function minimoLista(l:lista):integer;

begin
    if (l^.sig <> nil) then
    begin
        if (l^.datos < minimoLista(l^.sig)) then
            minimoLista := l^.datos
        else 
            minimoLista := minimoLista(l^.sig);
    end
    else 
        minimoLista := l^.datos;
end;

procedure epsonl395 (l:lista);

begin

end;

var
 l: lista;
 n: integer;

begin
    l:=nil;
    randomize;
    n := random (100);
    while (n<>0) do 
    begin
      AgregarAdelante (l, n);
      n := random (100);
    end;
    writeln ('lista generada: ');
    imprimir (l);
    Writeln('Numero minimo de la lista: ',minimoLista(l));
end.
