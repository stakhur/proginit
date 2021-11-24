program VarParam;

procedure powers(x: real; var quad, cube, fourth: real);
begin
	quad := x * x;
	cube := quad * x;
	fourth := cube * x
end;

var
	x, p, q, r: real;
begin
	write('Enter value: ');
	readln(x);
	powers(x, p, q, r);

	writeln(x:4:1, '^2 = ', p:6:2);
	writeln(x:4:1, '^3 = ', q:6:2);
	writeln(x:4:1, '^4 = ', r:6:2)
end.
