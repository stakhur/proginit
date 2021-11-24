program PrintNumber;

procedure PrintDigitsOfNumber(x: integer);
begin
	if (x > 0) then
	begin
		PrintDigitsOfNumber(x div 10);
		write(x mod 10, ' ')
	end
end;

var
	x: integer;
begin
	write('Enter number: ');
	readln(x);
	PrintDigitsOfNumber(x);
	writeln()
end.
