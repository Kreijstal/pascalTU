program Folge1;
var start,i:Integer;
Begin
start:=1;
for i:=2 to 27 do
begin
	writeln(start*2);
	start:=start+i;
end;
End.
