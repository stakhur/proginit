program square100;
var
	x: integer = 0;
begin
	x := 1;
	while (x < 100) do
	begin
		write(x*x, ' ');
		x := x + 1
	end
end.
