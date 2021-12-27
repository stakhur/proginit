program HelloFileRightWay;
const
	message = 'Hello, World!';
	filename = 'hello.txt';

var
	f: text;

begin
	{$I-}
	
	assign(f, filename);
	
	rewrite(f);
	if (IOResult <> 0) then begin
		writeln('Couldn''t open file ', filename);
		halt(1)
	end;

	writeln(f, message);
	if (IOResult <> 0) then begin
		writeln('Couldn''t write to the file ', filename);
		halt(1)
	end;

	close(f)
end.
