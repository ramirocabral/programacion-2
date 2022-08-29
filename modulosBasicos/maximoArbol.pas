function maximoPuntaje (a:arbol):integer;

begin
    if (a <> nil) then
    begin
        maximoPuntaje := a^.dato.puntaje;
        if (maximoPuntaje < maximoPuntaje(a^.Hi) ) then
            maximoPuntaje := maximoPuntaje(a^.Hi)
        else if (maximoPuntaje < maximoPuntaje(a^.Hd) ) then
            maximoPuntaje := maximoPuntaje(a^.Hd);
    end;
end;