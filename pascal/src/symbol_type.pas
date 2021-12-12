program SymbolType;
var
	c: char;
begin
	read(c);
	write('The symbol is ');
	case c of
		'a'..'z', 'A'..'Z':
			writeln('a latin letter');
		'0'..'9':
			writeln('a digit');
		'+', '-', '/', '*':
			writeln('an arithmetic operation');
		'<', '>', '=':
			writeln('a comparision sign');
		'.', ',', ';', ':', '!', '?':
			writeln('a punctuation symbol');
		'_', '~', '@', '#', '$', '%', '^':
			writeln('a special purpuse symbols');
		' ':
			writeln('the space character');
		else
			writeln('something strange')
	end
end.
