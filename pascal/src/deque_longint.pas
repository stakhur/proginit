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
begin
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

procedure LDPopBack(var deque: LongDeque; var n: longint);
begin
end;

function LDIsEmpty(var deque: LongDeque): boolean;
begin
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

function TestLDPushFrontOne(): byte;
var
	d: LongDeque;
	data: longint = 15;
begin
	LDInit(d);
	LDPushFront(d, data);
	
	if (d.first = nil) or (d.last = nil) then begin
		TestLDPushFrontOne := 1;
		exit(1)
	end;
	
	if ((d.first = d.last) and (d.first^.data = 15)) then
		TestLDPushFrontOne := 0;
end;

function TestLDPushFrontTwo(): byte;
const
	First: longint = 256;
	Second: longint = 512;
var
	d: LongDeque;
begin
	LDInit(d);
	LDPushFront(d, First);
	LDPushFront(d, Second);

	if ((d.first^.data <> Second) or (d.first^.next = nil) or (d.first^.next^.data <> First)) then begin
		TestLDPushFrontTwo := 1;
		exit(1)
	end;
	
	TestLDPushFrontTwo := 0
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


function TestRun(): boolean;
const
	TestCount = 4;
var
	passed: integer = 0;
begin
	SetAndOutputResults(TestLDInit(), 'TestLDInit', passed);
	SetAndOutputResults(TestLDPushFrontOne(), 'TestLDPushFrontOne', passed);
	SetAndOutputResults(TestLDPushFrontTwo(), 'TestLDPushFrontTwo', passed);
	SetAndOutputResults(TestLDPopFront(), 'TestLDPopFront', passed);

	if (passed = TestCount) then
		writeln('All tests have been passed (', passed, '/', TestCount, ')')
	else
		writeln('Some tests have been failed. Passed (', passed, '/', TestCount, ')')
end;


begin
	TestRun()
end.
