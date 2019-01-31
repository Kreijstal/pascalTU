program Dezimalzahl;
uses math;
VAR
d,i,j,c:int64;
a:String;
begin 
writeln('Geben sie eine dualzahl ein');
d:=1;
read(a); 
i:=length(a);
c:=0;
repeat
if (not ((a[i] = '1') or (a[i] = '0'))) then begin writeln('Das ist kein Dualzahl');halt end;

c:=c+(Ord(a[i])-48)*d;
d:=d*2;
i:=i-1;
until i=0;
writeln(c); 
end.



