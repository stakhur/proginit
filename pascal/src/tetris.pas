program Tetris;
uses crt;
const
	Width = 20;
	Height = 20;
	FigureHeight = 4; { 4x4 }
	NumberOfFigures = 4;
	NumberOfRotations = 4;

type
	Figure = array [1..FigureHeight] of byte;
	FigurePositions = array [1..NumberOfRotations] of Figure;
	SetOfFigures = array [1..NumberOfFigures] of FigurePositions;
	RotateDirection = (RLeft, RRight);

	FigureObject = record
		id: byte;
		position: byte
	end;

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
		  (0, 1, 1, 3)),		{  + }		{ ++ }
		(			{ *   }		{ *** }
		  (0, 0, 1, 7),		{ *** }		{   * }
		  (0, 2, 2, 3),			{  * }		{ ** }
		  (0, 0, 7, 4),			{  * }		{ *  }
		  (0, 3, 1, 1)),		{ ** }		{ *  }
		(
		  (0, 0, 3, 3),		{ ** }
		  (0, 0, 3, 3),		{ ** }
		  (0, 0, 3, 3),
		  (0, 0, 3, 3))
		  );

procedure Rotate(var figObj: FigureObject; rotateDir: RotateDirection);
begin
	if (rotateDir = RLeft) then begin
		figObj.position := figObj.position + 1;
		if (figObj.position > NumberOfRotations) then
			figObj.position := 1
	end
	else if (rotateDir = RRight) then begin
		figObj.position := figObj.position - 1;
		if (figObj.position < 1) then
			figObj.position := NumberOfRotations
	end
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


procedure PrintFigure(figObj: FigureObject; PosX, PosY: integer);
var
	fig: Figure;
	row, col, curLine: byte;
	CurX, CurY: integer;

begin
	{ clear prev figure }
	CurX := PosX;
	CurY := PosY;
	for row := 1 to FigureHeight do begin
		GotoXY(PosX, CurY + row - 1);
		for col := 1 to FigureHeight do begin
			write(' ')
		end
	end;

	curLine := 0;
	fig := Figures[figObj.id][figObj.position]; { #first_row, #second_row, #third_row, #fourth_row }
	for row := 1 to FigureHeight do begin
		curLine := fig[row];
		CurY := PosY + row - 1;
		for col := 1 to FigureHeight do begin
			CurX := PosX + col - 1;
			if ((curLine and (1 << (col - 1))) <> 0) then begin
				GotoXY(CurX, CurY);
				write('M');
			end
		end
	end
end;


procedure ShowNext(figObj: FigureObject);
const
	NextString = 'Next item';

var
	Xpos, Ypos: integer;

begin
	Xpos := (ScreenWidth + Width) div 2 + 4;
	Ypos := (ScreenHeight - Height) div 2;

	GotoXY(Xpos, Ypos);
	write(NextString);
	
	PrintFigure(figObj, Xpos, Ypos + 2);

	GotoXY(1, 1)
end;

var
	next: FigureObject;
begin
	randomize;

	clrscr;
	PrintGlass;
	while (not KeyPressed) do begin
		next.id := random(NumberOfFigures) + 1;
		next.position := random(NumberOfRotations) + 1;
		ShowNext(next);
		delay(500);
	end;

	clrscr
end.
