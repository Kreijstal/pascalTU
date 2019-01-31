program hm;
uses crt;
var
n,i:Int64;j:longint;
a:Boolean=true;
begin
  
  readln(n);
  for i:=2 to n-1 do
  begin
   if n mod i=0 then
    begin 
       j:=2;
        a:= true;
       while((j<(n div i)) and a) do
      
       begin
        writeln('n div i:',n div i,' j:',j,' i:',i);
            if ((n div i)mod j=0) then begin
                a:=false; 
                
        end;inc(j);end;
      //   writeln('never executed');
      //  writeln(' j:',j,' i:',i);
      if a then begin
       WriteLn('ist: ', n div i,n,i);
        break;
     end;
  end;end;
  
end.
