Program Sterne;
Var s2,stern:Integer;
Begin
writeln('Tippt zahl von *');
read(stern);
while stern<>0 do
begin 
 s2:=stern;
  while s2<>0 do begin 
   write('*');
   s2:=s2-1;
  end;
 writeln;
 stern:=stern-1;
 end;
End.
