program HelloCrt;
uses crt;

const
	MSG = 'Hello, World!';
	DEL = 5000;		{ 5 seconds }

begin
	clrscr;
	
	GotoXY(((ScreenWidth - length(MSG)) div 2), (ScreenHeight div 2));
	writeln(MSG);
	GoToXY(1, 1);
	
	delay(DEL);
	clrscr
end.
