unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ColorBox,
  ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    BtnTotalGaji: TButton;
    BtnIsiDataLagi: TButton;
    BtnClose: TButton;
    CbJabatan: TComboBox;
    EGajiBersih: TEdit;
    EStatusTunjangan: TEdit;
    EGajiPokok: TEdit;
    ENamaPegawai: TEdit;
    LbGajiBersih: TLabel;
    LbStatusTunjangan: TLabel;
    LbGajiPokok: TLabel;
    LbJabatan: TLabel;
    LbNamaPegawai: TLabel;
    RgStatus: TRadioGroup;
    procedure BtnCloseClick(Sender: TObject);
    procedure BtnIsiDataLagiClick(Sender: TObject);
    procedure BtnTotalGajiClick(Sender: TObject);
    procedure CbJabatanChange(Sender: TObject);
    procedure RgStatusSelectedChanges(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.CbJabatanChange(Sender: TObject);
var
  jabatan: String;
begin
    jabatan := CbJabatan.Text;
    if ('Direktur'.Equals(jabatan)) then
        EGajiPokok.Text := '5000000'
    else
    if ('Manager'.Equals(jabatan)) then
        EGajiPokok.Text := '3000000'
    else
    if ('Karyawan'.Equals(jabatan)) then
        EGajiPokok.Text := '1000000'
    else
end;

procedure TForm1.BtnTotalGajiClick(Sender: TObject);
var
   hasil: real;
begin
    try
       if (''.Equals(ENamaPegawai.Text)) then
       begin
           raise Exception.Create('');
       end;

       hasil := StrToFloat(EGajiPokok.Text) + StrToFloat(EStatusTunjangan.Text);
       EGajiBersih.Text := CurrToStr(hasil);
    except
       ShowMessage('nama, status dan jabatan wajib diisi');
    end;
end;

procedure TForm1.BtnCloseClick(Sender: TObject);
begin
  Form1.Close;
end;

procedure TForm1.BtnIsiDataLagiClick(Sender: TObject);
begin
  ENamaPegawai.Text := '';
  CbJabatan.Text := 'Pilih Jabatan';
  EGajiPokok.Text := '0';
  RgStatus.ItemIndex := -1;
  EStatusTunjangan.Text := '0';
  EGajiBersih.Text := '0';
end;

procedure TForm1.RgStatusSelectedChanges(Sender: TObject);
begin
    if (RgStatus.ItemIndex = -1) then
        EStatusTunjangan.Text := '0'
    else
    if (RgStatus.ItemIndex = 0) then
      EStatusTunjangan.Text := '1500000'
    else
    if (RgStatus.ItemIndex = 1) then
      EStatusTunjangan.Text := '500000'
    else
end;

end.

