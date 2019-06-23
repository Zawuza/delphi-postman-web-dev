unit fMain;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  System.Rtti,
  System.Generics.Collections,

  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Grid.Style,
  FMX.StdCtrls,
  FMX.Controls.Presentation,
  FMX.ScrollBox,
  FMX.Grid,

  dmGetRequest,
  dmPostRequest;

type
  TForm1 = class(TForm)
    StringGrid: TStringGrid;
    HeadPanel: TPanel;
    HeaderLabel: TLabel;
    BottomPanel: TPanel;
    IdLabel: TLabel;
    GetTableButton: TButton;
    SaveTableButton: TButton;
    procedure GetTableButtonClick(Sender: TObject);
    procedure SaveTableButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  MOCK_SERVER_ADDR =
    'https://83df8ae3-135f-414e-ac93-70813c9a2e19.mock.pstmn.io';

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.GetTableButtonClick(Sender: TObject);
var
  LRequestDM: TGetRequestDataModule;
  LTable: TObjectList<TStringList>;
  i, j: integer;
begin
  LRequestDM := TGetRequestDataModule.Create(nil);
  try
    LTable := LRequestDM.DoRequest(MOCK_SERVER_ADDR, '1');
    try
      if LTable.Count < 1 then
        exit;
      for i := 0 to LTable[0].Count - 1 do
        StringGrid.AddObject(TStringColumn.Create(StringGrid));
      for i := 0 to LTable.Count - 1 do
      begin
        for j := 0 to LTable[i].Count - 1 do
        begin
          StringGrid.Cells[j, i] := LTable[i][j];
        end;
      end;
    finally
      FreeAndNil(LTable);
    end;
  finally
    FreeAndNil(LRequestDM);
  end;
end;

procedure TForm1.SaveTableButtonClick(Sender: TObject);
var
  LRequestDM: TPostRequestDataModule;
  LTable: TObjectList<TStringList>;
  i, j: integer;
  LId: string;
begin
  LRequestDM := TPostRequestDataModule.Create(nil);
  LTable := TObjectList<TStringList>.Create(true);
  try
    for i := 0 to StringGrid.RowCount - 1 do
    begin
      LTable.Add(TStringList.Create);
      for j := 0 to StringGrid.ColumnCount - 1 do
        LTable[i].Add(StringGrid.Cells[j, i]);
    end;
    LId := LRequestDM.DoRequest(MOCK_SERVER_ADDR, LTable);
    IdLabel.Text := 'Table ID = ' + LId;
  finally
    FreeAndNil(LRequestDM);
    FreeAndNil(LTable);
  end;
end;

end.
