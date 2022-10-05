Program ejercicio1; 
Uses
     sysutils;
Type
     str10= string[10];

     jugador = record
              dni: longint;
	          nombreApellido: string;
	          posicion: str10;
              puntaje: integer;
     end;


     lista = ^nodoLista;
     nodoLista = record
               dato: jugador;
               sig: lista;
     end;


     partido= record
               estadio: string;
               equipoLocal: string;
               equipoVisitante: string;
               fecha: str10;
               jugadores: lista;
     end;

     listaPartidos = ^nodoPartido;
     nodoPartido = record
               dato: partido;
               sig: listaPartidos;
     end;

    listaPuntajes=^nodoListaPuntajes;

    nodoListaPuntajes = record
        fecha:str10;
        dato:integer;
        sig:listaPuntajes;
    end;


    jug=record
        dni:longint;
        nombreApellido: string;
	    posicion: str10;
        puntajes: listaPuntajes;
    end;

    arbol = ^nodoArbol;

    nodoArbol=record
        datos:jug;
        HI:arbol;
        HD:arbol;
    end;



procedure cargarFecha(var s: str10);
var
  dia, mes: integer;
begin
  dia := random(30)+1;
  mes := random(12)+1;
  if(mes = 2) and (dia > 28)then
	dia := 31;
  if((mes = 4) or (mes = 6) or (mes =9) or (mes = 11)) and (dia = 31)then
	dia := 30;
  s := Concat('2022/',IntToStr(mes),'/',IntToStr(dia));
end;

Procedure agregar(var l: listaPartidos; p: partido);
var
   aux: listaPartidos;
begin
     new(aux);
     aux^.dato := p;
     aux^.sig := l;
     l:= aux;
end;

Procedure agregarJugador(var l: lista; j: jugador);
var
   aux: lista;
begin
     new(aux);
     aux^.dato := j;
     aux^.sig := l;
     l:= aux;
end;

procedure cargarJugadores(var l: lista);
var
   j: jugador;
   cant, i, pos: integer;
begin
     cant := random(10)+22;
     for i:=1 to cant do
     begin
          with(j) do begin
              dni := random(36000000)+20000000;
	      nombreApellido:= Concat('Jugador-', IntToStr(dni));
	      pos:= random(4)+1;
              case pos of
                1: posicion:= 'arquero';
                2: posicion:= 'defensa';
                3: posicion:= 'mediocampo';
                4: posicion:= 'delantero';
              end;
              puntaje:= random(10)+1;
          end;
          agregarJugador(l, j);
     end;
end;


procedure crearLista(var l: listaPartidos);
var
   p: partido;
   cant, i: integer;
begin
     cant := random(10);
     for i:=1 to cant do
     begin
          with(p) do begin
               estadio:= Concat('Estadio-', IntToStr(random (500)+1));
               equipoLocal:= Concat('Equipo-', IntToStr(random (200)+1));
               equipoVisitante:= Concat('Equipo-', IntToStr(random (200)+1));
               cargarFecha(fecha);
               jugadores:= nil;
               cargarJugadores(jugadores);
          end;
          agregar(l, p);
     end;
end;



procedure imprimirJugador(j: jugador);
begin
     with (j) do begin
          writeln('Jugador: ', nombreApellido, ' con dni ',dni, ' en posicion: ', posicion, ' y puntaje: ', puntaje);
     end;
end;

procedure imprimirJugadores(l: lista);
begin
     while (l <> nil) do begin
          imprimirJugador(l^.dato);
          l:= l^.sig;
     end;
end;

procedure imprimir(p: partido);
begin
     with (p) do begin
          writeln('');
          writeln('Partido en el ', estadio, ' entre ',equipoLocal, ' y ', equipoVisitante, ' jugado el: ', fecha, ' por los siguientes jugadores: ');
          imprimirJugadores(jugadores);
     end;
end;

procedure imprimirLista(l: listaPartidos);
begin
     while (l <> nil) do begin
          imprimir(l^.dato);
          l:= l^.sig;
     end;
end;


procedure agregarPuntaje(var l: listaPuntajes; p: integer; f:str10);

var
   aux: listaPuntajes;

begin
    new(aux);
    aux^.dato := p;
    aux^.fecha:=f;
    aux^.sig := l;
    l:= aux;
end;

procedure insertarArbol (var a:arbol; j:jugador;f:str10);

begin
     if (a=nil) then 
     begin
        new(a);
        a^.datos.dni:=j.dni;
        a^.datos.nombreApellido:=j.nombreApellido;
        a^.datos.posicion:=j.posicion;
        a^.HI:=nil;
        a^.HD:=nil;
        a^.datos.puntajes:=nil;
        agregarPuntaje(a^.datos.puntajes,j.puntaje,f);
    end
     else
     begin
        if (j.dni < a^.datos.dni) then
            insertarArbol(a^.HI,j,f)
        else if (j.dni > a^.datos.dni) then
            insertarArbol(a^.HD,j,f)
        else
            agregarPuntaje(a^.datos.puntajes,j.puntaje,f);
    end;
end;


procedure recorrerPartidos(l:listaPartidos; var a:arbol);


var aux:lista;


begin
    while (l <> nil) do
    begin
        aux:=l^.dato.jugadores;
        while (aux <> nil) do
        begin
            insertarArbol(a,aux^.dato,l^.dato.fecha);
            aux:=aux^.sig;
        end;
        Writeln('Terminado primer partido');
        l:=l^.sig;
    end;
end;


function puntajeTotal (l:listaPuntajes):integer;

begin
    if (l <> nil) then
        puntajeTotal := l^.dato + puntajeTotal(l^.sig)
    else
        puntajeTotal:=0;
end;

procedure imprimirJug (j:jug);

begin
    Writeln('Nombre y Apellido: ',j.nombreApellido);
    Writeln('DNI: ', j.dni);
    Writeln('Posicion: ',j.posicion);
    Writeln('Puntaje Total: ',puntajeTotal(j.puntajes));
end;


procedure imprimirDatos (a:arbol);

begin
    if (a <> nil) then
    begin
        imprimirDatos(a^.HD);
        imprimirJug(a^.datos);
        imprimirDatos(a^.HI);
    end;
end;


procedure verValoresEnRango (a:arbol; var cant:integer);



begin
    if (a <> nil) then
        if (a^.datos.dni >= 30000000) then
        begin
            if (a^.datos.dni <=40000000) then       
            begin
                cant:=cant+1;
                verValoresEnRango(a^.HI,cant);
                verValoresEnRango(a^.HD,cant);
            end
            else
            verValoresEnRango(a^.HI,cant);
        end
        else
            verValoresEnRango(a^.HD,cant);
end;


procedure posicion (a:arbol; pos:str10 ;var cant:integer);

begin
    if (a <> nil) then
    begin
        if (a^.datos.posicion = pos) then
            cant:=cant+1;
        posicion(a^.HI,pos,cant);
        posicion(a^.HD,pos,cant);
    end;
end;

procedure cantidadDePosicion (a:arbol);

var cant:integer;
    pos:str10;

begin
    cant:=0;
    Writeln('Ingrese la posicion a procesar: ');
    readln(pos);
    posicion(a,pos,cant);
    Writeln('La cantidad de jugadores en la posicion ',pos,' es: ',cant);
end;

var
   l: listaPartidos;
   a:arbol;
cant:integer;

begin
     Randomize;

     l:= nil;
     crearLista(l); {carga automática de la estructura disponible}
     writeln ('Lista generada: ');
     imprimirLista(l);

    a:=nil;

    Writeln('Generando arbol: ');

    recorrerPartidos(l,a);

    Writeln('Arbol generado.');

    Writeln('Datos de los jugadores: ');

    imprimirDatos(a);

     {Completar el programa}

     cant:=0;


     writeln('cantidad de dni entre 30000000 y 40000000: ',cant);

    cantidadDePosicion(a);
    
     writeln('Fin del programa');
end.
