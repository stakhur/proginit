program BlockFileCopy;
const
	BufSize = 4096;

var
	src, dst: file;
	buf: array [1..BufSize] of byte;
	ReadRes, WriteRes: longint;

begin
	{$I-}
	if (ParamCount < 2) then begin
		writeln(ErrOutput, 'Expected: source and destination file names');
		halt(1)
	end;

	assign(src, ParamStr(1));
	assign(dst, ParamStr(2));

	filemode := 0;	{ Open src file for read-only }
	reset(src, 1);	{ block size of 1 byte }
	if (IOResult <> 0) then begin
		writeln(ErrOutput, 'Could not open ', ParamStr(1));
		halt(1)
	end;

	filemode := 1;	{ Open dst file for write-only }
	rewrite(dst, 1);
	if (IOResult <> 0 ) then begin
		writeln(ErrOutput, 'Could not open ', ParamStr(2));
		halt(1)
	end;

	while (true) do begin
		BlockRead(src, buf, BufSize, ReadRes);
		if (ReadRes = 0) then { end of file }
			break;

		BlockWrite(dst, buf, ReadRes, WriteRes);
		if (WriteRes <> ReadRes) then begin
			writeln(ErrOutput, 'Error writing the file');
			break
		end
	end;

	close(src);
	close(dst)
end.
