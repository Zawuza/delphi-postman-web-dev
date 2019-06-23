object PostRequestDataModule: TPostRequestDataModule
  OldCreateOrder = False
  Height = 249
  Width = 384
  object RESTClient1: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
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
