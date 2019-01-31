Program einkaufen;
var geld,ananas:Real;
Begin
writeln('Wie viel Geld haben sie dabei? ');
read(geld);
if(geld<0) then begin writeln('Nur Positiven Zahlen erlaubt'); halt; end;
writeln('Wie viel Ananas kosten?');
read(ananas);
if(ananas<=0) then begin writeln('Nur Positiven Zahlen erlaubt, ohne Null'); halt; end;
writeln('Sie können ',trunc(geld/ananas),' Ananas kaufen');
writeln('Ihr Restgeld ist ',trunc(geld-(ananas*trunc(geld/ananas))),',',trunc((geld-(ananas*trunc(geld/ananas)))*100) mod 100,'€')

End.
