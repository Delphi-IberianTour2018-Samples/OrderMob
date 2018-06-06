unit OrderMob.Tools;

interface

type
  Logger = class
  public
    class procedure Debug(const Text: string);
  end;

implementation
uses FMX.Types;

{ Logger }

class procedure Logger.Debug(const Text: string);
begin
  Log.d(Text);
end;

end.
