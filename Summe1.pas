Program summe1;
var i,s,ss:Integer; 
Begin
ss:=0;
while i<10 do begin
//	Writeln('Schreib eine Nummer');
	readln(s);
	ss:=ss+s;
//	writeln(ss);
	i:=i+1;
end;
writeln('Die summe dieser Zahlen ist: ',ss)
end.
