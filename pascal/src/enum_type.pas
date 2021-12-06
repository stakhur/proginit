program EnumType;
type
	WeekDays = (Mon, Tue, Wen, Thi, Fri, Sat, Sun);
var
	day: WeekDays;

begin
	{$I-}
	while (true) do begin
		write('Input day of week: ');
		read(day);
		if (IOResult = 0) then
			break
	end;

	if (day < Sat) then begin
		writeln('Work, work!');
		if (succ(day) = Sat) then
			writeln('Last day of working week :)')
	end
	else begin
		writeln('Weekends!!!');
		if (pred(day) = Sat) then
			writeln('One more weekend!')
	end

end.
