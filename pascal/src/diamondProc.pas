program Diamond;

procedure PrintChar(printDiamond: boolean);
const
	SYMB_DIAM = '*';
	SYMB_SPACE = ' ';
begin
	if (printDiamond) then
		write(SYMB_DIAM)
	else
		write(SYMB_SPACE)
end;

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
			if (row <= n) then
				PrintChar((col = n - row) or (col = n + row))
			else
				PrintChar((col = row - n) or (col = (3*n - row)))
		end;
		writeln()
	end
end.
