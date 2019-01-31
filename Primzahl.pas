Program prim;
var  loqueelusuarioescribe,a:Integer;
begin
writeln('Tippe eine Zahl ein, um zu prüfen, ob sie eine Prima Zahl ist');
readln(loqueelusuarioescribe);
if loqueelusuarioescribe<0 then begin writeln('Tippe eine Positive Zahl ein'); halt; end else if loqueelusuarioescribe<2 then writeln('Das ist Keine Primzahl');else if loqueelusuarioescribe<4 then begin  writeln('Genau'); halt end;
a:=1;
if  loqueelusuarioescribe mod 2=0 then begin writeln('Das ist keine Primzahl'); halt; end; 
repeat
       a:=a+2;       
       if loqueelusuarioescribe mod a = 0 then begin  writeln('Das ist keine Primzahl'); halt; end;
until  a>loqueelusuarioescribe div a;
writeln ('Genau');

end.
