Program mm;
var i,j,np,e:Longint;
a:Array[0..14] of Longint;
begin
e:=0;
for i:=0 to 14 do  begin
read(a[i]);
e:=e+a[i];
end;
if (a[0]>=0) and (a[14]>=0) then 
begin 
for i:=0 to 14 do  
 for j:=0 to 14 do begin
    if (i>j) and (a[i]<a[j]) then begin np:=a[i];a[j]:=a[i];a[i]:=np; end;
    if (i<j) and (a[i]>a[j]) then begin np:=a[i];a[j]:=a[i];a[i]:=np; end;
    end;
writeln('Mittelwert ist :',e/15:5:5);
writeln('Median ist :',a[7]:5);
writeln('Spannweite ist :',a[14]-a[0]:5);
writeln('a[14]:',a[14],'a[0]:',a[0]);
end;
end.

