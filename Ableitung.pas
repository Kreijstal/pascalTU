program Ableitung;
var a,b,c:Integer;
d:Real;
Begin
writeln('Schreib die Koeffizienten von eine ax^2+bx+c=0 gleichung, (3 Zahlen)');
read(a,b,c);
write('Die Ableitung ist f(x)=');if a<>0 then write(2*a,'x') else if b=0 then write(0);if b>0 then write('+',b) else write(b);writeln;
end.
