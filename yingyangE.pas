Program yingyang;
Uses Math;
const 
 scale_x=2;
 scale_y=1;
 black='#';
 white='.';
 clear=' ';

function inCircle(centre_x:Integer;centre_y:Integer;radius:Integer;x:Integer;y:Integer):Boolean ;
begin 
inCircle:=power(x-centre_x,2)+power(y-centre_y,2)<=power(radius,2);
end;


var 
radius,sy,sx,x,y:Integer;
begin
	writeln('Tippt eine Radius ein');
	readln(radius);
	if radius<3 then begin writeln('nur radius grosser als 3 bitte');halt end;
	sy:=round(radius*scale_y);
	while(sy>=-round(radius*scale_y)) do begin
		sx:=-round(radius*scale_x);
		while(sx<=round(radius*scale_x)) do begin
			x:=sx div scale_x;
			y:=sy div scale_y;
			if power(x-0,2)+power(y-0,2)<=power(radius,2) then begin 
				if (inCircle(0,radius div 2 ,radius div 2,x,y)) then if inCircle(0,radius div 2 ,radius div 6,x,y) then write(black) else write(white) else if inCircle(0,-radius div 2 ,radius div 2,x,y)
 then if  inCircle(0,-radius div 2 ,radius div 6,x,y)
then write(white) else write(black) else if x>0 then write(white) else write(black);
		        	end 
		        else write(clear);
			sx:=sx+1
		end;
		writeln;
		sy:=sy-1;
	end;
end.

