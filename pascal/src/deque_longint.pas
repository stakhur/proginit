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

	if (deque.first = nil) then begin
		deque.first := tmp;
		deque.last := tmp
	end
	else begin
		deque.first^.prev := tmp;
		deque.first := tmp
	end
end;

procedure LDPushBack(var deque: LongDeque; n: longint);
begin
end;

procedure LDPopFront(var deuqe: LongDeque; var n: longint);
begin
end;

procedure LDPopBack(var deque: LongDeque; var n: longint);
begin
end;

function LDIsEmpty(var deque: LongDeque): boolean;
begin
end;


{ T E S T S }

procedure SetAndOutputResults(res: boolean; testName: string; var passed: integer);
begin
	if (res = true) then begin
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

function TestLDInit(): boolean;
var
	d: LongDeque;
begin
	LDInit(d);
	TestLDInit := ((d.first = nil) and (d.last = nil))
end;

function TestLDPushFrontOne(): boolean;
var
	d: LongDeque;
	data: longint = 15;
begin
	LDInit(d);
	LDPushFront(d, data);
	
	if (d.first = nil) or (d.last = nil) then begin
		TestLDPushFrontOne := false;
		exit(false)
	end;
	
	if ((d.first = d.last) and (d.first^.data = 15)) then
		TestLDPushFrontOne := true;
end;

function TestLDPushFrontTwo(): boolean;
const
	First: longint = 256;
	Second: longint = 512;
var
	d: LongDeque;
begin
	LDInit(d);
	LDPushFront(d, First);
	LDPushFront(d, Second);

	if ((d.first^.data <> First) or (d.first^.next = nil) or (d.first^.next^.data <> Second)) then begin
		TestLDPushFrontTwo := false;
		exit(false)
	end;
	
	TestLDPushFrontTwo := true
end;


function TestRun(): boolean;
const
	TestCount = 3;
var
	passed: integer = 0;
begin
	SetAndOutputResults(TestLDInit(), 'TestLDInit', passed);
	SetAndOutputResults(TestLDPushFrontOne(), 'TestLDPushFrontOne', passed);
	SetAndOutputResults(TestLDPushFrontTwo(), 'TestLDPushFrontTwo', passed);

	if (passed = TestCount) then
		writeln('All tests have been passed (', passed, '/', TestCount, ')')
	else
		writeln('Some tests have been failed. Passed (', passed, '/', TestCount, ')')
end;


begin
	TestRun()
end.
