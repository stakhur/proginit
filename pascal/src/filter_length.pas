program FilterLength;

var
	c: char;
	n: integer = 0;
begin
	while (not eof) do
	begin
		read(c);
		if (c = #10) then
		begin
			writeln(n);
			n := 0
		end
		else
			n := n + 1
	end;
	writeln(n)
end.
