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

    lista=^nodoListaTw;

    nodoListaTw = record
        dato:string;
        rt:boolean;
        sig:lista;
    end;

    usuario = record
        cod:integer;
        nom:string;
        tweets:lista;
    end;

    arbol = ^nodoArbol;

    nodoArbol = record
               dato: usuario;
               HI: arbol;
               HD: arbol;
    end;


     {Completar agregando aquí las estructuras de datos necesarias en el ejercicio}


procedure agregarAdelante (var l:lista; msj:string; rt:boolean);

var aux:lista;

begin
    new(aux);
    aux^.dato:=msj;
    aux^.rt:=rt;
    aux^.sig:=l;
    l:=aux;
end;

procedure insertarAbol(var a:arbol;u:tweet);

begin
    if (a=nil) then begin
        new(a);
        a^.dato.nom:=u.nombreUsuario;
        a^.dato.cod:=u.codigoUsuario;
        a^.HI:=nil;
        a^.HD:=nil;
        a^.dato.tweets:=nil;
        agregarAdelante(a^.dato.tweets,u.mensaje,u.esRetweet);
    end
    else
    begin
        if (u.codigoUsuario < a^.dato.cod) then
            insertarAbol(a^.HI,u)
        else if (u.codigoUsuario > a^.dato.cod) then
            insertarAbol(a^.HD,u)
        else
            agregarAdelante(a^.dato.tweets,u.mensaje,u.esRetweet);
    end;
end;

procedure generarArbol (l:listaTweets; var a:arbol);

begin
    while (l<>nil) do 
    begin
        insertarAbol(a,l^.dato);
        l:=l^.sig;
    end;
end;

//punto B

function contarTweets (l:lista):integer;

var aux:lista;

Begin
    aux:=l;
    contarTweets:=0;
    while (aux<>nil) do
    begin
        contarTweets:=contarTweets+1;
        aux:=aux^.sig;
    end;
end;


procedure busquedaAcotada (a:arbol);

begin
    if (a <> nil) then
        if (a^.dato.cod >= 100) then
        begin
            if (a^.dato.cod < 700) then       
            begin
                write('Usuario: ',a^.dato.cod);
                Writeln(' -- Cantidad de tweets: ',contarTweets(a^.dato.tweets));
                busquedaAcotada(a^.HI);
                busquedaAcotada(a^.HD);
            end
            else
            busquedaAcotada(a^.HI);
        end
        else
            busquedaAcotada(a^.HD);
end;


procedure maximo (a:arbol; var max:integer; var codigo:integer);

begin
    if (a <> nil) then
    begin
        if (contarTweets(a^.dato.tweets) > max) then
        begin
            max := contarTweets(a^.dato.tweets);
            codigo:=a^.dato.cod;
        end;
        maximo(a^.HI,max,codigo);
        maximo(a^.HD,max,codigo);
    end;
end;


{agregarAdelante - Agrega nro adelante de l}
Procedure agregarAdelante(var l: listaTweets; t: tweet);
var
   aux: listaTweets;
begin
     new(aux);
     aux^.dato := t;
     aux^.sig := l;
     l:= aux;
end;



{crearLista - Genera una lista con tweets aleatorios}
procedure crearLista(var l: listaTweets);
var
   t: tweet;
   texto: string;
begin
     t.codigoUsuario := random(2000);
     while (t.codigoUsuario <> 0) do Begin
          texto:= Concat(IntToStr(t.codigoUsuario), '-mensaje-', IntToStr(random (200)));
          t.nombreUsuario := Concat('Usuario-',IntToStr(t.codigoUsuario));
          t.mensaje := texto;
          t.esRetweet := (random(2)=0);
          agregarAdelante(l, t);
          t.codigoUsuario := random(2000);
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



{imprimirLista - Muestra en pantalla la lista l}
procedure imprimirLista(l: listaTweets);
begin
     while (l <> nil) do begin
          imprimir(l^.dato);
          l:= l^.sig;
     end;
end;

var
   l: listaTweets;
   a:arbol;
   max:integer;
    codigo:integer;

begin
     Randomize;

     l:= nil;
     crearLista(l);
     writeln ('Lista generada: ');
     imprimirLista(l);

     {Completar el programa}
    a:=nil;

    generarArbol(l,a);


    busquedaAcotada(a);

    max:=0;

    maximo(a,max,codigo);

    Writeln('Usuario con mayor cantidad de tweets: ', codigo);

    writeln('Fin del programa');
end.
