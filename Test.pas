Program test;
var 
zahl1,zahl2,addU,dffU,prdktU,quoU:LongInt;

Begin
writeln('Schreiben sie zwei Zahlen, bitte');
read(zahl1,zahl2);
writeln('Schreib der Addition von ',zahl1,' und ',zahl2);
read(addU);
writeln('Schreib der Differenz von ',zahl1,' und ',zahl2);
read(dffU);
writeln('Schreib der Produkt von ',zahl1,' und ',zahl2);
read(prdktU);
writeln('Schreib der Quotient von ',zahl1,' und ',zahl2);
read(quoU);
write(zahl1:6,' + ',zahl2:6,' = ',zahl1+zahl2:10,' ; Ihre Antwort: ' ,addU, ' es ist ');if addU=zahl1+zahl2 then write('Richtig') else write('Falsch');
writeln;
write(zahl1:6,' - ',zahl2:6,' = ',zahl1-zahl2:10,' ; Ihre Antwort: ' ,dffU, ' es ist ');if dffU=zahl1-zahl2 then write('Richtig') else write('Falsch');
writeln;
write(zahl1:6,' * ',zahl2:6,' = ',zahl1*zahl2:10,' ; Ihre Antwort: ' ,prdktU, ' es ist ');if prdktU=zahl1*zahl2 then write('Richtig') else write('Falsch');
writeln;
if Zahl2=0 then 

writeln(zahl1:6,' DIV ',zahl2:4,' = unbestimmt ; Kein Division bei Null, bitte') else begin
write(zahl1:6,' DIV ',zahl2:4,' = ',zahl1 DIV zahl2:10,' ; Ihre Antwort: ' ,quoU, ' es ist ');if quoU=zahl1 DIV zahl2 then write('Richtig') else write('Falsch');
writeln;end;
end.
