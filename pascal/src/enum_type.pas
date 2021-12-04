program EnumType;
type
	WeekDays = (Mon, Tue, Wen, Thi, Fri, Sat, Sun);
var
	day: WeekDays;

begin
	read(day);

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
