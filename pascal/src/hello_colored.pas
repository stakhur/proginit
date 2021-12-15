program HelloColored;
uses crt;

begin
	TextColor(Yellow or Blink);
	TextBackground(Blue);
	writeln('Hello, World!');

	delay(5000);

	write(#27'[0m') { we also can use 'reset' in the terminal }
end.
