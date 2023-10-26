unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TFPenjualBarang }

  TFPenjualBarang = class(TForm)
    btnHitung: TButton;
    BtnUlang: TButton;
    BtnKeluar: TButton;
    CbKodeBarang: TComboBox;
    EDiskon: TEdit;
    ETotal: TEdit;
    ESubTotal: TEdit;
    EHargaSatuan: TEdit;
    ENamaBarang: TEdit;
    EQuantity: TEdit;
    LbTotal: TLabel;
    LbDiskon: TLabel;
    LbSubTotal: TLabel;
    LbHargaSatuan: TLabel;
    LbNamaBarang: TLabel;
    LbQuantity: TLabel;
    LbKodeBarang: TLabel;
    LbJudul: TLabel;
    procedure btnHitungClick(Sender: TObject);
    procedure BtnKeluarClick(Sender: TObject);
    procedure BtnUlangClick(Sender: TObject);
    procedure CbKodeBarangChange(Sender: TObject);
    procedure EQuantityChange(Sender: TObject);
  private

  public

  end;

var
  FPenjualBarang: TFPenjualBarang;

implementation

{$R *.lfm}

{ TFPenjualBarang }

procedure TFPenjualBarang.BtnKeluarClick(Sender: TObject);
begin
  FPenjualBarang.Close;
end;

procedure TFPenjualBarang.BtnUlangClick(Sender: TObject);
begin
     CbKodeBarang.Text := 'Pilih kode barang';
     ENamaBarang.Text := '';
     EHargaSatuan.Text := '0';
     EQuantity.Text := '';
     EQuantity.TextHint := '0';
     ESubTotal.Text := '0';
     EDiskon.Text := '0';
     ETotal.Text := '0';
end;

procedure TFPenjualBarang.btnHitungClick(Sender: TObject);
var
  subTotal: Real;
begin
  subTotal := StrToFloat(ESubTotal.Text);
   if subTotal >= 100000 then
       begin
         EDiskon.Text := '15';
         ETotal.Text := CurrToStr(0.15 * subTotal);
       end
    else
    if subTotal >= 50000 then
       begin
         EDiskon.Text := '10';
         ETotal.Text := CurrToStr(0.10 * subTotal);
       end
    else
    if subTotal >= 50000 then
       begin
         EDiskon.Text := '10';
         ETotal.Text := CurrToStr(0.10 * subTotal);
       end
    else
    if subTotal >= 25000 then
       begin
         EDiskon.Text := '5';
         ETotal.Text := CurrToStr(0.5 * subTotal);
       end
    else
    begin
      EDiskon.Text := '0';
      ETotal.Text := CurrToStr(subTotal);
    end;
end;

procedure TFPenjualBarang.CbKodeBarangChange(Sender: TObject);
var
  kodeBarang: String;
begin
  kodeBarang := CbKodeBarang.Text;
  case kodeBarang of
  'A01':
  begin
    ENamaBarang.Text := 'Speaker';
    EHargaSatuan.Text := '50000';
  end;
  'B02':
  begin
    ENamaBarang.Text := 'Mouse';
    EHargaSatuan.Text := '25000';
  end;
  'C03':
  begin
    ENamaBarang.Text := 'Hardisk';
    EHargaSatuan.Text := '750000';
  end;
  'D04':
  begin
    ENamaBarang.Text := 'Mouse Pad';
    EHargaSatuan.Text := '5000';
  end;
  else
  begin
    // Handle the case where kodeBarang doesn't match any of the specified values
  end;
end;

end;

procedure TFPenjualBarang.EQuantityChange(Sender: TObject);
var
  quantity: Integer;
  subTotal, hargaSatuan: Real;
begin
  try
    if EQuantity.Text = '' then
    else
      quantity := StrToInt(EQuantity.Text);

    if (quantity > 10) or (quantity < 1) then
    begin
      raise Exception.Create('Quantity tidak boleh lebih dari 10 atau kurang dari 1');
    end;

    hargaSatuan := StrToFloat(EHargaSatuan.Text);
    subTotal := quantity * hargaSatuan;
    ESubTotal.Text := CurrToStr(subTotal);
  except
    on E: Exception do
    begin
      ShowMessage(E.Message);
    end;
  end;
end;

end.

