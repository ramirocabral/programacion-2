procedure insertarDetras(var l : lista; data : integer);

var nue,act : lista;

begin
    new(nue);
    nue^.nodo := data;
    nue^.sig := nil;
    act := l;
    if (l = nil) then
        l := nue
    else
    begin
        while (act^.sig <> nil) do
            act := act^.sig;
        act^.sig := nue;
    end;
end;


Procedure agregarOrdenado(Var l:lista; num:integer);

Var
    nuevo, anterior, actual:   lista;
Begin
    new (nuevo);
    nuevo^.datos := num;
    nuevo^.sig := Nil;
    If (l = Nil) Then
        l := nuevo
    Else
    Begin
        actual := l;
        anterior := l;
        While (actual<>Nil) And (actual^.datos < nuevo^.datos) Do
        Begin
            anterior := actual;
            actual := actual^.sig;
        End;
        If (anterior = actual) Then
            l := nuevo
        Else
            anterior^.sig := nuevo;
        nuevo^.sig := actual;
    End;
End;

procedure agregarDetras (var l : lista; data : integer);

var nue,act : lista;

begin
    new(nue);
    nue^.nodo := data;
    nue^.sig := nil;
    act := l;
    if (l = nil) then
        l := nue
    else
    begin
        while (act^.sig <> nil) do
            act := act^.sig;
        act^.sig := nue;
    end;
end;

procedure eliminarDelante(var l : lista);

var act : lista;

begin
    act := l;
    l := l^.sig;
    dispose(act);
end;