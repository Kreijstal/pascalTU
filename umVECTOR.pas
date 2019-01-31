program Umwandeln;

uses
  crt,
  keyboard,
  SysUtils,
  Math,
  gvector;

type
  Box = object
    f_Base: integer;
  end;
  PBox= ^box;
  boxList = specialize TVector<PBox>;
var
  l: char=#0;
  o: array[0..65535] of char;
  pufferL: integer = 0;
  state: integer = 0;
  Zahlsystem: integer = 10;

  dzs: string = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
  boxes: boxList;
  gewaelteBox: integer = 0;
  skipdebug:Boolean=false;
procedure printPuffer;
var
  i: integer = 0;
begin
  if pufferL > 0 then
    for i := 0 to pufferL - 1 do
      write(o[i]);
end;

procedure schreibPufferInhalte;
var
  i: integer = 0;
begin
  for i := 0 to 10 do
    write(o[i], ',');
end;

procedure printThing;
begin
  GoToXY(1, ScreenHeight);
  ClrEol;
  printPuffer;

end;

function liesPufferZumZahl(): int64;
var
  start: int64;
  i: integer;
  b: int64;
begin
  start := 1;
  b := 0;
  for i := (pufferL - 1) downto 0 do
  begin
    b := b + (pos(o[i], dzs) - 1) * start;
    start := start * Zahlsystem;
  end;
  liesPufferZumZahl := b;
end;

function numberConvert(eingabe: int64; base: integer): string;
var
  a: int64;
  dieAntwort: string;
begin
  dieAntwort := '';
  a := eingabe;
  while a <> 0 do
  begin
    dieAntwort := dzs[(a mod base) + 1] + dieAntwort;
    a := a div base;
  end;
  if length(dieAntwort) = 0 then
    dieAntwort := '0';
  numberConvert := dieAntwort;
end;

function istCharErlaubt(c: char): boolean;
var
  posi: integer;
begin
  posi := (pos(c, dzs));
  istCharErlaubt := not ((posi = 0) or (posi > Zahlsystem));
end;



procedure printNumberBlock(Lines: integer; Width: integer; xstart: integer; yline: integer;
  Beschreibung: string; thasystem: integer; c: integer);
var
  i: integer;
  Number: int64;
begin
  GoToXY(xstart, yline);
  TextBackground(c);
  HighVideo;
  TextColor(Black);
  write(Beschreibung: Width);
  TextColor(White);
  //LowVideo;
  for i := 1 to Lines do
  begin
    GoToXY(xstart, yline + i);
    write(' ');
    TextBackground(Black);
    write('': Width - 2);
    TextBackground(c);
    write(' ');
  end;
  GoTOXY(xstart, yline + i + 1);
  write('': Width);
  TextBackground(Black);
  Window(xstart + 1, yline + 1, xstart + Width - 2, yline + i);
  ClrScr;
  number := liesPufferZumZahl;
  if (number < 0) then
  begin
    TextColor(red);
    write('Zahlen größer als 9223372036854775808 sind leider nicht unterstützt');
    TextColor(White);
    LowVideo;
  end
  else
    write('Von Basis 10 zum Basis ', numberConvert(thasystem, Zahlsystem), ' ist:', numberConvert(
      liesPufferZumZahl, thasystem));
  Window(1, 1, Min(ScreenWidth, 255), ScreenHeight);
end;

function machEineNeueBox(): Box;
var p:PBox;
begin
  p:=new(PBox);
  p^.f_Base := 2;
  gewaelteBox := boxes.Size;
  boxes.pushBack(p);
  machEineNeueBox := p^;
end;

procedure printBoxes(beginy: integer);
var
  i: integer;
  c: integer;
  enume:boxList.TVectorEnumerator;
begin
enume:=boxes.GetEnumerator;
i:=0;
	while(enume.moveNext)do
		begin
 c := Green;
    if (i = gewaelteBox) then
      c := Brown;
    printNumberBlock(2, 58, 1 + 58 * (i mod ((Min(ScreenWidth, 255)) div 58)), beginy + 4 *
      (i div ((Min(ScreenWidth, 255)) div 58)), 'Basis ' + IntToStr(enume.current^.f_Base) + ' umwandlung Block', enume.current^.f_Base, c);
  
			inc(i);
		end;
 end;

procedure fuegtInDerPufferHinzu(s: char);
begin
  o[pufferL] := s;
  Inc(pufferL);

end;
function ueberspringbarUnterbrechung(timeout:Integer):boolean;
var i:Integer;
k:TKeyEvent;
begin
for i:=0 to timeout do
	begin 
 k:=PollKeyEvent;
 if(k<>0)then begin 
if(skipdebug) then writeln('Skipped!',k);
ueberspringbarUnterbrechung:=true;break;
end;
sleep(1);
end;
ueberspringbarUnterbrechung:=false;
end;
procedure ueberspringbarText(s:String;m:Array of Integer);
var i:Integer;
skipped:Boolean;
begin
	skipped:=false;
	i:=0;
	while(i<length(s))do begin
write(s[i+1]);
if not skipped then skipped:=ueberspringbarUnterbrechung(m[i]);
		inc(i);
	end;
end;
procedure machTextLangsammer(s:String;LatzteHemmnis:Integer);
var p:Array of Integer;
Hemmnis:Integer;
i:Integer;
begin
setlength(p,length(s));
Hemmnis:=LatzteHemmnis;
for i:=high(p) downto low(p) do begin
	p[i]:=Hemmnis;
	Hemmnis:=Hemmnis div 2;
	if(hemmnis<20)then hemmnis:=hemmnis*4;
end;
ueberspringbarText(s,p);
end;

procedure skipTo;
var
k:TKeyEvent;
begin
 k:=PollKeyEvent;
if(k<>0)then begin

	GetKeyEvent;ueberspringbarUnterbrechung(400); end;
  writeln;
end;
procedure schreibFehlerNachtricht(l: string);
begin
  GoToXY(1, 6);
  TextColor(red);
  ClrEol;
      write(#7);
      if(PollKeyEvent<>0)then GetKeyEvent;
  machTextLangsammer(l,500);
  writeln;
  TextColor(White);
  LowVideo;
end;

procedure machNachrichtLinieSauber;
begin
  GoToXY(1, 6);
  TextBackground(Black);
  ClrEol;
end;


begin
  boxes:=boxList.create();
  boxes.reserve(50);
  ClrScr;
  machTextLangsammer('Hallo...',2000);
  skipTo;
  machTextLangsammer('Heute wandeln wir zwischen Zahlsystemen um!',500);
  skipTo;
  machTextLangsammer('Welchem Zahlsystem willst du eintippen? (Gib deine Antwort in Dezimalzahl basis ein)',500);
  writeln;
  while l <> #3 do
  begin

    l := ReadKey;

    machNachrichtLinieSauber;
     {        ClrEol;
     writeln('Du hast dieses Charakter getyppt:',ord(l));
     ClrEol;
     writeln('pufferL ist:',PufferL);
     ClrEol;
     write('puffer ist:');schreibPufferInhalte;writeln;
     ClrEol;
     writeln('Zahlsystem ist:',Zahlsystem);
     ClrEol;
     writeln('Parsed Number ist i:',liesPufferZumZahl);
     }
    if ((l = #8) and (pufferL <> 0)) then
    begin
    GoToXY(1, 4);
      pufferL := PufferL - 1;
      printThing;
    end
    else
    if ((l = #13)) then
    begin
      if ((state = 0) and (liesPufferZumZahl() > 1)) then
      begin
        state := 1;
        GoToXY(1, 3);
	clreol;
	GetKeyEvent;
        machTextLangsammer('Gut, jetzt, typpe die Zahl ein.',20);
	writeln;
        machTextLangsammer('Benutz die links (<-) und rechts (->) Pfeile tasten um Andere Boxen Auszuwählen, oben (^) und unten (v) tasten um anderen Zahlsystemen zu wechseln, und (+) um  neue Boxen zu machen',500);
	writeln;
        machEineNeueBox();
        Zahlsystem := liesPufferZumZahl();
        pufferL := 0;
      end
      else if (state = 1) then;
    end
    else if (istCharErlaubt(l)) then
	    if((state=0) and (pufferL>1)) then begin schreibFehlerNachtricht('Dieses Basis ist schon sehr groß!'); end else
      fuegtInDerPufferHinzu(l)
    else if (state = 1) then
    begin
      if ((l='-') and (boxes.size>1))then 
      begin
	      boxes.Erase(gewaelteBox);
  Window(1, 9, Min(ScreenWidth, 255), ScreenHeight);
clrscr;
  Window(1, 1, Min(ScreenWidth, 255), ScreenHeight);
	      if(gewaelteBox<>0)then dec(gewaelteBox);
	end
      else 
      if (l = '+') then
        machEineNeueBox()
      else if (l = #77) then
        gewaelteBox := (gewaelteBox + 1) mod boxes.Size
      else if (l = #75) then
        if (gewaelteBox = 0) then
          gewaelteBox := boxes.Size - 1

        else
          Dec(gewaelteBox)
      else if (l = #72) then
        Inc(boxes.getValue(gewaelteBox)^.f_Base)
      else if ((l = #80) and (boxes.getValue(gewaelteBox)^.f_Base <> 2)) then
        Dec(boxes.getValue(gewaelteBox)^.f_Base)
      else if (l <> #0) then
      begin
        schreibFehlerNachtricht('Dieses char ist nicht erlaubt..');
      end;

    end
    else
    begin
      schreibFehlerNachtricht('Dieses char ist nicht erlaubt..');
    end;
    normVideo;
    printThing;
    if (state = 1) then
      printboxes(9);
  end;
  NormVideo;
  GoToXY(1, ScreenHeight);
  writeln('Ach so, schade, dass du nicht mehr spielen willst. Bis dann!');

end.
