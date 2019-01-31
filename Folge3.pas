Program Folge3;
var fibbo,counter,b,c,d:LongInt;
Begin
counter:=0;fibbo:=0;b:=1;d:=1;
repeat begin
	counter:=counter+1;
	writeln(d);
	d:=d+b;	
	c:=fibbo;
	fibbo:=b;
	b:=b+c;
end until counter>24;
end.
