Program ejercicio3;
Uses
     sysutils;
Type
     pedido= record
	      codSeg: integer;
	      fechaYhora: string;
	      dni: integer;
	      codArea: integer;
          domicilio: string;
          tel: string;
     end;


     listaPedidos = ^nodoListaPedidos;
     nodoListaPedidos = record
               dato: pedido;
               sig: listaPedidos;
     end;

     lista=^nodoLista;

     nodoLista = record
        dato:integer;
        sig:lista;
    end;


     arbol = ^nodoArbol;
    
     nodoArbol = record
        codArea:integer;
        cantClientes:integer;
        clientes:lista;
        HI:arbol;
        HD:arbol
    end;

procedure agregarLista(var pri:listaPedidos; p:pedido);
var
  nuevo, anterior, actual: listaPedidos;
begin
    new (nuevo);
    nuevo^.dato:= p;
    nuevo^.sig := nil;
    if (pri = nil) then
         pri := nuevo
    else
    begin
         actual := pri;
         anterior := pri;
         while (actual<>nil) and (actual^.dato.dni < nuevo^.dato.dni) do begin
              anterior := actual;
              actual:= actual^.sig;
         end;
         if (anterior = actual) then
              pri := nuevo
         else
              anterior^.sig := nuevo;
         nuevo^.sig := actual;
    end;
end;


function cargarFecha(): string;{Genera una FECHA aleatoria}
var
  dia, mes, hora, seg: integer;
  s: string;
begin
  dia := random(30)+1;
  mes := random(12)+1;
  s := Concat(IntToStr(dia),'/',IntToStr(mes),'/2020 - ');
  hora := random(24);
  seg := random(60);
  if(hora < 10)then
	s := Concat(s, '0', IntToStr(hora))
  else
	s:= Concat(s, IntToStr(hora));
  if(seg < 10)then
	s := Concat(s, ':0', IntToStr(seg))
  else
	s:= Concat(s,':', IntToStr(seg));
  cargarFecha:= s;
end;

procedure crearLista(var l: listaPedidos);
var
   cant, cod: integer;
   p: pedido;
begin
     cant:= random(10); {genera hasta 100 elementos}
     cod:= 1;
     while (cant <> 0) do Begin
          p.codSeg:= cod;  {codigo de seguimiento}
          p.fechaYhora := cargarFecha();
          p.dni := random(60000000);  {dni}
          p.codArea := (random(4000)); {codigo de área}
          p.domicilio:= Concat('Domicilio', IntToStr(cod)); {domicilio}
          p.tel:= IntToStr(random(999999)+4000000); {telefono}
          agregarLista(l, p);
          cant:= cant-1;
          cod := cod+1;
     end;
end;

procedure imprimirPedido(p:pedido);
begin
    with(p)do
         writeln('El pedido ',codSeg, ' del cliente ', dni, ' sera atendido en la fecha ', fechaYhora, ' en el codigo de area ', codArea, ' y domicilio ', domicilio, ' con tel. de contacto ', tel);
end;

procedure imprimirLista(l:listaPedidos);
begin
    while(l<>nil)do
    begin
         imprimirPedido(l^.dato);
         l:=l^.sig;
    end;
end;

procedure insertarAdelante (var l:lista; d:integer);

var aux:lista;

begin
    new (aux);
    aux^.dato:=d;
    aux^.sig:=l;
    l:=aux;
end;


procedure insertarArbol (var a:arbol; p:pedido);

begin
    if (a = nil) then
    begin
        new (a);
        a^.codArea:=p.codArea;
        a^.cantClientes:=1;
        insertarAdelante(a^.clientes,p.dni);
        a^.HI:=nil;
        a^.HD:=nil;
    end
    else
    begin
        if (p.codArea < a^.codArea) then
            insertarArbol(a^.HI,p)
        else
            if (p.codArea > a^.codArea) then
                insertarArbol(a^.HD,p)
        else
        begin
            a^.cantClientes:=a^.cantClientes+1;
            insertarAdelante(a^.clientes,p.dni);
        end;
    end;
end;

procedure generarArbol (l:listaPedidos ;var a:arbol);

begin
    while (l <> nil) do
    begin
        insertarArbol(a,l^.dato);
        l:=l^.sig;
    end;
end;

function  minimosClientes (a:arbol):integer;

begin
    if (a <> nil) then
    begin
        minimosClientes := a^.cantClientes;
        if (minimosClientes < minimosClientes(a^.Hi) ) then
            minimosClientes := minimosClientes(a^.Hi)
        else if (minimosClientes < minimosClientes(a^.Hd) ) then
            minimosClientes := minimosClientes(a^.Hd);
    end;
end;

procedure imprimirLista (l:lista);

begin
    while (l <> nil) do
    begin
        writeln(' -' ,l^.dato);
        l:=l^.sig;
    end;
end;

procedure busquedaAcotada (a:arbol);

begin
    if (a <> nil) then
        if (a^.codArea >= 1000) then
        begin
            if (a^.codArea <= 2000) then       
            begin
                Writeln(a^.codArea);
                imprimirLista(a^.clientes);
                busquedaAcotada(a^.HI);
                busquedaAcotada(a^.HD);
            end
            else
            busquedaAcotada(a^.HI);
        end
        else
            busquedaAcotada(a^.HD);
end;


function buscarEnArbol (a:arbol; cod:integer):arbol;

begin
    if (a <> nil) then
    begin
        if (a^.codArea = cod) then
            buscarEnArbol := a
        else
            if (a^.codArea > cod) then
                buscarEnArbol := buscarEnArbol(a^.HI,cod)
            else
                buscarEnArbol := buscarEnArbol(a^.HD,cod);
    end;
end;

procedure imprimirDnisCodigo (a:arbol);

var cod:integer;

begin
    writeln('Ingrese el codigo de area a buscar');
    Readln(cod);
    if (buscarEnArbol(a,cod) <> nil) then
    begin
        writeln('Los dnis de los clientes del codigo ',cod,' son:');
        imprimirLista(buscarEnArbol(a,cod)^.clientes);
    end
    else
        writeln('No existe el codigo ',cod);
end;


var
   l_inicial: listaPedidos;
   a:arbol;

begin
     Randomize;
     {Se crea la estructura inicial}
     l_inicial:= nil;
     crearLista(l_inicial);
     writeln ('Lista: ');
     imprimirLista(l_inicial);

     {Completar el programa}
    a:=nil;
     generarArbol(l_inicial,a);
    Writeln('Codigo de area con menos peiddos: ', minimosClientes(a));
    Writeln('Codigos de area entre 1000 y 2000: ');
    busquedaAcotada(a);
    imprimirDnisCodigo(a);
     writeln('Fin del programa');
end.
