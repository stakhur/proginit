program ColorDemo;
uses crt;

const
	ColorCount = 16;
	BGColCount = 8;

var
	AllColors: array[1..ColorCount] of word =
	(
		Black, Blue, Green, Cyan,
		Red, Magenta, Brown, LightGray,
		DarkGray, LightBlue, LightGreen, LightCyan,
		LightRed, LightMagenta, Yellow, White
	);

	CurTCol, CurBCol: word;

begin
	for CurTCol := 1 to ColorCount do begin
		for CurBCol := 1 to BGColCount do begin
			TextColor(AllColors[CurTCol]);
			TextBackground(AllColors[CurBCol]);
			write('*');
			TextColor(AllColors[CurTCol] or Blink);
			write('*')
		end;
		writeln(#27'[0m')
	end
end.
