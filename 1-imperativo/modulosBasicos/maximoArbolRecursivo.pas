function asd (a:arbol):integer;

begin
    if (a <> nil) then
    begin
        asd := a^.dato.puntaje;
        if (asd < asd(a^.Hi) ) then
            asd := asd(a^.Hi)
        else if (asd < asd(a^.Hd) ) then
            asd := asd(a^.Hd);
    end;
end;    