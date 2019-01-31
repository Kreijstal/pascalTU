Program info;
var 
a:String;
n,o,i:Integer;
begin
	a:='INFO';
	writeln('Tippt eine Zahl ein');
	readln(n);
	o:=n;
	while(o>0)//0 ist null O ist O.
	do begin
		writeln('test');
		i:=0;
		while(i<o) do begin
			write(a); i:=i+1; end;
			writeln;
			o:=o-1;
		end;
		end.
