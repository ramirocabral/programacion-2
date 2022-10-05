procedure busquedaAcotada (a:arbol; inf,sup:integer);

begin
    if (a <> nil) then
        if (a^.datos >= inf) then
        begin
            if (a^.datos <=sup) then       
            begin
                Writeln(a^.datos);
                busquedaAcotada(a^.HI,inf,sup);
                busquedaAcotada(a^.HD,inf,sup);
            end
            else
            busquedaAcotada(a^.HI,inf,sup);
        end
        else
            busquedaAcotada(a^.HD,inf,sup);
end;