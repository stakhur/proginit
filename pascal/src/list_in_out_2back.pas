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

procedure AddLastItem(var last: itemptr; value: integer);
var
	tmp: itemptr;
begin
	new(tmp);
	tmp^.data := value;
	tmp^.next := nil;
	
	if (last <> nil) then
		last^.next := tmp;
	last := tmp
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
	last: itemptr = nil;

	value: integer;
begin
	while not SeekEof do begin
		read(value);
		AddLastItem(last, value);

		if (first = nil) then
			first := last
	end;

	PrintAllItems(first);
	PrintAllItems(first);

	DeleteAllItems(first)
end.
