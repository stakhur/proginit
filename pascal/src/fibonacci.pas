program Fib;

function Fibonacci(n: integer): longint;
var
	i: integer;
	p, q, r: longint;
begin
	if (n <= 0) then
	begin
		Fibonacci := 0;
		exit
	end;

	q := 0;
	r := 1;
	for i := 2 to n do
	begin
		p := q;
		q := r;
		r := p + q
	end;
	Fibonacci := r
end;

var
	test: integer;
begin
	write('Input n to calc Fibonacci: ');
	read(test);
	writeln('Fibonacci(', test, ') = ', Fibonacci(test))
end.
