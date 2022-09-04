procedure preOrden (a:arbol);

begin
    if (a <> nil) then
    begin
        writeln(a^.dato);
        preOrden(a^.izq);
        preOrden(a^.der);
    end;
end;



procedure enOrden (a:arbol);

begin
    if (a<>nil) then
    begin
        enOrden(a^.izq);
        writeln(a^.dato);
        enOrden(a^.der);
    end;
end;

procedure posOrden (a:arbol);

begin
    if (a<>nil) then
    begin
        posOrden(a^.izq);
        posOrden(a^.der);
        writeln(a^.dato);
    end;
end;