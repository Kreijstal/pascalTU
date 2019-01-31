Program AngangBueschstabe;
Uses sysutils;
var Name,Vorname:String;
begin
Write('Vorname, bitte:');
readln(vorName);
Writeln();
Write('Name, bitte:');
readln(name);
Writeln;
writeln('Der Name beginnt mit:',UpperCase(Name[1]));
writeln('Der Vorname beginnt mit:',UpperCase(Vorname[1]));
end.
