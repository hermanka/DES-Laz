unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls, descalc;

type

  { TForm1 }

  TForm1 = class(TForm)
    btnEnc: TButton;
    btnDec: TButton;
    eKey: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    mOutput: TMemo;
    mInput: TMemo;
    procedure btnDecClick(Sender: TObject);
    procedure btnEncClick(Sender: TObject);
    procedure mInputChange(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }


{************** FungsiTimer**************}
Function TimerMilliseconds (const D1, D2 : TDateTime) : Int64;
const
  OneDay         = 1.0;
  OneHour        = OneDay / 24.0;
  OneMinute      = OneHour / 60.0;
  OneSecond      = OneMinute / 60.0;
  OneMillisecond = OneSecond / 1000.0;
Begin
  Result := Trunc ((D2 - D1) / OneMillisecond);
End;

{************** DES-Enkripsi**************}
procedure TForm1.btnEncClick(Sender: TObject);
var
ldMulai, ldSelesai : TDateTime;
liSelisih : Int64;
teks:string;
begin
  ldMulai := now;
  mOutput.Text:= descalc.EncryStrHex(mInput.Text,eKey.Text );
  //teks := Plainteks.Text ;
  //Ehasil.Text := inttostr(length(teks));
  ldSelesai := now;
  liSelisih := TimerMilliseconds( ldMulai, ldSelesai);
  //timerEnc.text:=inttostr(liselisih);
end;

procedure TForm1.mInputChange(Sender: TObject);
begin

end;

{************** DES-Dekripsi**************}
procedure TForm1.btnDecClick(Sender: TObject);
var
ldMulai, ldSelesai : TDateTime;
liSelisih : Int64;
begin
   ldMulai := now;
   mOutput.Text := descalc.DecryStrHex(mInput.Text,eKey.Text);
   ldSelesai := now;
   liSelisih := TimerMilliseconds( ldMulai, ldSelesai);
   //timerDec.text:=inttostr(liselisih);
end;

end.

