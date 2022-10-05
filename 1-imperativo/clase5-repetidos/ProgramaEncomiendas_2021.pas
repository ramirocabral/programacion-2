Program encomiendas;
Type

   encomienda = record
                  codigo: integer;
                  peso: integer;
                end;

  // Lista de encomiendas
  lista = ^nodoL;
  nodoL = record
    dato: encomienda;
    sig: lista;
  end;

    arbolCodigos=^nodoCodigos;

    nodoCodigos=record  
        dato:integer;
        izq:arbolCodigos;
        der:arbolCodigos;
    end;

    arbolPesos = ^nodoPesos;

    nodoPesos=record
        peso:integer;
        codigos:arbolCodigos;
        HI:arbolPesos;
        HD:arbolPesos;
    end;

{-----------------------------------------------------------------------------
AgregarAdelante - Agrega una encomienda adelante en l}
procedure agregarAdelante(var l: Lista; enc: encomienda);
var
  aux: lista;
begin
  new(aux);
  aux^.dato := enc;
  aux^.sig := l;
  l:= aux;
end;


{-----------------------------------------------------------------------------
CREARLISTA - Genera una lista con datos de las encomiendas }
procedure crearLista(var l: Lista);
var
  e: encomienda;
  i: integer;
begin
 l:= nil;
 for i:= 1 to 20 do begin
   e.codigo := i;
   e.peso:= random (10);
   while (e.peso = 0) do e.peso:= random (10);
   agregarAdelante(L, e);
 End;
end;


{-----------------------------------------------------------------------------
IMPRIMIRLISTA - Muestra en pantalla la lista l }
procedure imprimirLista(l: Lista);
begin
 While (l <> nil) do begin
   writeln('Codigo: ', l^.dato.codigo, '  Peso: ', l^.dato.peso);
   l:= l^.sig;
 End;
end;



procedure insertarArbolCodigos (var arbolCod:arbolCodigos; codigo:integer);

begin
    if (arbolCod = nil) then
    begin
        new(arbolCod);
        arbolCod^.dato := codigo;
        arbolCod^.izq:=nil;
        arbolCod^.der:=nil;
    end
    else if (codigo < arbolCod^.dato) then
        insertarArbolCodigos(arbolCod^.izq,codigo)
    else
        insertarArbolCodigos(arbolCod^.der,codigo)
end;


procedure insertarArbol (var a:arbolPesos; data:encomienda);

begin
    if (a=nil) then begin
        new(a);
        a^.peso:=data.peso;
        a^.HI:=nil;
        a^.HD:=nil;
        a^.codigos:=nil;
        insertarArbolCodigos(a^.codigos,data.codigo);
    end
    else
        if (data.peso < a^.peso) then
            insertarArbol(a^.HI,data)
        else if (data.peso > a^.peso) then
            insertarArbol(a^.HD,data)
        else
            insertarArbolCodigos(a^.codigos,data.codigo)
end;

//generar arbol a partir de la lista

procedure generarArbol(l:lista; var a:arbolPesos);

begin
    while (l <> nil) do
    begin
        insertarArbol(a,l^.dato);
        l:=l^.sig;
    end;
end;


//imprimir ambos arboles

procedure enOrdenCodigos (arbolCod:arbolCodigos);

begin
    if (arbolCod <> nil) then
    begin
        enOrdenCodigos(arbolCod^.izq);
        Write(' - ', arbolCod^.dato);
        enOrdenCodigos(arbolCod^.der);
    end
end;


procedure imprimirEnOrden(a:arbolPesos);

begin
    if (a <> nil) then
    begin
        imprimirEnOrden(a^.HI);
        Writeln('Peso : ', a^.peso);
        Writeln('Codigos: ');
        enOrdenCodigos(a^.codigos);
        Writeln();
        imprimirEnOrden(a^.HD);
    end;
end;


Var

    l: lista;
    a:arbolPesos;
begin
    Randomize;

    crearLista(l);
    writeln ('Lista de encomiendas generada: ');
    imprimirLista(l);

    a:=nil;


    generarArbol(l,a);

    Writeln('Arbol generado: ');

    imprimirEnOrden(a);

end.
