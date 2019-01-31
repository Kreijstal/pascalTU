Program uhr;
Uses sysutils,dateutils;
var
a:Integer;
Begin
writeln('Gibt ein Zeit in Sekunden');
read(a);
Writeln(TimeToStr(UnixToDateTime(a)));
//   Write (TimeToStr(Time),#13);
End.
