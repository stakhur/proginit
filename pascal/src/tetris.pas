program Tetris;
uses crt;
const
	Width = 20;
	Height = 20;
	FigureHeight = 4; { 4x4 }
	NumberOfFigures = 2;
	NumberOfRotations = 4;

type
	Figure = array [1..FigureHeight] of byte;
	FigurePositions = array [1..NumberOfRotations] of Figure;
	SetOfFigures = array [1..NumberOfFigures] of FigurePositions;

const
	Figures: SetOfFigures = (
		( 		       	{ ++++ }
		  (0, 0, 0, 15),       		{ + }
		  (1, 1, 1, 1),	       		{ + }
		  (0, 0, 0, 15),       		{ + }
		  (1, 1, 1, 1)),       		{ + }
		( 		       	{   + }		{ +++ }
		  (0, 0, 4, 7),		{ +++ }		{ +   }
		  (0, 3, 2, 2),			{ ++ }		{ +  }
		  (0, 0, 7, 1),			{  + }		{ +  }
		  (0, 1, 1, 3))		{  + }		{ ++ }
		);
	
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
	PrintGlass;
	ShowNext(3);
	while (not KeyPressed) do;
	clrscr
end.
