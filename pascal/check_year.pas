program check_year;
var
	year: integer = 0;
begin
	write('Please type in your birth year: ');
	readln(year);
	while ((year < 1990) or (year > 2020)) do
	begin
		writeln(year, ' is not a valid year');
		write('Please try again: ');
		readln(year)
	end;
	writeln('The year ', year, ' is accepted. Thank you!')
end.

