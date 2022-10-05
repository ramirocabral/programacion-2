function buscar (a:arbol; num:integer):arbol;

begin
    if (a = nil) then
        buscar := nil
    else
    begin
        if (num < a^.datos) then
            buscar := buscar(a^.HI,num)
        else
        if (num > a^.datos) then
            buscar := buscar(a^.HD,num)
        else
            buscar := a;
    end;
end;