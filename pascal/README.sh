## Utils
# Compile program:
	fpc <source.pas>

## Lang
# Error processing while reading
	1. Activate error processing:
	{$I-}
	2. Check for the errors after reading:
	readln(n);
	if (IOResult <> 0) then {error happened}

# Arrays
	type
		<new_array_type_name> = array [<range>] of <type>; {array1 = array[1..5] of integer;}
	
	var
		a: array1;

	begin
		a[1] := 4;
		a[2] := 7;

# Records
	type
		<new_record_type_name> = record
			<field_name1> : <field_type>;
			<field_name2> : <field_type>;
			...
			<field_nameN> : <field_type>;
		end;
	
	var
		<record_var>: <new_record_type_name>;

	begin
		<record_var>.<field_name1> := <value>;
		<record_var>.<field_name2> := <value>;
		...

# Array of arrays
	type
		array1 = array [1..5, 1..7] of integer;
		array2 = array [1..5] of array [1..7] of integer;

	val
		a: array1;

	begin
		a[1][2] := 4;
		a[1,2] := 4; {the same}

# Type conversions
	var
		i, j: integer;
		r: real;
	begin
		r := 15.75;
		i := trunc(r); { = 15. remove afterpoint part }
		j := round(r); { = 16. round to the nearest }

# More type conversions
	var
		i: byte;
		j: integer;
	begin
		i := 7;
		j := integer(i);
		
# Special symbols in strings
	writeln('first'#10#9'second'#10#9#9'third');
	writeln('first'^J^I'second'^J^I^I'third');
	{the same output:
		first
			second
				third
	}
	

# String type
	var
		s1: stirng[15]; { string size is 15 + 1 }
		s2: string;	{ string size is 255 + 1 (max size) }
	begin
		s1 := 'Hello, ';
		s2 := s1 + 'world';
		writeln(s2);

# String functions
	length(s); { return length of the string s }
	SetLength(s, l); { set length of the string s to l. Cannot be more then while initialization (stirng[15]) }
	LowerCase(s); 	{ make lower all alphabetic symbols }
	UpCase(s);	{ make upper all alphabetic symbols }
	copy(s, start, l);	{ return substring of string s from start pos with l length }
	delete(s, start, l);	{ change string s by deleting l symbols from position start from string s }
	insert(WHAT, WHERE, POS); { insert WHAT string to WHERE string to POS position }
	pos(WHAT, WHERE);	{ search WHAT substring in WHERE string and return position (0 if not found) }
	val(s, v, err_pos);	{ convert string s to value v (longint, integer, byte). If no error, err_pos=0; else - position }
	str(formatted_val, s);	{ convert formatted_val to string s. Ex: str(12.5:9:3, s); s = '   12.500' }
	s = BinStr(bin_val, size_of_result_string);
	s = OctStr(bin_val, size_of_result_string);
	s = HexStr(bin_val, size_of_result_string);

# Command Line Arguments
	./demo abra shwabra kadabra
	ParamCount; { return count of arguments (in the above example - 3 }
	ParamStr(n); { return n-string argument. ParamStr(0) = demo; ParamStr(2) = shwabra; }

# 
