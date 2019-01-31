Program lol;
{uses strutils;}
uses sysutils;
var y:LongInt;
function decimalToBinary(a:LongInt):String;
var d:Integer;
str:String;
Begin
  str:='';
  while a>0 do begin
  d:=a mod 2;
  str:=concat(IntToStr(d),str);
  a:=a div 2;
  end;
  decimalToBinary:=str;
End;
BEGIN
readln(y);
writeln(decimalToBinary(y));
{writeln(IntToBin(y,32));}
END.
