Program fakultaet;
uses sysutils;
var
d,x,i:Longint;
ia:Boolean;
Begin
writeln('Gib eine Nummer x um x! zu berechnen');
read(i);
ia:=False;
if i<0 then writeln('Es ist nicht in definition Bereich') else begin
d:=1;
for x:=1 to i do 
begin
d:=d*x;
if d<0 then begin ia:=True; break end;
end;
if ia then writeln('Error: Integer Overflow') else
writeln('Und die Zahl ist: ',d) end;


End.
