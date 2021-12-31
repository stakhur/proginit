program EraseFile;
var
	f: file;
begin
	{$I-}
	if (ParamCount < 1) then begin
		writeln(stderr, 'Specify the file to erase');
		halt(1)
	end;

	assign(f, ParamStr(1));
	erase(f);
	if (IOResult <> 0) then begin
		writeln(stderr, 'Error erasing the file ', ParamStr(1));
		halt(1)
	end
end.
