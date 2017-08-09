unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, jpeg;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label1: TLabel;
    Timer1: TTimer;
    Edit1: TEdit;
    Image2: TImage;
    procedure Timer1Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    //Vareablen die Überall gelten
    PIC : String;
    Help : Boolean;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Timer1Timer(Sender: TObject);
begin
//Uhrzeit und Datumsanzeige
Label1.caption := 'G System  '+TimetoStr(now)+'  ' + DatetoSTR(now);

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  //Schließt das Programm
  close;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

Randomize;       //Zufall auf Timer Stellen
Button3click(self);    //Taste 3 Drücken
Image2.Picture.LoadFromFile('help.jpg');  //Hilfe Bild laden

end;

procedure TForm1.Button3Click(Sender: TObject);
begin

//Abfrage von Case wechles Zeichen geöffnet wird

CASE Random(24)+1 of
 1 : begin
       PIC := 'ga';
     end;
 2 : begin
       PIC := 'gi';
     end;
 3 : begin
       PIC := 'gu';
     end;
 4 : begin
       PIC := 'ge';
     end;
 5 : begin
       PIC := 'go';
     end;
 6 : begin
       PIC := 'za';
     end;
 7 : begin
       PIC := 'ji1';
     end;
 8 : begin
       PIC := 'zu1';
     end;
 9 : begin
       PIC := 'ze';
     end;
10 : begin
       PIC := 'zo';
     end;
11 : begin
       PIC := 'da';
     end;
12 : begin
       PIC := 'ji2';
     end;
13 : begin
       PIC := 'zu2';
     end;
14 : begin
       PIC := 'de';
     end;
15 : begin
       PIC := 'do';
     end;
16 : begin
       PIC := 'ba';
     end;
17 : begin
       PIC := 'bi';
     end;
18 : begin
       PIC := 'bu';
     end;
19 : begin
       PIC := 'be';
     end;
20 : begin
       PIC := 'bo';
     end;
21 : begin
       PIC := 'pa';
     end;
22 : begin
       PIC := 'pi';
     end;
23 : begin
       PIC := 'pu';
     end;
24 : begin
       PIC := 'pe';
     end;
25 : begin
       PIC := 'po';
     end;
26 : begin
       PIC := '';
     end;
end;

//Öffnen von Bild zum Raten

Image1.Picture.LoadFromFile(PIC+'.jpg');

end;

procedure TForm1.Button2Click(Sender: TObject);
begin

//Abfrage mit IF ob die Antwort stimmt

IF Edit1.text = PIC then
begin
  Showmessage('Sie haben Richtig geantwortet, nun weiter');
  Edit1.text := '';
  Button3click(self)
end
ELSE
begin
  Showmessage('Sie haben Falsch geantwortet, versuchen sie es nochmal');
  IF Edit1.text = 'ji' then Showmessage('Achtung es gibt 2 ji !!! (ji1) oder (ji2)');
  IF Edit1.text = 'zu' then Showmessage('Achtung es gibt 2 zu !!! (zu1) oder (zu2)');
end;

end;

procedure TForm1.Image1Click(Sender: TObject);
begin

//Die Geheime Funktion zum Nachschauen

IF HELP=FALSE THEN
begin
  Form1.ClientWidth := 530;
  HELP:=True;
end
ELSE
begin
  Form1.ClientWidth := 235;
  HELP:=False;
end;

end;

procedure TForm1.FormClick(Sender: TObject);
begin

//Die Geheime Funktion zum Nachschauen

IF HELP=FALSE THEN
begin
  Form1.ClientWidth := 530;
  HELP:=True;
end
ELSE
begin
  Form1.ClientWidth := 235;
  HELP:=False;
end;

end;

procedure TForm1.Edit1Enter(Sender: TObject);
begin
  Form1.Button2Click(Self);
end;

end.
