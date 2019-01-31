Program nettolohn;
var 
studen:Integer;
ergebnis:Real;
begin
	writeln('Schreib den Studen den du Arbeitest:');
	readln(studen);
	if studen<0 then begin writeln('Positive zahlen, bitte'); halt; end;
	if studen>40  then ergebnis:=((studen-40)*(12+6)+40*12) else ergebnis:=(studen*12);
	if ergebnis>150 then  ergebnis:=ergebnis*0.8 else  ergebnis:=ergebnis*0.9;
	writeln('Ihre wochenlohn ist: ',ergebnis:0:2,'€')

end.
