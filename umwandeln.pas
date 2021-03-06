program Umwandeln;

uses
  crt,
  SysUtils,
  Math;

type
  Box = object
    f_Base: integer;
  end;
var
  l: char;
  o: array[0..65535] of char;
  bufferL: integer = 0;
  state: integer = 0;
  Zahlsystem: integer = 10;
  dzs: string = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
  boxes: array[0..50] of Box;
  selectedBox: integer = 0;
  boxQuantity: integer = 0;

procedure printBuffer;
var
  i: integer = 0;
begin
  if bufferL > 0 then
    for i := 0 to bufferL - 1 do
      write(o[i]);
end;

procedure printBufferContents;
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
  printBuffer;

end;

function readBufferToNumber(): int64;
var
  start: int64;
  i: integer;
  b: int64;
begin
  start := 1;
  b := 0;
  for i := (bufferL - 1) downto 0 do
  begin
    b := b + (pos(o[i], dzs) - 1) * start;
    start := start * Zahlsystem;
  end;
  readBufferToNumber := b;
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

procedure writeErrorMessage(l: string);
begin
  GoToXY(1, 6);
  TextColor(red);
  ClrEol;
  writeln(l);
  TextColor(White);
  LowVideo;
end;

procedure clearMesageLine;
begin
  GoToXY(1, 6);
  TextBackground(Black);
  ClrEol;
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
  LowVideo;
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
  number := readBufferToNumber;
  if (number < 0) then
  begin
    TextColor(red);
    write('Zahlen großer als 9223372036854775808 sind leider nicht unterstützt');
    TextColor(White);
    LowVideo;
  end
  else
    write('Von Base 10 zu base ', numberConvert(thasystem, Zahlsystem), ' ist:', numberConvert(
      readBufferToNumber, thasystem));
  Window(1, 1, Min(ScreenWidth, 255), ScreenHeight);
end;

function createNewBox(): Box;
begin
  selectedBox := boxQuantity;
  boxes[selectedBox].f_Base := 2;
  Inc(boxQuantity);
  createNewBox := boxes[selectedBox];
end;

procedure printBoxes(beginy: integer);
var
  i: integer;
  c: integer;
begin
  for i := 0 to boxQuantity - 1 do
  begin
    c := Green;
    if (i = selectedBox) then
      c := Brown;
    printNumberBlock(2, 58, 1 + 58 * (i mod ((Min(ScreenWidth, 255)) div 58)), beginy + 4 *
      (i div ((Min(ScreenWidth, 255)) div 58)), 'Base ' + IntToStr(boxes[i].f_Base) + ' umwandlung Block', boxes[i].f_Base, c);
  end;
end;

procedure addToBuffer(s: char);
begin
  o[bufferL] := s;
  Inc(bufferL);

end;

begin
  ClrScr;
  writeln('Heute wandeln wir zwischen Zahlsystemen um!');
  writeln('Welchem Zahlsystem willst du eintippen? (Typpe in Dezimal)');
  while l <> #3 do
  begin

    l := ReadKey;

    clearMesageLine;
    GoToXY(1, 4);
     {        ClrEol;
     writeln('Du hast dieses Charakter getyppt:',ord(l));
     ClrEol;
     writeln('bufferL ist:',bufferL);
     ClrEol;
     write('buffer ist:');printBufferContents;writeln;
     ClrEol;
     writeln('Zahlsystem ist:',Zahlsystem);
     ClrEol;
     writeln('Parsed Number ist i:',readBufferToNumber);
     }
    if ((l = #8) and (bufferL <> 0)) then
    begin
      bufferL := BufferL - 1;
      printThing;
    end
    else
    if ((l = #13)) then
    begin
      if ((state = 0) and (readBufferToNumber() > 1)) then
      begin
        state := 1;
        GoToXY(1, 3);
        writeln('Gut, jetzt, typpe die Zahl ein.');
        writeln('Benutz die <- und -> Pfeile tasten um Zahlsystem zu verändern, + um neue Boxen zu machen, und ^ und v tasten um Andere Boxen Auszuwählen');
        createNewBox();
        Zahlsystem := readBufferToNumber();
        bufferL := 0;
      end
      else if (state = 1) then;
    end
    else if (istCharErlaubt(l)) then
      addToBuffer(l)
    else if (state = 1) then
    begin

      if (l = '+') then
        createNewBox()
      else if (l = #80) then
        selectedBox := (selectedBox + 1) mod boxQuantity
      else if (l = #72) then
        if (selectedBox = 0) then
          selectedBox := boxQuantity - 1
        else
          Dec(selectedBox)
      else if (l = #77) then
        Inc(boxes[selectedBox].f_Base)
      else if ((l = #75) and (boxes[selectedBox].f_Base <> 2)) then
        Dec(boxes[selectedBox].f_Base)
      else if (l <> #0) then
      begin
        write(#7);
        writeErrorMessage('Dieses char ist nicht erlaubt..');
      end;

    end
    else
    begin
      write(#7);
      writeErrorMessage('Dieses char ist nicht erlaubt..');
    end;
    printThing;
    if (state = 1) then
      printboxes(13);
  end;
  GoToXY(1, ScreenHeight);
  writeln('Ach so, schade, dass du nicht mehr spielen willst. Bis dann!');

end.