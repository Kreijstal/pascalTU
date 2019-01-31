Program Median;


Procedure BubbleSort(var numbers : Array of Integer; size : Integer);
Var
	i, j, temp : Integer;

Begin
	For i := size-1 DownTo 1 do
		For j := 2 to i do
			If (numbers[j-1] > numbers[j]) Then
			Begin
				temp := numbers[j-1];
				numbers[j-1] := numbers[j];
				numbers[j] := temp;
			End;
End;

var
 n:Array[0..14] of Integer;
 b,m:Integer;
Begin
	b:=0;
	Writeln('Tippe 15 zahlen');
for m:=0 to 14 do begin 
read(n[m]);

b:=b+n[m];
end;
BubbleSort(n,15);
writeln('Mittelwert:',b/15:0:2);
writeln('Median:',n[7]);
writeln('die absolute Differenz:',abs(b/15-n[7]):0:2);

End.
