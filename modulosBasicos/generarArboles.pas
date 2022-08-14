{Inserta un arbol a partir de los datos de una lista}

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



