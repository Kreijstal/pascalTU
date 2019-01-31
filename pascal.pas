Program magic;
var i:integer=5;
a:Integer=10;
begin

	writeln('das ist wert von i:',i);
	writeln('das ist wert von a:',a);
	a:=a xor i;
	i:=i xor a;
	a:=a xor i;
	writeln('das ist wert von i:',i);
	writeln('das ist wert von a:',a);
	a:=a+i;
	i:=a-i;
	a:=a-i;
	writeln('das ist wert von i:',i);
	writeln('das ist wert von a:',a);
	
end.
