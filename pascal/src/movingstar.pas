program MovingStar;
uses crt;
const
	DelayDuration = 100;
	Symbol = '*';

type
	star = record
		CurX: integer;
		CurY: integer;
		dx: integer;
		dy: integer
	end;
		

procedure GetKey(var code: integer);
var
	c: char;
begin
	c := ReadKey;
	if (c = #0) then
	begin
		c := ReadKey;
		code := -ord(c)
	end
	else
		code := ord(c)
end;

procedure WriteChar(x, y: integer; c: char);
begin
	GotoXY(x, y);
	write(c);
	GotoXY(1, 1)
end;

procedure ShowStar(var s: star);
begin
	WriteChar(s.CurX, s.CurY, Symbol)
end;

procedure HideStar(var s: star);
begin
	WriteChar(s.CurX, s.CurY, ' ')
end;

function NewCoordsValid(var s: star): boolean;
begin
	NewCoordsValid := not (
		((s.CurX = 1) and (s.dx = -1)) or { left side }
		((s.CurX = ScreenWidth) and (s.dx = 1)) or { right side }
		((s.CurY = 1) and (s.dy = -1)) or { top side }
		((s.CurY = ScreenHeight) and (s.dy = 1)) { bottoom side }
		)
end;

procedure SetDirection(var s: star; dx, dy: integer);
begin
	s.dx := dx;
	s.dy := dy
end;

procedure MoveStar(var s: star);
begin
	HideStar(s);
	s.CurX := s.CurX + s.dx;
	if (s.CurX > ScreenWidth) then
		s.CurX := 1
	else if (s.CurX < 1) then
		s.CurX := ScreenWidth;

	s.CurY := s.CurY + s.dy;
	if (s.CurY > ScreenHeight-1) then
		s.CurY := 1
	else if (s.CurY < 1) then
		s.CurY := ScreenHeight-1;

	ShowStar(s)
end;

var
	s: star;
	c: integer;
begin
	s.CurX := ScreenWidth div 2;
	s.CurY := ScreenHeight div 2;
	s.dx := 0;
	s.dy := 0;

	clrscr;
	ShowStar(s);

	while (true) do begin
		if (KeyPressed) then begin
			GetKey(c);
			case c of
				-72: { Up arrow }
					SetDirection(s, 0, -1);
				-80: { Down arrow }
					SetDirection(s, 0, 1);
				-75: { Left arrow }
					SetDirection(s, -1, 0);
				-77: { Right arrow }
					SetDirection(s, 1, 0);
				32: { space }
					SetDirection(s, 0, 0);
				27: { excape }
					break;
			end
		end;

		delay(DelayDuration);
		MoveStar(s);
	end;

	clrscr
end.
