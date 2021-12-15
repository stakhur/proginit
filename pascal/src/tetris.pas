program Tetris;
uses crt;
const
	Width = 20;
	Height = 20;
	NumberOfFigures = 7;
	NumberOfRotations = 4;

type
	Rotations = array [1..NumberOfRotations] of integer;
	SetOfFigures = array [1..NumberOfFigures] of Rotations;

var
	figures: SetOfFigures;

procedure InitFigures(var figures: SetOfFigures);
begin
end;

procedure PrintGlass;
const
	Color = LightGray;

var
	CurX, CurY: integer;

begin
	TextBackground(Color);

	CurX := (ScreenWidth - Width) div 2;
	for CurY := ((ScreenHeight - Height) div 2) to
		    ((ScreenHeight + Height) div 2) do begin
		GotoXY(CurX, CurY);
		write(' ')
	end;

	CurX := (ScreenWidth + Width) div 2;
	for CurY := ((ScreenHeight - Height) div 2) to
		    ((ScreenHeight + Height) div 2) do begin
		GotoXY(CurX, CurY);
		write(' ')
	end;

	CurY := (ScreenHeight + Height) div 2;
	for CurX := ((ScreenWidth - Width) div 2) to
		    ((ScreenWidth + Width) div 2) do begin
		GotoXY(CurX, CurY);
		write(' ')
	end;

	write(#27'[0m');
	GotoXY(1, 1)
end;

procedure ShowNext(obj: integer);
const
	NextString = 'Next item';

var
	Xpos, Ypos: integer;

begin
	Xpos := (ScreenWidth + Width) div 2 + 4;
	Ypos := (ScreenHeight - Height) div 2;

	GotoXY(Xpos, Ypos);
	write(NextString);
	GotoXY(1, 1)
end;

begin
	clrscr;
	InitFigures(figures);
	PrintGlass;
	ShowNext(3);
	while (not KeyPressed) do;
	clrscr
end.
