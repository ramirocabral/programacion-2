
Program productos;

Uses 
sysutils;

Type 
    lista= ^Nodo;

    Nodo= Record
           datos: integer;
           sig: lista;
        End;
    
     {estructura del arbol}

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


{---------------se genera una lista aleatoria de enteros-------------}



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


{---------------------Fin de se dispone--------------------------}

//procedimiento para insertar un valor en un arbol

Procedure insertarArbol (Var a:arbol ; data:integer);

Var nue: arbol;

Begin
    If (a = Nil) Then
        Begin
            new(nue);
            nue^.datos := data;
            nue^.HI := Nil;
            nue^.HD := Nil;
            a := nue;
        End
    Else
    begin
        If (data < a^.datos) Then
            insertarArbol(a^.HI,data)
        Else
        If (data > a^.datos) Then
            insertarArbol(a^.HD,data);
    end;
End;


procedure generarArbol (var a:arbol; l:Lista);

begin
    While (l <> Nil) Do
    Begin
        insertarArbol(a,l^.datos);
        l := l^.sig;
    End;
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

{-------buscar el minimo o maximo en un arbol ordenado-------}



function minimoArbol (a:arbol):integer;

begin
    if (a=nil) then
        minimoArbol := -1
    else
    begin
        if (a^.HI = nil) then
            minimoArbol := a^.datos
        else
            minimoArbol := minimoArbol(a^.HI);
    end;
end;


function maximoArbol (a:arbol):integer;

begin
    if (a=nil) then
        maximoArbol := -1
    else
    begin
        if (a^.HD = nil) then
            maximoArbol := a^.datos
        else
            maximoArbol := maximoArbol(a^.HD);
    end;
end;


Var 
    l:   Lista;
    a:   arbol;
    qAct,qSig : cola;
    level,n,num:integer;
Begin
    //generar lista random

    Randomize;
    l:=nil;
    n := random (100);
    while (n<>0) do 
    begin
      AgregarAdelante (l, n);
      n := random (100);
    end;
    writeln ('lista generada: ');
    imprimir (l);

    //generar arbol a partir de la lista
    a := nil;
    generarArbol(a,l);

    //imprimir arbol por niveles

    qAct := nil;
    qSig := nil;

    insertarDetras(qAct,a);
    level := 1;

    Writeln('Arbol por niveles: ');
    writeln();
    write('Nivel 1: ');
    imprimirPorNivel(qAct,qSig,level);
    Writeln();
    //buscar un determinado valor en el arbol
    Writeln('Minimo valor del arbol: ',minimoArbol(a));
    Writeln('Maximo valor del arbol: ',maximoArbol(a));
End.
