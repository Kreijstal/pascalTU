Program Sortieren;


Procedure BubbleSort(var numbers : Array of Integer; size : Integer);
Var
	i, j, temp : Integer;

Begin
	For i := size-1 DownTo 1  do
		For j := 1 to i do
			If (numbers[j-1] > numbers[j]) Then
			Begin
				temp := numbers[j-1];
				numbers[j-1] := numbers[j];
				numbers[j] := temp;
			End;
End;

var
 n:Array of Integer;
 i,m:Integer;
Begin
	Writeln('Tippe wie viele Zahlen wollen sie eintippen.');
	read(i);
	setlength(n,i);
for m:=0 to i-1 do begin 
read(n[m]);
end;
BubbleSort(n,i);
writeln('Sortierte Zahlen:');
for m:=0 to i-1 do begin 
writeln(n[m]);
end;

End.
