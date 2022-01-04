program ListInOut;
type
	itemptr = ^item;
	item = record
		data: integer;
		next: itemptr;
	end;

procedure AddFirstItem(var first: itemptr; value: integer);
var
	tmp: itemptr;
begin
	new(tmp);
	tmp^.data := value;
	tmp^.next := first;

	first := tmp
end;

procedure PrintAllItems(var first: itemptr);
var
	tmp: itemptr;
begin
	tmp := first;
	while (tmp <> nil) do begin
		write(tmp^.data, ' ');
		tmp := tmp^.next;
	end;
	writeln
end;

procedure DeleteAllItems(var first: itemptr);
var
	next: itemptr;
begin
	while (first <> nil) do begin
		next := first^.next;
		dispose(first);
		first := next;
	end
end;


var
	first: itemptr = nil;
	value: integer;
begin
	while not SeekEof do begin
		read(value);
		AddFirstItem(first, value);
	end;

	PrintAllItems(first);
	DeleteAllItems(first)
end.
