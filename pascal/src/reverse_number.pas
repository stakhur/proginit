program ReverseNumber;

function DoReverseNumber(n, m: longint): longint;
begin
	if n = 0 then
		DoReverseNumber := m
	else
		DoReverseNumber :=
			DoReverseNumber(n div 10, m * 10 + n mod 10)
end;

function ReverseNumber(n: longint): longint;
begin
	ReverseNumber := DoReverseNumber(n, 0)
end;

var
	x: longint;
begin
	write('Input number to reverse: ');
	readln(x);
	writeln('Reversed number of ', x, ' is ', ReverseNumber(x))
end.
