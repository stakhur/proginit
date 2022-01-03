program DynMem;
var
	ps: ^string;
begin
	new(ps);
	ps^ := 'Hello from the heap!';
	writeln(ps^);
	dispose(ps);
	ps := nil
end.
