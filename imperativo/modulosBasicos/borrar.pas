procedure borrar(var a:arbol; num:integer; var exito:boolean);

var aux:arbol;

begin
    if (a <> nil) then
    begin
        if (num > a^.datos) then
            borrar(a^.HD,num,exito)
        else if (num < a^.datos) then
            borrar(a^.HI,num,exito)
        else    {se encontro el dato a borrar}
        begin
            if (a^.HI = nil) then
            begin
                aux:=a;
                a:=a^.HD;
                dispose(aux);
                exito:=true;
            end
            else if (a^.HD = nil) then
            begin
                aux:=a;
                a:=a^.HI;
                dispose(aux);
                exito:=true;
            end
            else if (a^.HD <> nil) and (a^.HI <>  nil) then
            begin
                a^.datos:=buscarMinimo(a^.HD)^.datos;
                borrar(a^.HD,a^.datos,exito);
                exito:=true;
            end;
        end;
    end
    else
        exito := false;
end;