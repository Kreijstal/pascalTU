Program folge2;
var i,a,b:LongInt;
Begin
i:=0;a:=2;b:=1;
while i<25 do begin
	i:=i+1;
	writeln(a);
	a:=a+b;b:=b*2;
end;
End.
