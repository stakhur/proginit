program StarSlash;
var
	row, spaces: integer;
begin
	for row := 1 to 24 do
	begin
		for spaces := 0 to row - 1 do
			write(' ');
		writeln('*')
	end
end.
