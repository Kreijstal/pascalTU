Program Umwandeln;
uses crt, sysutils;
Type
	Box = Object
	f_Base : integer;
end;
var l:Char;
o:Array[0..65535] of char;
bufferL:Integer=0;
state:Integer=0;
Zahlsystem:Integer=10;
dzs:String='0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
boxes:Array[0..50] of Box;
selectedBox:Integer=0;
boxQuantity:Integer=0;

procedure printBuffer;
var i:Integer=0;
begin
	if bufferL>0 then	for i:=0 to bufferL-1 do
		write(o[i]);
end;

procedure printBufferContents;
var i:Integer=0;
begin
	for i:=0 to 10 do
		write(o[i],',');
end;

procedure printThing;
begin 
GoToXY(1,ScreenHeight);
ClrEol;
printBuffer;

end;
function readBufferToNumber():Int64;
var 
start:Int64;
i:Integer;
b:Int64;
begin 
start:=1;
b:=0;
for i:=(bufferL-1) downto 0 do
begin
	b:=b+(pos(o[i],dzs)-1)*start;start:=start*Zahlsystem;
end;
readBufferToNumber:=b;
end;

function numberConvert(eingabe:Int64;base:Integer):String;
var a:Int64;
dieAntwort:String;
begin
	dieAntwort:='';
	a:=eingabe;
	while a<>0	do begin 
	dieAntwort:=dzs[(a mod base)+1]+dieAntwort;
	a:=a div base;
end;
if length(dieAntwort)=0 then dieAntwort:='0';
numberConvert:=dieAntwort;
end;

function istCharErlaubt(c:char):boolean;
var posi:Integer;
begin
	posi:= (pos(c,dzs));
	istCharErlaubt:=not ((posi=0)or(posi>Zahlsystem));
end;

procedure writeErrorMessage(l:String);
begin 
GoToXY(50,1);
TextColor(red);
ClrEol;
writeln(l);
TextColor(White);
LowVideo;
end;
procedure clearMesageLine;
begin 
GoToXY(50,1);
TextBackground(Black);
ClrEol;
end;
procedure printNumberBlock(lines:Integer;width:Integer;xstart:Integer;yline:Integer;Beschreibung:String;thasystem:Integer;c:Integer);
var i:Integer;Number:Int64;
begin
	GoToXY(xstart,yline);
	TextBackground(c);
	write(Beschreibung:Width);
	for i:=1 to lines do begin
		GoToXY(xstart,yline+i);
		write(' ');
		TextBackground(Black);
		write('':width-2);
		TextBackground(c);
		write(' ');
	end;
	GoTOXY(xstart,yline+i+1);
	write('':Width);
	TextBackground(Black);
	Window(xstart+1,yline+1,xstart+Width-2,yline+i);
	ClrScr;
	number:=readBufferToNumber;
	if(number<0)then begin
		TextColor(red);
		write('Zahlen großer als 9223372036854775808 sind leider nicht unterstützt');
		TextColor(White);
		LowVideo;
	end else
		write('Von Base 10 zu base ',numberConvert(thasystem,Zahlsystem),' ist:',numberConvert(readBufferToNumber,thasystem));
	Window(1,1,ScreenWidth,ScreenHeight);
end;

function createNewBox():Box;
begin
	selectedBox:=boxQuantity;
	boxes[selectedBox].f_Base:=2;
	inc(boxQuantity);
	createNewBox:=boxes[selectedBox];
end;

procedure printBoxes(beginy:Integer);
var i:Integer;
c:Integer;
begin
	for i:=0 to boxQuantity-1 do begin
		c:=Green;
		if(i=selectedBox) then c:=Brown;
		printNumberBlock(2,58,1+58*(i mod((ScreenWidth) div 58)),beginy+4*(i div ((ScreenWidth-3) div 58)),'Base '+IntToStr(boxes[i].f_Base)+' umwandlung Block',boxes[i].f_Base,c);
	end;
end;
procedure addToBuffer(s:char);
begin
	o[bufferL]:=s;
	inc(bufferL);

end;

begin
//	CreateNewBox();
//	PrintBoxes(13);
//	CreateNewBox();
//	PrintBoxes(13);
		writeln('ACHTUNG!!!! ScreenWidth:',ScreenWidth,'   und ScreenHHHeight:',ScreenHeight);
		GoToXY(1,ScreenHeight);
		writeln('ACHTUNG!!!! ScreenWidth:',ScreenWidth,'   und ScreenHeight:',ScreenHeight);
//		Window(1,1,ScreenWidth-1,ScreenHeight-1);
		GoToXY(50,40);
		writeln('Ach so, schade, dass du nicht mehr spielen willst. Bis dann!');
		WriteLn('Creating a window from 30,10 to 50,20');
		Window(30,10,50,20);
		WriteLn('We are now writing in this small window we just created, we '+
			'can''t get outside it when writing long lines like this one');
			Write('Press any key to clear the window');
			ReadKey;
			ClrScr;
			Write('The window is cleared, press any key to restore to fullscreen');
			ReadKey;
			{Full Screen is 80x25}
			Window(1,1,255,25);
			Clrscr;
			Writeln('Back in Full Screen, or am I, the truth is, I do no tknow, deswegen schreibe ich gerade eine Textproduktion, weil meine Meinung nach mein deutsch ein bisschen mehr Verbesserung braucht.');


end.
