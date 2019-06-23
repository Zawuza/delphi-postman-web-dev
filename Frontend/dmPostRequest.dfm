object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 249
  Width = 384
  object RESTClient1: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'https://83df8ae3-135f-414e-ac93-70813c9a2e19.mock.pstmn.io/'
    Params = <>
    RaiseExceptionOn500 = False
    Left = 168
    Top = 48
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Method = rmPOST
    Params = <>
    Resource = 'table'
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 48
    Top = 128
  end
  object RESTResponse1: TRESTResponse
    ContentType = 'text/html'
    Left = 288
    Top = 128
  end
end
