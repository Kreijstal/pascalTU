Program maxmin;
Uses math;
Type ZahlenArray = Array of Integer;


function ReduceMax(arr:ZahlenArray):Integer;
var c,i,l:Integer;
begin
l:=Length(arr);
c:=arr[0];
if (l>0) then 
for i:=1 to l-1 do c:=Max(c,arr[i]) ;
ReduceMax:=c;
end;

function ReduceMin(arr:ZahlenArray):Integer;
var c,i,l:Integer;
begin
l:=Length(arr);
c:=arr[0];
if (l>0) then 
for i:=1 to l-1 do c:=Min(c,arr[i]) ;
ReduceMin:=c;
end;

function Mmean(arr:ZahlenArray):Real;
var c,i,l:Integer;
begin
l:=Length(arr);
c:=arr[0];
if (l>0) then 
for i:=1 to l-1 do c:=c+arr[i] ;
Mmean:=c/l;
end;


var
a:ZahlenArray;
c,b,maxz,minz:Integer;

Begin
writeln('Schreib wie viele Zahlen wollen sie eintippen, danach schreiben Sie die Zahlen.');
read(b);
if (b<=0) then begin writeln('Nur Zahlen > 0'); halt; end;
c:=b;
SetLength(a,b);
while c>0 do begin 
c:=c-1;
read(a[c]);
 end;
 maxz:=reduceMax(a);minz:=ReduceMin(a);
 writeln('Großte Zahl ist :',maxz);
 writeln('Kleinste Zahl ist :',minz);
 writeln('Mittelwert den ganze Liste ist :',Mmean(a));
 writeln('Mittelwert von Max und Min:',(maxz+minz)/2)


end.
