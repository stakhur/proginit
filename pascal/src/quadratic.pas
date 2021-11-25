program Quadratic;

procedure quadratic(a, b, c: real;
		var ok: boolean;
		var x1, x2: real);
var
	d: real;
begin
	ok := false;
	if (a = 0) then
		exit;

	d := b*b - 4*a*c;
	if (d < 0) then
		exit;

	d := sqrt(d);
	x1 := (-b - d) / (2*a);
	x2 := (-b + d) / (2*a);
	ok := true
end;

var
	ok: boolean;
	x1, x2: real;
begin
	quadratic(2,4,6,ok,x1,x2);
	if (ok) then
		writeln('x1=', x1, '\nx2=', x2)
end.
