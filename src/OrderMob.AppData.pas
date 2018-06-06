unit OrderMob.AppData;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.VCLUI.Wait;

type
  TAppData = class(TDataModule)
    DataConnection: TFDConnection;
    OrderData: TFDTable;
    OrderItemData: TFDTable;
    OrderDataid: TFDAutoIncField;
    OrderDatalockid: TIntegerField;
    OrderDatacompany_id: TIntegerField;
    OrderDatastatus: TIntegerField;
    OrderDatanumber: TStringField;
    OrderDatareference: TStringField;
    OrderDatatotal: TBCDField;
    OrderDatanote: TWideMemoField;
    OrderDatacreated_at: TDateTimeField;
    OrderDataupdated_at: TDateTimeField;
    OrdersSource: TDataSource;
    OrderItemDataid: TFDAutoIncField;
    OrderItemDatalockid: TIntegerField;
    OrderItemDataorder_id: TIntegerField;
    OrderItemDataproduct_id: TIntegerField;
    OrderItemDataquantity: TBCDField;
    OrderItemDataprice: TBCDField;
    OrderItemDatatotal: TBCDField;
    OrderItemDatacreated_at: TDateTimeField;
    OrderItemDataupdated_at: TDateTimeField;
    procedure DataModuleCreate(Sender: TObject);
    procedure SetupDataConnection;
  private
    function GetAppdataFolder: string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AppData: TAppData;

implementation
uses System.IOUtils, OrderMob.Tools;

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

procedure TAppData.DataModuleCreate(Sender: TObject);
begin
  SetupDataConnection;
end;

function TAppData.GetAppdataFolder: string;
begin

// TPath.GetDocumentsPath
// en iOS: <application ID>/Documents. Para DeployManager: 'StartUp\Documents'
// en Android: GetFilesDir (Internal memory). Para DeployManager: 'assets\internal'
//
// TPath.GetSharedDocumentsPath
// en iOS: NO EXISTE!!!
// en Android: GetFilesDir (Internal memory). Para DeployManager: 'assets\external'

{$IF Defined(DEBUG) and Defined(WIN32)} //  Asumimos ejecucion desde el IDE
  Result :=  TPath.GetFullPath(TPath.Combine(TPath.GetDirectoryName(ParamStr(0)), '..\..\..\..\AppDataPath'));
{$ELSE}
  Result := TPath.GetDocumentsPath
{$ENDIF}
end;

procedure TAppData.SetupDataConnection;
const
  DatabaseFile = 'MiniGest.sdb';
begin
  DataConnection.DriverName := 'SQLite';
  DataConnection.Params.Database := TPath.Combine(GetAppdataFolder, DatabaseFile);
  Logger.Debug('abriendo BD en ' + GetAppdataFolder);
  DataConnection.Open;
  OrderData.Open;
  OrderItemData.Open;
end;

end.
