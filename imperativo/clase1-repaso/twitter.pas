Program twitter;
Uses
     sysutils;
Type
     tweet = record
	      codigoUsuario: integer;
	      nombreUsuario: string;
	      mensaje: string;
	      esRetweet: boolean;
     end;

     listaTweets = ^nodoLista;
     nodoLista = record
               dato: tweet;
               sig: listaTweets;
     end;

     {Completar agregando aquí las estructuras de dato necesarias en el ejercicio}
     
     //lista de Usuarios

     usuario = record
          nombre : string;
          codigo : integer;
     end;

     tw = record
          msj : string;
          rtw : boolean;
     end;


     listaTw = ^nodoTw;
     nodoTw = record
          dato : tw;
          sig  : listaTw;
     end;

     listaUs = ^nodoUs;
     nodoUs = record
          dato : usuario;
          sig : listaUs;
          tweets : listaTw;
     end;     

{agregarAdelante - Agrega nro adelante de l_ord}
Procedure agregarAdelante(var l_ord: listaTweets; t: tweet);
var
   aux: listaTweets;
begin
     new(aux);
     aux^.dato := t;
     aux^.sig := l;
     l:= aux;
end;



{crearLista - Genera una lista con tweets aleatorios}
procedure crearLista(var l_ord: listaTweets);
var
   t: tweet;
   texto: string;
   v : array [1..10] of string;
begin
     v[1]:= 'juan';
     v[2]:= 'pedro';
     v[3]:= 'carlos';
     v[4]:= 'julia';
     v[5]:= 'mariana';
     v[6]:= 'gonzalo';
     v[7]:='alejandro';
     v[8]:= 'silvana';
     v[9]:= 'federico';
     v[10]:= 'ruth';

     t.codigoUsuario := random(11);
     while (t.codigoUsuario <> 0) do Begin
          texto:= Concat(v[t.codigoUsuario], '-mensaje-', IntToStr(random (200)));
          t.nombreUsuario := v[t.codigoUsuario];
          t.mensaje := texto;
          t.esRetweet := (random(2)=0);
          agregarAdelante(l_ord, t);
          t.codigoUsuario := random(11);
     end;
end;


{imprimir - Muestra en pantalla el tweet}
procedure imprimir(t: tweet);
begin
     with (t) do begin
          write('Tweet del usuario @', nombreUsuario, ' con codigo ',codigoUsuario, ': ', mensaje, ' RT:');
          if(esRetweet)then
               writeln(' Si')
          else
               writeln('No ');
     end;
end;


{imprimirLista - Muestra en pantalla la lista l_ord}
procedure imprimirLista(l_ord: listaTweets);
begin
     while (l_ord <> nil) do begin
          imprimir(l_ord^.dato);
          l_ord:= l_ord^.sig;
     end;
end;


{agregarElemento - Resuelve la inserción de la estructura ordenada}
procedure agregarOrdenado(var pri:listaTweets; t:tweet);
var
   nuevo, anterior, actual: listaTweets;
begin
     new (nuevo);
     nuevo^.dato:= t;
     nuevo^.sig := nil;
     if (pri = nil) then
          pri := nuevo
     else
     begin
          actual := pri;
          anterior := pri;
          while (actual<>nil) and (actual^.dato.nombreUsuario < nuevo^.dato .nombreUsuario) do begin
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


{generarNuevaEstructura - Resuelve la generación estructura ordenada}
procedure generarNuevaEstructura (lT: listaTweets; VAR listaOrdenada: listaTweets);
begin
     listaOrdenada := nil;
     while(lT <> nil) do begin
          agregarOrdenado(listaOrdenada, lT^.dato);
          lT := lT^.sig;
     end;
end;

{----------------FIN DE SE DISPONE----------------------}

//agregar usuario a la lista principal

procedure agregarDetrasUsuario (var lUs,actNodo:listaUs; data:usuario);

var nue:listaUs; act:listaUs;

begin
     new(nue);
     nue^.dato:=data;
     nue^.sig:=nil;
     nue^.tweets:=nil;
     if (lUs = nil) then
     begin
          lUs := nue;
     end
     else
     begin
          act := lUs;
          while (act^.sig <> nil) do
          begin
               act := act^.sig;
          end;
          act^.sig:=nue;
     end;
     actNodo:=nue;
end;

//agregar tweets a la lista de cada usuario

procedure agregarDelanteTweet (var lT:listaTw; data:tw);

var nue:listaTw;

begin
     new(nue);
     nue^.dato:=data;
     nue^.sig:=lT;
     lT:=nue;
end;

//cargar usuarios y tweets

procedure nuevaLista (l_ord:listaTweets; var lUs:listaUs);

var  usAct:string; 
     usAgregado:usuario;
     twAgregado:tw;
     actNodo:listaUs;
begin
     actNodo:=nil;
     while (l_ord <> nil) do
     begin
          usAct := l_ord^.dato.nombreUsuario;
          usAgregado.nombre := usAct;
          usAgregado.codigo := l_ord^.dato.codigoUsuario;
          agregarDetrasUsuario(lUs,actNodo,usAgregado);
          while (l_ord <> nil) and (l_ord^.dato.nombreUsuario = usAct) do
          begin
               twAgregado.msj:=l_ord^.dato.mensaje;
               twAgregado.rtw:=l_ord^.dato.esRetweet;
               agregarDelanteTweet(actNodo^.tweets,twAgregado);
               l_ord:=l_ord^.sig;
          end; 
     end;
end;

procedure imprimirListas (lUs:listaUs);

var actTw:listaTw;

begin
     while (lUs <> nil) do
     begin
          Writeln('Usuario: ',lUs^.dato.nombre);
          actTw:=lUs^.tweets;
          while (actTw <> nil) do
          begin
               Write(actTw^.dato.msj,' - ');
               actTw := actTw^.sig;
          end;
          lUs := lUs^.sig;
          Writeln('');
     end; 
end;


var
   l_ord, l_ordenada: listaTweets;
   lUs : listaUs;
begin
     Randomize;

     l_ord:= nil;
     crearLista(l_ord);
     writeln ('Lista generada: ');
     imprimirLista(l_ord);

     {Se crea la estructura ordenada}
     l_ordenada:= nil;
     generarNuevaEstructura(l_ord,l_ordenada);
     writeln ('Lista ordenada: ');
     imprimirLista(l_ordenada);

     {Completar el programa}
     lUs := nil;
     Writeln('Creando nueva lista: ');
     nuevaLista(l_ordenada,lUs);
     Writeln('Imprimiendo nueva lista: ');
     imprimirListas(lUs);
     writeln('Fin del programa');
     readln;
end.
