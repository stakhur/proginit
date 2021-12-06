program RecordExample;
type
	CheckPoint = record
		n: integer;
		latitude, longitude: real;
		hidden: boolean;
		penalty: integer;
	end;

var
	cp: CheckPoint;

begin
	cp.n := 2;
	cp.latitude := 61.0;
	cp.longitude := 30.5;
	cp.hidden := false;
	cp.penalty := 10
end.
