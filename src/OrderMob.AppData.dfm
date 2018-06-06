object AppData: TAppData
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 261
  Width = 360
  object DataConnection: TFDConnection
    Params.Strings = (
      
        'Database=Z:\Documents\Projects\Work\Danysoft\DIBTour2018\Samples' +
        '\OrdersMob\out\Win32\Debug\bin\Data\MiniGest.sdb'
      'DriverID=SQLite')
    ConnectedStoredUsage = [auDesignTime]
    Connected = True
    LoginPrompt = False
    Left = 72
    Top = 80
  end
  object OrderData: TFDTable
    ActiveStoredUsage = [auDesignTime]
    Active = True
    IndexFieldNames = 'id'
    Connection = DataConnection
    UpdateOptions.UpdateTableName = 'orders'
    TableName = 'orders'
    Left = 88
    Top = 141
    object OrderDataid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object OrderDatalockid: TIntegerField
      FieldName = 'lockid'
      Origin = 'lockid'
      Required = True
    end
    object OrderDatacompany_id: TIntegerField
      FieldName = 'company_id'
      Origin = 'company_id'
    end
    object OrderDatastatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object OrderDatanumber: TStringField
      FieldName = 'number'
      Origin = 'number'
      Size = 15
    end
    object OrderDatareference: TStringField
      FieldName = 'reference'
      Origin = 'reference'
      Size = 15
    end
    object OrderDatatotal: TBCDField
      FieldName = 'total'
      Origin = 'total'
      Precision = 9
      Size = 2
    end
    object OrderDatanote: TWideMemoField
      FieldName = 'note'
      Origin = 'note'
      BlobType = ftWideMemo
    end
    object OrderDatacreated_at: TDateTimeField
      FieldName = 'created_at'
      Origin = 'created_at'
    end
    object OrderDataupdated_at: TDateTimeField
      FieldName = 'updated_at'
      Origin = 'updated_at'
    end
  end
  object OrderItemData: TFDTable
    ActiveStoredUsage = [auDesignTime]
    Active = True
    IndexFieldNames = 'order_id'
    MasterSource = OrdersSource
    MasterFields = 'id'
    Connection = DataConnection
    UpdateOptions.UpdateTableName = 'order_items'
    TableName = 'order_items'
    Left = 272
    Top = 85
    object OrderItemDataid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
      Visible = False
    end
    object OrderItemDatalockid: TIntegerField
      FieldName = 'lockid'
      Origin = 'lockid'
      Required = True
      Visible = False
    end
    object OrderItemDataorder_id: TIntegerField
      FieldName = 'order_id'
      Origin = 'order_id'
      Visible = False
    end
    object OrderItemDataproduct_id: TIntegerField
      FieldName = 'product_id'
      Origin = 'product_id'
      Visible = False
    end
    object OrderItemDataquantity: TBCDField
      FieldName = 'quantity'
      Origin = 'quantity'
      Precision = 9
      Size = 2
    end
    object OrderItemDataprice: TBCDField
      FieldName = 'price'
      Origin = 'price'
      Precision = 9
      Size = 2
    end
    object OrderItemDatatotal: TBCDField
      FieldName = 'total'
      Origin = 'total'
      Precision = 9
      Size = 2
    end
    object OrderItemDatacreated_at: TDateTimeField
      FieldName = 'created_at'
      Origin = 'created_at'
    end
    object OrderItemDataupdated_at: TDateTimeField
      FieldName = 'updated_at'
      Origin = 'updated_at'
    end
  end
  object OrdersSource: TDataSource
    DataSet = OrderData
    Left = 176
    Top = 80
  end
end
