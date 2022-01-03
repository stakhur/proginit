## Utils
# Compile program:
	fpc <source.pas>

## Lang
# Error processing while reading
	# 1. Activate error processing:
	{$I-}
	# 2. Check for the errors after reading:
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
		a[1,2] := 4; # the same

# Type conversions
	var
		i, j: integer;
		r: real;
	begin
		r := 15.75;
		i := trunc(r); # = 15. remove afterpoint part
		j := round(r); # = 16. round to the nearest

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
	# the same output:
	#	first
	#		second
	#			third

# String type
	var
		s1: stirng[15]; # string size is 15 + 1
		s2: string;	# string size is 255 + 1 (max size)
	begin
		s1 := 'Hello, ';
		s2 := s1 + 'world';
		writeln(s2);

# String functions
	length(s); # return length of the string s
	SetLength(s, l); # set length of the string s to l. Cannot be more then while initialization (stirng[15])
	LowerCase(s); 	# make lower all alphabetic symbols
	UpCase(s);	# make upper all alphabetic symbols
	copy(s, start, l);	# return substring of string s from start pos with l length
	delete(s, start, l);	# change string s by deleting l symbols from position start from string s
	insert(WHAT, WHERE, POS); # insert WHAT string to WHERE string to POS position
	pos(WHAT, WHERE);	# search WHAT substring in WHERE string and return position (0 if not found)
	val(s, v, err_pos);	# convert string s to value v (longint, integer, byte). If no error, err_pos=0; else - position
	str(formatted_val, s);	# convert formatted_val to string s. Ex: str(12.5:9:3, s); s = '   12.500'
	s = BinStr(bin_val, size_of_result_string);
	s = OctStr(bin_val, size_of_result_string);
	s = HexStr(bin_val, size_of_result_string);

# Command Line Arguments
	./demo abra shwabra kadabra
	ParamCount; # return count of arguments (in the above example - 3
	ParamStr(n); # return n-string argument. ParamStr(0) = demo; ParamStr(2) = shwabra;

# case .. of
	case <x> of
		'a'..'z', 'A'..'Z':
			writeln('A letter');
		'0'..'9':
			writeln('A digit');
		#27:
			writeln('The escape code');
		#9, #10, #13:
			writeln('a formatting code');
		else:
			writeln('something strange')
	
# Full-screen program
	uses crt;

	clrscr;		# clear screen
		
	GotoXY(x, y)	# go to new position
	ScreenWidth, ScreenHeight;	# global variables

	WhereX(), WhereY(); 	# find current position of the cursor

	KeyPressed();	# return true if the key has been pressed
	ReadKey();	# return the code of the pressed key

# Color control
	TextBackground(<BAC>); # Set background text color by BAC constants:
				# Black
				# Blue
				# Green
				# Cyan
				# Red
				# Magenta
				# Brown
				# LightGray
				
	TextColor(<COL> [or Blink]); # Set [blinking] text color by COL constant:
				# All from BAC constant +
				# DarkGray
				# LightBlue
				# LightGreen
				# LightCyan
				# LightRed
				# LightMagenta
				# Yellow
				# White

# Reset color changes
	reset command in the terminal
	or
	write(#27'[0m');

# Pseudo-random numbers
	randomize;	# function that set randseed (called 1 time)
	random;		# return random real number 0..1 (and change randseed)
	random(<MAX_LONGINT>);	# return random longint number 0..MAX_LONGINT-1 (and change randseed) 

## Files
# General information
	# Types of file: (text, file, file of <type>)
	assign(file_var, 'file_name');	# link file_name with file_var 
	reset # open file for reading. File must be exist 
	rewrite # open/create file for writing. File data will be clear 
	append # open file for writing to the end. Only in the text mode 
	# Apply {$I-} before using above functions. Process errors with IOResult 

	write(f1, x); # write to the text file linked to f1 x data
	read(f1, x);  # read from, the text file linked to f1 to the x
	
	eof(f1);
	SeekEof(f1);

	BlockRead(f1, xx);	# read from the file, opened in the block mode
	BlockWrite(f1, xx);

	close(f1);	# close file f1

# Text files
	var f: text;
	
	reset(f);	# open file in read-only mode
	rewrite(f);	# open file in write-only mode. Remove file context
	append(f);	# open file in write-only mode. Add data to the end. File must be exist

	readln(f, x);
	writeln(f, data);
	eoln(f);

# Typed files
	var f: file of <type>;

	seek(f, <rec_number>);	# set pointer after the <rec_number> record
	reset(f);		# open file in r-w mode. if file does not exits - error
	rewrite(f);		# open file in r-w mode. Remove file context (if file does not exist - create it)
	filemode = n;		# set file mode (if we do not have enough rights).
				# 2 (default) - open typed file for r-w
				# 1 - open typed file for writing only
				# 0 - open typed file for reading only

# Block input-output
	var f: file;

	reset(f, <block_size>);	 	# open file in r-w mode. if file does not exits - error
	rewrite(f, <block_size>);	# open file in r-w mode. Remove file context (if file does not exist - create it)

	BlockRead(f, var, <num_of_blocks>, readed_blocks);	# Read <num_of_blocks> blocks from file f to variable var.
								# Actually readed num of blocks goes to readed_blocks
								# If readed_blocks == 0 -> eof
	BlockWrite(f, var, <num_of_blocks>, writed_blocks);

# Files operations
	erase(f);	# remove file f from the disk. assign(f, <filename>); must be called before + file must be closed
	rename(f, <new_filename>);	# rename file f with new file name new_filename

## Addresses, pointers, dynamic memory
# Pointers
	r: real;
	p: ^real;	# Pointer to the real
	ap: pointer;	# non-typed pointer

	p := @r;	# Take an address of the 'r' variable and save it into 'p' variable
	p^ := 23.4;	# dereference (разыменовывание == обращение по аресу)
	ap := nil;	# null-address - pointer not used at the moment

	{$T+}		# use typed-conversion
