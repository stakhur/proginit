program DequeLong;
uses crt;

type
	LongItem2Ptr = ^LongItem2;
	LongItem2 = record
		data: longint;
		prev, next: LongItem2Ptr;
	end;

	LongDeque = record
		first, last: LongItem2Ptr;
	end;

procedure LDInit(var deque: LongDeque);
begin
	deque.first := nil;
	deque.last := nil
end;

procedure LDPushFront(var deque: LongDeque; n: longint);
var
	tmp: LongItem2Ptr = nil;
begin
	new(tmp);
	tmp^.data := n;
	tmp^.prev := nil;
	tmp^.next := deque.first;

	if (deque.first = nil) then
		deque.last := tmp
	else
		deque.first^.prev := tmp;

	deque.first := tmp
end;

procedure LDPushBack(var deque: LongDeque; n: longint);
var
	tmp: LongItem2Ptr = nil;
begin
	new(tmp);
	tmp^.data := n;
	tmp^.prev := deque.last;
	tmp^.next := nil;

	if (deque.last = nil) then
		deque.first := tmp
	else
		deque.last^.next := tmp;

	deque.last := tmp
end;

{ The deque is always not empty, when this function called }
procedure LDPopFront(var deque: LongDeque; var n: longint);
var
	tmp: LongItem2Ptr = nil;
begin
	tmp := deque.first;
	n := tmp^.data;

	deque.first := tmp^.next;
	if (deque.first <> nil) then
		deque.first^.prev := nil
	else
		deque.last := nil;

	dispose(tmp)
end;

{ The deque is always not empty, when this function called }
procedure LDPopBack(var deque: LongDeque; var n: longint);
var
	tmp: LongItem2Ptr = nil;
begin
	tmp := deque.last;
	n := tmp^.data;

	deque.last := tmp^.prev;
	if (deque.last <> nil) then
		deque.last^.next := nil
	else
		deque.first := nil;

	dispose(tmp)
end;

function LDIsEmpty(var deque: LongDeque): boolean;
begin
	LDIsEmpty := (deque.first = nil)
end;


{ T E S T S }

procedure SetAndOutputResults(res: byte; testName: string; var passed: integer);
begin
	if (res = 0) then begin
		passed := passed + 1;
		TextColor(Green);
		write('+');
		TextColor(White);
		writeln(' Test ', testName, ' has been passed')
	end
	else begin
		TextColor(Red);
		write('-');
		TextColor(White);
		writeln(' Test ', testName, ' has been failed')
	end
end;

function TestLDInit(): byte;
var
	d: LongDeque;
begin
	LDInit(d);
	
        if ((d.first = nil) and (d.last = nil)) then
		TestLDInit := 0
	else
		TestLDInit := 1
end;

function TestLDPushFront(): byte;
const
	First: longint = 256;
	Second: longint = 512;
var
	d: LongDeque;
begin
	LDInit(d);
	LDPushFront(d, First);
	
	if (d.first = nil) or (d.last = nil) then begin
		TestLDPushFront := 1;
		exit(1)
	end;
	
	if ((d.first <> d.last) or (d.first^.data <> First)) then begin
		TestLDPushFront := 2;
		exit(2)
	end;

	LDPushFront(d, Second);
	if ((d.first^.data <> Second) or (d.first^.next = nil) or (d.first^.next^.data <> First)) then begin
		TestLDPushFront := 1;
		exit(1)
	end;

	TestLDPushFront := 0
end;

function TestLDPopFront(): byte;
const
	Inp1: longint = 123;
	Inp2: longint = 234;
var
	d: LongDeque;
	out: longint = 0;
begin
	LDInit(d);
	
	LDPushFront(d, Inp1);
	LDPushFront(d, Inp2);
	
	LDPopFront(d, out);
	if (out <> Inp2) then begin
		TestLDPopFront := 1;
		exit(1)
	end;

	if (d.first = nil) then begin
		TestLDPopFront := 2;
		exit(2)
	end;

	LDPopFront(d, out);
	if (out <> Inp1) then begin
		TestLDPopFront := 3;
		exit(3)
	end;

	if (d.first <> nil) then begin
		TestLDPopFront := 4;
		exit(4)
	end;


	TestLDPopFront := 0
end;

function TestLDPushBack(): byte;
const
	First: longint = 1234;
	Second: longint = 56789;
var
	d: LongDeque;
begin
	LDInit(d);

	LDPushBack(d, First);
	if ((d.last = nil) or (d.last^.data <> First) or (d.first <> d.last)) then begin
		TestLDPushBack := 1;
		exit(1)
	end;

	LDPushBack(d, Second);
	if ((d.first = d.last) or (d.last^.data <> Second)) then begin
		TestLDPushBack := 2;
		exit(2)
	end;

	if ((d.last^.prev = nil) or (d.last^.prev^.data <> First)) then begin
		TestLDPushBack := 3;
		exit(3)
	end;

	TestLDPushBack := 0
end;

function TestLDPopBack(): byte;
const
	Inp1: longint = 1234;
	Inp2: longint = 56788;
var
	d: LongDeque;
	out: longint = 0;
begin
	LDInit(d);
	
	LDPushBack(d, Inp1);
	LDPushBack(d, Inp2);

	LDPopBack(d, out);
	if (out <> Inp2) then begin
		TestLDPopBack := 1;
		exit(1)
	end;

	if (d.last = nil) then begin
		TestLDPopBack := 2;
		exit(2)
	end;

	LDPopBack(d, out);
	if (out <> Inp1) then begin
		TestLDPopBack := 3;
		exit(3)
	end;
	
	if (d.first <> nil) then begin
		TestLDPopBack := 4;
		exit(4)
	end;


	TestLDPopBack := 0
end;

function TestLDIsEmpty(): byte;
var
	d: LongDeque;
	data: longint;
begin
	LDInit(d);

	if (LDIsEmpty(d) <> true) then begin
		TestLDIsEmpty := 1;
		exit(1)
	end;

	data := 1;
	LDPushFront(d, data);
	if (LDIsEmpty(d) <> false) then begin
		TestLDIsEmpty := 2;
		exit(2)
	end;

	LDPopFront(d, data);
	if (LDIsEmpty(d) <> true) then begin
		TestLDIsEmpty := 3;
		exit(3)
	end;
	
	TestLDIsEmpty := 0
end;

function TestFull(): byte;
var
	d: LongDeque;
	data: longint = 0;
begin
	writeln('Start TestFull');
	TestFull := 0;

	LDInit(d);

	writeln('Push front:');
	for data := 1 to 20 do begin
		LDPushFront(d, data);
		write(data, ' ')
	end;
	writeln;

	writeln('Pop front:');
	while not (LDIsEmpty(d)) do begin
		LDPopFront(d, data);
		write(data, ' ')
	end;
	writeln;

	writeln('Push front:');
	for data := 1 to 20 do begin
		LDPushFront(d, data);
		write(data, ' ')
	end;
	writeln;

	writeln('Pop back:');
	while not (LDIsEmpty(d)) do begin
		LDPopBack(d, data);
		write(data, ' ')
	end;
	writeln;

	writeln('Push back:');
	for data := 1 to 20 do begin
		LDPushBack(d, data);
		write(data, ' ')
	end;
	writeln;

	writeln('Pop front:');
	while not (LDIsEmpty(d)) do begin
		LDPopFront(d, data);
		write(data, ' ')
	end;
	writeln;

	writeln('Push back:');
	for data := 1 to 20 do begin
		LDPushBack(d, data);
		write(data, ' ')
	end;
	writeln;

	writeln('Pop back:');
	while not (LDIsEmpty(d)) do begin
		LDPopBack(d, data);
		write(data, ' ')
	end;
	writeln
end;


function TestRun(): boolean;
const
	TestCount = 7;
var
	passed: integer = 0;
begin
	SetAndOutputResults(TestLDInit(), 'TestLDInit', passed);
	SetAndOutputResults(TestLDPushFront(), 'TestLDPushFront', passed);
	SetAndOutputResults(TestLDPopFront(), 'TestLDPopFront', passed);
	SetAndOutputResults(TestLDPushBack(), 'TestLDPushBack', passed);
	SetAndOutputResults(TestLDPopBack(), 'TestLDPopBack', passed);
	SetAndOutputResults(TestLDIsEmpty(), 'TestLDIsEmpty', passed);
	SetAndOutputResults(TestFull(), 'TestFull', passed);

	if (passed = TestCount) then
		writeln('All tests have been passed (', passed, '/', TestCount, ')')
	else
		writeln('Some tests have been failed. Passed (', passed, '/', TestCount, ')');

	TestRun := (passed = TestCount)
end;

begin
	TestRun()
end.
