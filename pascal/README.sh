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
		
# 
