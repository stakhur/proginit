program SpecSymbol;
uses crt;

var
	tmp: integer;
begin
	for tmp := 10 to 99 do
	begin
		{ page 316 - control characters }
		write(#13, tmp);
		delay(50)
	end;

	writeln()
end.
