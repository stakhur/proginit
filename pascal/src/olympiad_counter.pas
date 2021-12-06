{На вход подается список в формате:
Идентификатор Фамилия
Идентификатор Фамилия
...
Где идентификатор - <School><PupilId>
<School> - 1-67
<PupilId> - 1-100

Найти школы с наибольшим количеством участников}
program OlympiadCounter;
const
	MaxSchool = 67;
	MaxGroup = 100;

type
	CountersArray = array [1 .. MaxSchool] of integer;

var
	counters: CountersArray;
	i, c, n: integer;

begin
	for i := 1 to MaxSchool do
		counters[i] := 0;

	{$I-}
	while (not eof) do begin
		readln(c);
		if (IOResult <> 0) then begin
			writeln('Incorrect input. Can not parse id');
			halt(1)
		end;

		if (c <= 0) then begin
			writeln('Incorrect input. Negative id: ', c);
			halt(2)
		end;

		n := c div 100;
		if ((n < 1) or (n > MaxSchool)) then begin
			writeln('Incorrect input. Invalid school number: ', n, ' [', c, ']');
			halt(3)
		end;

		counters[n] := counters[n] + 1
	end;

	n := 1; {winner}
	for i := 2 to MaxSchool do
		if (counters[i] > counters[n]) then
			n := i;

	for i := 1 to MaxSchool do
		if (counters[i] = counters[n]) then
			writeln(i)
end.
