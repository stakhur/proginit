program RandStars;
uses crt;

const
	Symbol = '0';
	DelayDuration = 0;
	WithBackground = false;
	ColorCount = 16;
	BGColCount = 8;

var
	Symbols: array[1..2] of char = ('0', '1');

	AllColors: array[1..ColorCount] of word =
	(
		Black, Blue, Green, Cyan,
		Red, Magenta, Brown, LightGray,
		DarkGray, LightBlue, LightGreen, LightCyan,
		LightRed, LightMagenta, Yellow, White
	);

	CurTCol, CurBCol: word;
	CurX, CurY: integer;

begin
	clrscr;
	GotoXY(1, 1);
	randomize;

	while (not KeyPressed) do begin
		CurX := random(ScreenWidth);
		CurY := random(ScreenHeight);
		GotoXY(CurX, CurY);

		CurTCol := AllColors[random(ColorCount) + 1];
		TextColor(CurTCol);

		if (WithBackground) then begin
			CurBCol := AllColors[random(BGColCount) + 1];
			TextBackground(CurBCol)
		end;

		write(Symbols[random(2) + 1]);
		GotoXY(1, 1);
		delay(DelayDuration)
	end;

	write(#27'[0m');
	clrscr
end.
