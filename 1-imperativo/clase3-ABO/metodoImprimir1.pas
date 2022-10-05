{metodo para imprimir los valores de cada nivel de un arbol, usando dos listas cola,una para el nivel actual y otra para el siguiente}

program metodo1;

arbol =   ^nodoArbol;

    nodoArbol =   Record
        datos :   integer;
        HI:   arbol;
        HD:   arbol;
    End;

    //listas para nivel actual y siguiente del arbol

    cola = ^nodoCola;

    nodoCola = record
        nodo : arbol;
        sig : cola;
    end;

{---------------------------Imprimir el arbol por niveles--------------------------}

procedure insertarDetras(var q : cola; data : arbol);

var nue,act : cola;

begin
    new(nue);
    nue^.nodo := data;
    nue^.sig := nil;
    act := q;
    if (q = nil) then
        q := nue
    else
    begin
        while (act^.sig <> nil) do
            act := act^.sig;
        act^.sig := nue;
    end;
end;

procedure eliminarDelante (var q:cola);

var aux:cola;

begin
    aux := q;
    q := q^.sig;
    dispose(aux);
end;


procedure imprimirPorNivel (var qAct,qSig:cola; var level : integer);

begin
    if (qAct <> nil) or (qSig <> nil) then
    begin
        if (qAct = nil) and (qSig <> nil) then
        begin   
            Writeln();
            level := level + 1;
            Write('Nivel ',level,': ');
            imprimirPorNivel(qSig,qAct,level);
        end
        else 
        begin
            if (qAct^.nodo^.HI <> nil) then
                insertarDetras(qSig,qAct^.nodo^.HI);
            if (qAct^.nodo^.HD <> nil) then
                insertarDetras(qSig,qAct^.nodo^.HD);
            Write(qAct^.nodo^.datos,' ');
            eliminarDelante(qAct);
            imprimirPorNivel(qAct,qSig,level);
        end;
    end; 
end;

var 
    a:arbol;
    qAct,qSig:cola;
    level:integer;

begin
    qAct := nil;
    qSig := nil;
    level := 1;
    insertarDetras(qAct,a);
    Writeln('Arbol por niveles: ');
    writeln();
    write('Nivel 1: ');
    imprimirPorNivel(qAct,qSig,level);
end.