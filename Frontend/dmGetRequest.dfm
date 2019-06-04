object GetRequestDataModule: TGetRequestDataModule
  OldCreateOrder = False
  Height = 185
  Width = 272
  object RESTClient1: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    Params = <>
    RaiseExceptionOn500 = False
    Left = 112
    Top = 104
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 56
    Top = 40
  end
  object RESTResponse1: TRESTResponse
    ContentType = 'application/json'
    Left = 176
    Top = 32
  end
end
