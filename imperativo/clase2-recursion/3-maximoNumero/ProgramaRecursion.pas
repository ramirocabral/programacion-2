program Recursion;

var 
  num, max: integer;

procedure digitoMaximo(n: integer; var max: integer);
var
  dig: integer;
begin
  dig:= n mod 10;
  if ( dig > max ) then
    max:= dig;
  n:= n div 10;
  if (n <> 0) then //caso base : cuando x es 1, ya que no se llama devuelta al procedimiento
    digitoMaximo(n, max);
end;

function digitoMax (n:integer):integer;

var dig:integer;

begin
  dig:=n mod 10;
  if (n = 0) then
      digitoMax := 0
  else
  begin
    n := n div 10;
    if (dig > digitoMax(n)) then
        digitoMax := dig
    else
        digitoMax := digitoMax(n);
  end;
end;

Begin
  max := -1;
  writeln( 'Ingrese un entero no negativo:');
  readln (num);
  writeln ( 'El digito max del numero es: ', digitoMax(num));
End.
