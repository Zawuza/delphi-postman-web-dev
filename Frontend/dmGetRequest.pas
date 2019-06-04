unit dmGetRequest;

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
  TGetRequestDataModule = class(TDataModule)
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
  private
    { Private declarations }
  public
    { Public declarations }
    function DoRequest(AServerAddress: string; TableId: string)
      : TObjectList<TStringList>;
  end;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}
{$R *.dfm}
{ TGetRequestDataModule }

{ TGetRequestDataModule }

function TGetRequestDataModule.DoRequest(AServerAddress, TableId: string)
  : TObjectList<TStringList>;
var
  LTable: TJSONArray;
  LRow: TJSONArray;
  LInt: TJSONNumber;
  i, j: integer;
begin
  RESTClient1.BaseURL := AServerAddress;
  RESTRequest1.Resource := '/table/{id}';
  RESTRequest1.Params.AddUrlSegment('id', TableId);
  RESTRequest1.Execute;
  LTable := ((RESTResponse1.JSONValue as TJSONObject).Values['table']
    as TJSONArray);
  Result := TObjectList<TStringList>.Create(true);
  for i := 0 to LTable.Count - 1 do
  begin
    LRow := LTable.Items[i] as TJSONArray;
    Result.Add(TStringList.Create);
    for j := 0 to LRow.Count - 1 do
    begin
      LInt := LRow.Items[j] as TJSONNumber;
      Result[i].Add(LInt.Value);
    end;
  end;
end;

end.
