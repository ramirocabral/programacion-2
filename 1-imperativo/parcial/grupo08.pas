Program TPGrupo8; 
Uses
     sysutils;

Type
     str70= string[70];
     
	 jugador = record
        DNI: longint;
	    nombre_apellido: str70;
        equipo: str70;
	    goles: integer;
     end;

     lista = ^nodoLista;
     nodoLista = record
	    dato: jugador;
	    sig: lista;
     end;

	fecha=record
		dia:1..31;
		mes:1..12;
		anio:integer;
	end;
	
    partido= record
		identificador: longint;
		local: str70;
		visitante: str70;
		fecha_partido: fecha;
        estadio: str70;
		goleadores: lista;
     end;


     listaPartidos = ^nodoPartidos;
     nodoPartidos = record
            dato: partido;
            sig: listaPartidos;
     end;


     nombres= array [1..20] of str70;

     {Completar con los tipos de datos necesarios}

     listaJugador = ^nodoListaJugador;

     nodoListaJugador = record
        f:fecha;
        goles:integer;
        sig: listaJugador;
     end;


     player = record
        DNI:longInt;
        nombre_apellido:str70;
        equipo:str70;
        partidos:listaJugador;
    end;


    arbol = ^nodoArbol;

    nodoArbol = record
        dato: player;
        HI: arbol;
        HD: arbol;
    end;

procedure insertarLista(var l:listaJugador; goles:integer ;f:fecha);

var nue:listaJugador;

begin
    new(nue);
    nue^.f:=f;
    nue^.goles:=goles;
    nue^.sig:=l;
    l:=nue;
end;


procedure insertarArbol(var a:arbol; data:jugador; f:fecha);

begin
    if (a = nil) then 
    begin
        new(a);
        a^.dato.DNI:=data.DNI;
        a^.dato.nombre_apellido:=data.nombre_apellido;
        a^.dato.equipo:=data.equipo;
        a^.dato.partidos:=nil;
        insertarLista(a^.dato.partidos,data.goles,f);
        a^.HI:=nil;
        a^.HD:=nil;
    end
    else
    begin
        if (data.DNI < a^.dato.DNI) then
            insertarArbol(a^.HI, data,f)
        else if (data.DNI > a^.dato.DNI) then
            insertarArbol(a^.HD, data,f)
        else
            insertarLista(a^.dato.partidos,data.goles,f);
    end;
end;


procedure generarArbol (l:listaPartidos ; var a:arbol);

var aux:lista;

begin
    while (l <> nil) do
    begin
        aux:=l^.dato.goleadores;
        while (aux <> nil) do
        begin
            insertarArbol(a,aux^.dato,l^.dato.fecha_partido);
            aux:=aux^.sig;
        end;
        l:=l^.sig;
    end;
end;

//inciso A

function contarGoles (l:listaJugador):integer;

var aux:listaJugador; cant:integer;

begin
    aux:=l;
    cant:=0;
    while (aux <> nil) do
    begin
        cant:=cant+aux^.goles;
        aux:=aux^.sig;
    end;
    contarGoles:=cant;
end;


procedure maximoGoleador (a:arbol; var max:integer; var equipo:str70);

var cant:integer;

begin
    if (a <> nil) then
    begin
        maximoGoleador(a^.HI,max,equipo);
        cant:=contarGoles(a^.dato.partidos);
        if (cant > max) then
        begin
            max:=cant;
            equipo:=a^.dato.equipo;
        end;
        maximoGoleador(a^.HD,max,equipo);
    end;
end;


//inciso C

procedure busquedaAcotada (a:arbol; inf,sup:longInt);

begin
    if (a <> nil) then
    begin
        if (a^.dato.DNI >= inf) then
        begin
            if (a^.dato.DNI <=sup) then       
            begin
                busquedaAcotada(a^.HI,inf,sup);
                Writeln('DNI: ',a^.dato.DNI);
                Writeln('Apellido y Nombre: ',a^.dato.nombre_apellido);
                busquedaAcotada(a^.HD,inf,sup);
            end
            else
            busquedaAcotada(a^.HI,inf,sup);
        end
        else
            busquedaAcotada(a^.HD,inf,sup);
    end;
end;

//inciso D

procedure enOrden (a:arbol);

begin
    if (a <> nil) then
    begin
        enOrden(a^.HI);
        Writeln('DNI: ',a^.dato.DNI);
        Writeln('Apellido y Nombre: ',a^.dato.nombre_apellido);
        enOrden(a^.HD);
    end;
end;

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

procedure borrar(var a:arbol; dni:longInt; var exito:boolean);

var aux:arbol;

begin
    if (a <> nil) then
    begin
        if (dni > a^.dato.DNI) then
            borrar(a^.HD,dni,exito)
        else if (dni < a^.dato.DNI) then
            borrar(a^.HI,dni,exito)
        else    {se encontro el dato a borrar}
        begin
            if (a^.HI = nil) then
            begin
                aux:=a;
                a:=a^.HD;
                dispose(aux);
                exito:=true;
            end
            else if (a^.HD = nil) then
            begin
                aux:=a;
                a:=a^.HI;
                dispose(aux);
                exito:=true;
            end
            else if (a^.HD <> nil) and (a^.HI <>  nil) then
            begin
                a^.dato:=buscarMinimo(a^.HD)^.dato;
                borrar(a^.HD,a^.dato.DNI,exito);
                exito:=true;
            end;
        end;
    end
    else
        exito := false;
end;


////////////////////////////////////////////



procedure cargarFecha(var f: fecha);
begin
  f.dia:= random(30)+1;
  f.mes := random(12)+1;
  if(f.mes = 2) and (f.dia > 28)then
	f.dia := 28
  else
	if((f.mes = 4) or (f.mes = 6) or (f.mes =9) or (f.mes = 11)) and (f.dia = 31)then
		f.dia := 30;
  f.anio:=2022;
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

procedure cargarEquipos(var v:nombres );
begin
     v[1]:='Atletico Tucuman';
     v[2]:='Huracan';
     v[3]:='Gimnasia LP';
     v[4]:='Godoy Cruz';
     v[5]:='Argentino Juniors';
     v[6]:='River';
     v[7]:='Boca';
     v[8]:='Racing';
     v[9]:='Platense';
     v[10]:='San Lorenzo';
     v[11]:='Patronato';
     v[12]:='Estudiantes';
     v[13]:='Union';
     v[14]:='Newells';
     v[15]:='Barracas';
     v[16]:='Tigre';
     v[17]:='Arsenal';
     v[18]:='Sarmiento';
     v[19]:='Central';
     v[20]:='Colon';
end;

procedure cargarJugadores(var l: lista; local, visitante:str70);
var
   j: jugador;
   cant, i, pos, loc_vis: integer;
   v: nombres;
begin
     cant := random(2);
     v[1]:='Lionel Perez';
     v[2]:='Martin Fernandez';
     v[3]:='Mariano Gomez';
     v[4]:='Alejandro Gonzalez';
     v[5]:='Fermin Martinez';
     v[6]:='Nicolas Castro';
     v[7]:='Gonzalo Villareal';
     v[8]:='Tadeo Parodi';
     v[9]:='Juan Pablo Silvestre';
     v[10]:='Mariano Sanchez';
     v[11]:='Alejo Monden';
     v[12]:='Agustin Paz';
     v[13]:='Juan Salto';
     v[14]:='Matias Pidone';
     v[15]:='Luis Hernandez';
     v[16]:='Cristian Herrera';
     v[17]:='Santiago Manzur';
     v[18]:='Julian Darino';
     v[19]:='Victor Abila';
     v[20]:='Luciano Segura';
     if((local='Colon')or(visitante='Colon'))then
     begin
        with(j) do begin
           DNI := 34807474;
           nombre_apellido:='Leandro Romanut';
		   equipo:='Colon';
		   goles:=random(3)+1;
        end;
        agregarJugador(l, j);
     end;
     for i:=1 to cant do
     begin
       with(j) do begin
          DNI := random(18000000)+20000000;;
          pos:= random(20)+1;
          nombre_apellido:= v[pos];
          loc_vis:= random(2)+1;
          if(loc_vis=1)then
            equipo:=local
          else
            equipo:=visitante;
	      goles:=random(3)+1;
       end;
       agregarJugador(l, j);
     end;
end;

procedure crearLista(var l: listaPartidos);
var
   p: partido;
   cant,i,pos,loc,vis: integer;
   v, v2: nombres;
begin
     cant := random(20)+1;
     v[1]:= 'Antonio Vespucio Liberti';
     v[2]:= 'Mario Alberto Kempes';
     v[3]:= 'Alberto Armando';
     v[4]:= 'Ciudad de La Plata';
     v[5]:= 'Presidente Peron';
     v[6]:= 'Jose Amalfitani';
     v[7]:= 'Tomas Adolfo Duco';
     v[8]:= 'Libertadores de America';
     v[9]:= 'Pedro Bidegain';
     v[10]:= 'Nestor Diaz Perez';
     v[11]:= 'Marcelo Bielsa';
     v[12]:= 'Gigante de Arroyito';
     v[13]:= 'Malvinas Argentinas';
     v[14]:= 'Brigadier General Estanislao Lopez';
     v[15]:= 'Eduardo Gallardon';
     v[16]:= 'Jose Maria Minella';
     v[17]:= 'Florencio Sola';
     v[18]:= 'Monumental Jose Fierro';
     v[19]:= 'Nueva Espa�a';
     v[20]:= 'Nuevo Francisco Urbano';
     cargarEquipos(v2);
     for i:=1 to cant do
     begin
          with(p) do begin
               identificador:= random (100000)+1;
               pos:= random(20)+1;
               estadio:= v[pos];
               loc:= random(20)+1;
               local:=v2[loc];
               vis:= random(20)+1;
               visitante:=v2[vis];
               while(local=visitante)do
               begin
                   vis:= random(20)+1;
                   visitante:=v2[vis];
               end;
               cargarFecha(fecha_partido);
               goleadores:= nil;
               cargarJugadores(goleadores, local, visitante);
          end;
          agregar(l, p);
       end;
end;


procedure imprimirJugador(j: jugador);
begin
     with (j) do begin
          writeln('JUGADOR: ', nombre_apellido, ' | DNI: ',DNI, ' | EQUIPO: ', equipo, ' | GOLES: ', goles);
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
          writeln('PARTIDO: ', identificador, ' | EQ. LOCAL: ',local, ' | EQ. VISITANTE: ', visitante, ' | FECHA: ', fecha_partido.dia,'/',fecha_partido.mes,'/',fecha_partido.anio, ' | ESTADIO: ', estadio);
          imprimirJugadores(goleadores);
     end;
end;

procedure imprimirLista(l: listaPartidos);
begin
     while (l <> nil) do begin
          imprimir(l^.dato);
          l:= l^.sig;
     end;
end;


var
   l: listaPartidos;
   max:integer;
   equipoMax:str70;
   a:arbol;
   inf,sup:longInt;  {variables longInt ya que pascal no deja hacer constantes con enteros tan grandes}
   exito:boolean;

begin
     Randomize;

     l:= nil;
     crearLista(l); {carga automatica de la estructura disponible}
     writeln ('LISTA GENERADA: ');
     imprimirLista(l);

     {Completar el programa}
    //inciso A

    a:=nil;
    generarArbol(l,a);

    //inciso B
    Writeln('---------------------------------------------');
    Writeln('Inciso B:');
    max:=0;
    equipoMax:='';
    maximoGoleador(a,max,equipoMax);
    Writeln('El equipo del goleador es: ', equipoMax, ' con ', max, ' goles');

    //inciso C  
    Writeln('---------------------------------------------');
    Writeln('Inciso C:');
    inf:=28000000;
    sup:=32000000;
    busquedaAcotada(a,inf,sup);

    //inciso D

    Writeln('---------------------------------------------');
    Writeln('Inciso D: ');
    Writeln('Jugadores cargados: ');

    enOrden(a);
    borrar(a,34807474,exito);
    if not exito then
        Writeln('No se encontro el jugador con dni 34807474')
    else
    begin
        Writeln();
        Writeln('Se borro el jugador con dni 34807474');
        Writeln('Resultado: ');
        enOrden(a);
    end;
    writeln('Fin del programa');
    readln;
end.
