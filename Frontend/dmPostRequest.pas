unit dmPostRequest;

interface

uses
  System.SysUtils,
  System.Classes,
  System.Generics.Collections,
  System.JSON,

  REST.Types,
  REST.Client,

  Data.Bind.Components,
  Data.Bind.ObjectScope;

type
  TDataModule1 = class(TDataModule)
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
  private
    { Private declarations }
  public
    { Public declarations }
    function DoRequest(AServerAddress: string;
      ATable: TObjectList<TStringList>): string;
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}
{$R *.dfm}
{ TDataModule1 }

function TDataModule1.DoRequest(AServerAddress: string;
  ATable: TObjectList<TStringList>): string;
var
  LStrList: TStringList;
  LString: string;
  LRowsCount: integer;
  LColumnsCount: integer;
  LJSON: TJSONObject;
  LJSONTable: TJSONArray;
  LJSONRow: TJSONArray;
begin
  LRowsCount := ATable.Count;
  if LRowsCount > 0 then
    LColumnsCount := ATable[0].Count
  else
    LColumnsCount := 0;

  LJSON := TJSONObject.Create;
  LJSON.AddPair('rows', TJSONNumber.Create(LRowsCount));
  LJSON.AddPair('columns', TJSONNumber.Create(LColumnsCount));

  LJSONTable := TJSONArray.Create;
  for LStrList in ATable do
  begin
    LJSONRow := TJSONArray.Create;
    for LString in LStrList do
    begin
      LJSONRow.Add(StrToInt(LString));
    end;
    LJSONTable.Add(LJSONRow);
  end;

  LJSON.AddPair('table', LJSONTable);

  RESTClient1.BaseURL := AServerAddress;
  RESTRequest1.Body.Add(LJSON);
end;

end.
