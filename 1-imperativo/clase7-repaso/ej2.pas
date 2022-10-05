program ej2;

type 
    libro=record
        titulo:string;
        ISBN:integer;
        clase:string;
    end;

    arbol = ^nodoArbol;

    nodoArbol = record
        dato:libro;
        HI: arbol;
        HD: arbol;
    end;

procedure insertarArbol (var a:arbol; data:libro);

begin
    if (a = nil) then begin
        new(a);
        a^.dato := data;
        a^.HI := nil;
        a^.HD := nil;
    end
    else begin
        if (data.ISBN < a^.dato.ISBN) then 
            insertarArbol(a^.HI, data)
        else 
            insertarArbol(a^.HD, data)
    end;
end;

procedure leerLibro (var l:libro);

begin
    writeln('Ingrese el ISBN del libro');
    readln(l.ISBN);
    with l do
    begin
        if (ISBN <> 0) then
        begin
            writeln('Ingrese el titulo del libro');
            readln(titulo);
            writeln('Ingrese la clase del libro');
            readln(clase);
        end
    end;
end;


procedure generarArbol (var a:arbol);

var l:libro;

begin
    leerLibro(l);
    while (l.ISBN <> 0) do begin
        insertarArbol(a, l);
        leerLibro(l);
    end;
end;


function buscar (a:arbol ; ISBN:integer):boolean;

begin
    if (a = nil) then
        buscar := false
    else 
    begin
        if (a^.dato.ISBN = ISBN) then
            buscar := true
        else 
        begin
            if (ISBN < a^.dato.ISBN) then
                buscar := buscar(a^.HI, ISBN)
            else
                buscar := buscar(a^.HD, ISBN);
        end;
    end;
end;

function contarClase (a:arbol; clase:string):integer;

begin
    if (a = nil) then
        contarClase := 0
    else 
    begin
        if (a^.dato.clase = clase) then
            contarClase := contarClase(a^.HI, clase) + contarClase(a^.HD, clase) + 1
        else
            contarClase := contarClase(a^.HI, clase) + contarClase(a^.HD, clase);
    end;
end;

function tituloEnArbol (a:arbol; title:string):boolean;

begin
    if (a <> nil) then
    begin
        if (a^.dato.titulo = title) then
            tituloEnArbol := true
        else
        begin
            tituloEnArbol := tituloEnArbol(a^.HI, title);
            if (not tituloEnArbol) then
                tituloEnArbol := tituloEnArbol(a^.HD, title);
        end;
    end;
end;


procedure buscarISBN (a:arbol);

var ISBN:integer;

begin
    writeln('Ingrese el ISBN del libro que desea buscar');
    readln(ISBN);
    if (buscar(a, ISBN)) then
        writeln('El libro se encuentra en el arbol')
    else
        writeln('El libro no se encuentra en el arbol');
end;

procedure buscarCodigo (a:arbol);

var clase:string;
    cant:integer;

begin
    writeln('Ingrese la clase de libro que desea buscar');
    readln(clase);
    cant := contarClase(a, clase);
    if (cant = 0) then
        writeln('No hay libros de la clase ', clase)
    else
        writeln('Hay ', cant, ' libros de la clase ', clase);
end;

procedure buscarTitulo (a:arbol);

var title:string;

begin
    writeln('Ingrese el titulo del libro que desea buscar');
    readln(title);
    if (tituloEnArbol(a, title)) then
        writeln('El libro se encuentra en el arbol')
    else
        writeln('El libro no se encuentra en el arbol');
end;


var a:arbol;

begin
    generarArbol(a);
    buscarISBN(a);
    buscarCodigo(a);
    buscarTitulo(a);
end.