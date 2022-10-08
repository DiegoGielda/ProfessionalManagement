unit formDefaultRegistration;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, dxGDIPlusClasses;

type
  TfrmDefaultRegistration = class(TForm)
    pnlRegistration: TPanel;
    pnlHeader: TPanel;
    btnNew: TSpeedButton;
    btnSave: TSpeedButton;
    btnEdit: TSpeedButton;
    btnNext: TSpeedButton;
    btnPrior: TSpeedButton;
    btnCancel: TSpeedButton;
    btnDelete: TSpeedButton;
    imgPrior: TImage;
    imgNext: TImage;
    imgNew: TImage;
    imgEdit: TImage;
    imgSave: TImage;
    imgCancel: TImage;
    imgDelete: TImage;
  private
    { Private declarations }
  public
    procedure ConfigureButtons;
  end;

var
  frmDefaultRegistration: TfrmDefaultRegistration;

implementation

{$R *.dfm}

{ TfrmDefaultCadastro }

procedure TfrmDefaultRegistration.ConfigureButtons;
begin
   // New
  if btnNew.Enabled = true then
    imgNew.Enabled := false
  else
    imgNew.Enabled := true;
  // Delete
  if btnDelete.Enabled = true then
    imgDelete.Enabled := false
  else
    imgDelete.Enabled := true;
  // Edit
  if btnEdit.Enabled = true then
    imgEdit.Enabled := false
  else
    imgEdit.Enabled := true;
  // Save
  if btnSave.Enabled = true then
    imgSave.Enabled := false
  else
    imgSave.Enabled := true;
  // Cancel
  if btnCancel.Enabled = true then
    imgCancel.Enabled := false
  else
    imgCancel.Enabled := true;
  // Previous
  if btnPrior.Enabled = true then
    imgPrior.Enabled := false
  else
    imgPrior.Enabled := true;
  // Next
  if btnNext.Enabled = true then
    imgNext.Enabled := false
  else
    imgNext.Enabled := true;
end;

end.
