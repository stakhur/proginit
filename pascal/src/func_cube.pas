program FuncCube;

function Cube(x: real): real;
begin
	Cube := x*x*x
end;

var
	v: real;
begin
	write('Input value: ');
	readln(v);

	writeln(v, '^3 = ', Cube(v))
end.
