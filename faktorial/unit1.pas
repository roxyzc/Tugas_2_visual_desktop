unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type
  { TForm1 }

  TForm1 = class(TForm)
    BtnHitung: TButton;
    EJumlah: TEdit;
    EFaktorial: TEdit;
    EN: TEdit;
    GBHasil: TGroupBox;
    LbJumlah: TLabel;
    LbFaktorial: TLabel;
    LbN: TLabel;
    procedure BtnHitungClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

function HitungFaktorial(N: Integer): Integer;
begin
  if N <= 1 then
    Result := 1
  else
    Result := N * HitungFaktorial(N - 1);
end;

procedure TForm1.BtnHitungClick(Sender: TObject);
var
  N, i, Faktorial, jumlah: Integer;
begin
  N := StrToIntDef(EN.Text, 0);

  if N < 0 then
  begin
    ShowMessage('Masukkan bilangan bulat non-negatif.');
    Exit;
  end;

  Faktorial := HitungFaktorial(N);
  EFaktorial.Text := IntToStr(Faktorial);

  Jumlah := 0;
  for i := 1 to N do
      Jumlah := Jumlah + i;

  EJumlah.Text := IntToStr(Jumlah);
end;

end.

