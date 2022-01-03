program Pointers;
var
	r: real;		{ real }
	p: ^real;		{ pointer to the real }

begin
	r := 20.25;		{ simple assign }
	p := @r;		{ take an address of the 'r' and put it into 'p' }
	p^ := p^ + 4.75;	{ change the data, stored in the r (p^ address) }
	writeln(p^:4:1)
end.
