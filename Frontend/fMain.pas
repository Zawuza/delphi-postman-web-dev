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

  dmGetRequest;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  MOCK_SERVER_ADDR = '';

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.GetTableButtonClick(Sender: TObject);
var LRequestDM: TGetRequestDataModule;
    LTable: TObjectList<TStringList>;
    i,j: integer;
begin
  LRequestDM := TGetRequestDataModule.Create(nil);
  LTable := LRequestDM.DoRequest(MOCK_SERVER_ADDR, '1');
  if LTable.Count < 1 then
    exit;
  for i:=0 to LTable[0].Count-1 do
    StringGrid.AddObject(TStringColumn.Create(StringGrid));
  for i:=0 to LTable.Count-1 do
  begin
    for j:=0 to LTable[i].Count-1 do
    begin
      StringGrid.Cells[j,i] := LTable[i][j];
    end;
  end;
end;

end.
