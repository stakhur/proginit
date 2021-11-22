program Diamond;
var
	n, size, row, col: integer;
begin
	repeat
		write('Enter size of the diamond: ');
		readln(n)
	until (n >= 0);

	size := n * 2 + 1;

	for row := 0 to size - 1 do
	begin
		for col := 0 to size - 1 do
		begin
			if (row <= n) then begin
				if ((col = n - row) or (col = n + row)) then
					write('*')
				else
					write(' ')
			end
			else begin
				if ((col = row - n) or (col = (3*n - row))) then
					write('*')
				else
					write(' ')
			end
		end;
		writeln()
	end
end.
