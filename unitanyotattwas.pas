unit unitAnyoTattwas;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,uanyotattwas;

type

  { TForm1 }

  TForm1 = class(TForm)
    btnCalcular: TButton;
    btnEncadenar: TButton;
    btnGirar: TButton;
    chkiniciocalculos: TCheckBox;
    edtMaestro1: TEdit;
    edtgrupo1: TEdit;
    edtGrupo2: TEdit;
    edtGrupo3: TEdit;
    edtMaestro2: TEdit;
    edtMaestro3: TEdit;
    edtresultado1: TEdit;
    edtMaxAdiAnupadana: TEdit;
    edtresultado2: TEdit;
    edtresultado3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure btnCalcularClick(Sender: TObject);
    procedure btnEncadenarClick(Sender: TObject);
    procedure btnGirarClick(Sender: TObject);
    procedure chkiniciocalculosChange(Sender: TObject);
  private
    procedure MostrarDatosAnyo();
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.MostrarDatosAnyo();
begin
  // Tattwa resultante.
  edtresultado1.Text:=ConvertirTattwaStr(resultadott.res1);
  edtresultado2.Text:=ConvertirTattwaStr(resultadott.res2);
  edtresultado3.Text:=ConvertirTattwaStr(resultadott.res3);

  // Nro. maestro resultante
  edtMaestro1.Text:=IntToStr(resultadott.maest1);
  edtMaestro2.Text:=IntToStr(resultadott.maest2);
  edtMaestro3.Text:=IntToStr(resultadott.maest3);

end;

procedure TForm1.btnCalcularClick(Sender: TObject);
begin
  IniciarPeticiones;
  if DefinirPeticion(edtMaxAdiAnupadana.Text,edtgrupo1.Text,edtGrupo2.Text,
    edtGrupo3.Text) then
  begin
    CalcularAnyo;
    MostrarDatosAnyo;
  end
  else
    ShowMessage('Error de los datos de entrada');
end;

procedure TForm1.btnEncadenarClick(Sender: TObject);
begin
    if DefinirPeticion(edtMaxAdiAnupadana.Text,edtgrupo1.Text,edtGrupo2.Text,
    edtGrupo3.Text) then
  begin
    CalcularAnyo;
    MostrarDatosAnyo;
  end
  else
    ShowMessage('Error de los datos de entrada');
end;

procedure TForm1.btnGirarClick(Sender: TObject);
begin
  edtgrupo1.Text:=edtMaestro1.Text;
  edtgrupo2.Text:=edtMaestro2.Text;
  edtgrupo3.Text:=edtMaestro3.Text;
end;

procedure TForm1.chkiniciocalculosChange(Sender: TObject);
begin
  btnEncadenar.Enabled:=chkiniciocalculos.Checked;
end;

end.

