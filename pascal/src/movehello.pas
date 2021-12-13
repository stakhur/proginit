program MovingHello;
uses crt;
const
	Message = 'Hello, World!';

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

procedure ShowMessage(x, y: integer; msg: string);
begin
	GotoXY(x, y);
	write(msg);
	GotoXY(1, 1)
end;

procedure HideMessage(x, y: integer; msg: string);
var
	len, i: integer;
begin
	GotoXY(x, y);

	len := length(msg);
	for i := 1 to len do
		write(' ');

	GotoXY(1, 1);
end;

function NewCoordsValid(x, y, dx, dy: integer; msg: string): boolean;
begin
	NewCoordsValid := not (
		((x = 1) and (dx = -1)) or { left side }
		((x = (ScreenWidth - length(msg))) and (dx = 1)) or { right side }
		((y = 1) and (dy = -1)) or { top side }
		((y = ScreenHeight) and (dy = 1)) { bottoom side }
		)
end;

procedure MoveMessage(var x, y: integer; msg: string; dx, dy: integer);
begin
	if NewCoordsValid(x, y, dx, dy, msg) then begin
		HideMessage(x, y, msg);
		x := x + dx;
		y := y + dy;
		ShowMessage(x, y, msg)
	end
end;

var
	CurX, CurY: integer;
	c: integer;
begin
	CurX := (ScreenWidth - length(Message)) div 2;
	CurY := ScreenHeight div 2;

	clrscr;
	ShowMessage(CurX, CurY, Message);

	while (true) do begin
		GetKey(c);
		if (c >= 0) then
			break;

		case c of
			-72: { Up arrow }
				MoveMessage(CurX, CurY, Message, 0, -1);
			-80: { Down arrow }
				MoveMessage(CurX, CurY, Message, 0, 1);
			-75: { Left arrow }
				MoveMessage(CurX, CurY, Message, -1, 0);
			-77: { Right arrow }
				MoveMessage(CurX, CurY, Message, 1, 0);
		end;
	end;

	clrscr
end.
