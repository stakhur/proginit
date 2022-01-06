program QueueLongint;
type
	LongItemPtr = ^LongItem;
	LongItem = record
		data: longint;
		next: LongItemPtr;
	end;

	QueueOfLongints = record
		first, last: LongItemPtr;
	end;

procedure QOLInit(var queue: QueueOfLongints);
begin
	queue.first := nil;
	queue.last := nil
end;

procedure QOLPut(var queue: QueueOfLongints; n: longint);
var
	tmp: LongItemPtr;
begin
	new(tmp);
	tmp^.data := n;
	tmp^.next := nil;

	if (queue.last = nil) then begin
		queue.last := tmp;
		queue.first := queue.last
	end
	else begin
		queue.last^.next := tmp;
		queue.last := queue.last^.next
	end
end;

{ queue should not be empty }
procedure QOLGet(var queue: QueueOfLongints; var n: longint);
var
	tmp: LongItemPtr;
begin
	n := queue.first^.data;

	tmp := queue.first;
	queue.first := queue.first^.next;

	if (queue.first = nil) then
		queue.last := nil;

	dispose(tmp);
end;

function QOLIsEmpty(var queue: QueueOfLongints): boolean;
begin
	QOLIsEmpty := (queue.first = nil)
end;

var
	queue: QueueOfLongints;
	n: longint;
begin
	QOLInit(queue);

	while not SeekEof do begin
		read(n);
		QOLPut(queue, n)
	end;

	while not QOLIsEmpty(queue) do begin
		QOLGet(queue, n);
		write(n, ' ')
	end;

	writeln
end.
