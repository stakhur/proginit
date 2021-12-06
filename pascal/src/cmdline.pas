program Cmdline;
var
	n: byte;

begin
	for n := 0 to ParamCount do
		writeln('[', n, ']: ', ParamStr(n))
end.
