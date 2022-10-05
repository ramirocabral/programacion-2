program twitter;

Uses 
sysutils;

Type
    tweet =   Record
        codigoUsuario:   integer;
        nombreUsuario:   string;
        mensaje:   string;
        esRetweet:   boolean;
    End;

    listaTweets =   ^nodoLista;
    nodoLista =   Record
        dato:   tweet;
        sig:   listaTweets;
    End;

     {Completar agregando aquí las estructuras de dato necesarias en el ejercicio}

    //lista de Usuarios

    usuario =   Record
        nombre :   string;
        codigo :   integer;
    End;

    tw =   Record
        msj :   string;
        rtw :   boolean;
    End;


    listaTw =   ^nodoTw;
    nodoTw =   Record
        dato :   tw;
        sig  :   listaTw;
    End;

    listaUs =   ^nodoUs;
    nodoUs =   record
        dato :   usuario;
        sig :   listaUs;
        tweets :   listaTw;
    End;

{agregarAdelante - Agrega nro adelante de l_ord}
Procedure agregarAdelante(Var l_ord: listaTweets; t: tweet);

Var
    aux:   listaTweets;
Begin
    new(aux);
    aux^.dato := t;
    aux^.sig := l_ord;
    l_ord := aux;
End;



{crearLista - Genera una lista con tweets aleatorios}
Procedure crearLista(Var l_ord: listaTweets);

Var
    t:   tweet;
    texto:   string;
    v :   array [1..10] Of string;
Begin
    v[1] := 'juan';
    v[2] := 'pedro';
    v[3] := 'carlos';
    v[4] := 'julia';
    v[5] := 'mariana';
    v[6] := 'gonzalo';
    v[7] := 'alejandro';
    v[8] := 'silvana';
    v[9] := 'federico';
    v[10] := 'ruth';

    t.codigoUsuario := random(11);
    While (t.codigoUsuario <> 0) Do
        Begin
            texto := Concat(v[t.codigoUsuario], '-mensaje-', IntToStr(random (200)));
            t.nombreUsuario := v[t.codigoUsuario];
            t.mensaje := texto;
            t.esRetweet := (random(2)=0);
            agregarAdelante(l_ord, t);
            t.codigoUsuario := random(11);
        End;
End;


{imprimir - Muestra en pantalla el tweet}
Procedure imprimir(t: tweet);
Begin
    With (t) Do
        Begin
            write('Tweet del usuario @', nombreUsuario, ' con codigo ',codigoUsuario, ': ', mensaje, ' RT:');
            If (esRetweet)Then
                              writeln(' Si')
            Else
                writeln('No ');
        End;
End;


{imprimirLista - Muestra en pantalla la lista l_ord}
Procedure imprimirLista(l_ord: listaTweets);
Begin
    While (l_ord <> Nil) Do
        Begin
            imprimir(l_ord^.dato);
            l_ord := l_ord^.sig;
        End;
End;


{agregarElemento - Resuelve la inserción de la estructura ordenada}
Procedure agregarOrdenado(Var pri:listaTweets; t:tweet);

Var
    nuevo, anterior, actual:   listaTweets;
Begin
    new (nuevo);
    nuevo^.dato := t;
    nuevo^.sig := Nil;
    If (pri = Nil) Then
                       pri := nuevo
    Else
        Begin
            actual := pri;
            anterior := pri;
            While (actual<>Nil) And (actual^.dato.nombreUsuario < nuevo^.dato .nombreUsuario) Do
                Begin
                    anterior := actual;
                    actual := actual^.sig;
                End;
            If (anterior = actual) Then
                                       pri := nuevo
            Else
                anterior^.sig := nuevo;
            nuevo^.sig := actual;
        End;
End;


{generarNuevaEstructura - Resuelve la generación estructura ordenada}
Procedure generarNuevaEstructura (lT: listaTweets; Var listaOrdenada: listaTweets);
Begin
    listaOrdenada := Nil;
    While (lT <> Nil) Do
        Begin
            agregarOrdenado(listaOrdenada, lT^.dato);
            lT := lT^.sig;
        End;
End;

{----------------FIN DE SE DISPONE----------------------}

//agregar usuario a la lista principal

Procedure agregarDetrasUsuario (Var lUs,actNodo:listaUs; data:usuario);

Var nue:   listaUs;
    act:   listaUs;

Begin
    new(nue);
    nue^.dato := data;
    nue^.sig := Nil;
    nue^.tweets := Nil;
    If (lUs = Nil) Then
                       Begin
                           lUs := nue;
                       End
    Else
        Begin
            act := lUs;
            While (act^.sig <> Nil) Do
                Begin
                    act := act^.sig;
                End;
            act^.sig := nue;
        End;
    actNodo := nue;
End;

//agregar tweets a la lista de cada usuario

Procedure agregarDelanteTweet (Var lT:listaTw; data:tw);

Var nue:   listaTw;

Begin
    new(nue);
    nue^.dato := data;
    nue^.sig := lT;
    lT := nue;
End;

//cargar usuarios y tweets

Procedure nuevaLista (l_ord:listaTweets; Var lUs:listaUs);

Var  usAct:   string;
    usAgregado:   usuario;
    twAgregado:   tw;
    actNodo:   listaUs;
Begin
    actNodo := Nil;
    While (l_ord <> Nil) Do
        Begin
            usAct := l_ord^.dato.nombreUsuario;
            usAgregado.nombre := usAct;
            usAgregado.codigo := l_ord^.dato.codigoUsuario;
            agregarDetrasUsuario(lUs,actNodo,usAgregado);
            While (l_ord <> Nil) And (l_ord^.dato.nombreUsuario = usAct) Do
                Begin
                    twAgregado.msj := l_ord^.dato.mensaje;
                    twAgregado.rtw := l_ord^.dato.esRetweet;
                    agregarDelanteTweet(actNodo^.tweets,twAgregado);
                    l_ord := l_ord^.sig;
                End;
        End;
End;

Procedure imprimirListas (lUs:listaUs);

Var actTw:   listaTw;

Begin
    While (lUs <> Nil) Do
        Begin
            Writeln('Usuario: ',lUs^.dato.nombre);
            actTw := lUs^.tweets;
            While (actTw <> Nil) Do
                Begin
                    Write(actTw^.dato.msj,' - ');
                    actTw := actTw^.sig;
                End;
            lUs := lUs^.sig;
            Writeln('');
        End;
End;


Var
    l_ord, l_ordenada:   listaTweets;
    lUs :   listaUs;
Begin
    Randomize;

    l_ord := Nil;
    crearLista(l_ord);
    writeln ('Lista generada: ');
    imprimirLista(l_ord);

     {Se crea la estructura ordenada}
    l_ordenada := Nil;
    generarNuevaEstructura(l_ord,l_ordenada);
    writeln ('Lista ordenada: ');
    imprimirLista(l_ordenada);

     {Completar el programa}
    lUs := Nil;
    Writeln('Creando nueva lista: ');
    nuevaLista(l_ordenada,lUs);
    Writeln('Imprimiendo nueva lista: ');
    imprimirListas(lUs);
    writeln('Fin del programa');
    readln;
End.
