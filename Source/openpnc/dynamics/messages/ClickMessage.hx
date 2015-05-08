package openpnc.dynamics.messages;

import openpnc.messaging.Message;

class ClickMessage extends Message
{
	
	public static inline var MESSAGEID_CLICK:String = "click";
	
	private var SourceName:String;
	
	public function new ( Target:String, SourceName:String )
	{
		
		super ( MESSAGEID_CLICK, Target );
		
		this.SourceName = SourceName;
		
		this.X = X;
		this.Y = Y;
		
	};
	
	public function GetSourceName () : String
	{
		
		return SourceName;
		
	};
	
	public function ResetClickMessage ( Target:String, SourceName:String ) : Void
	{
		
		ResetMessage ( MESSAGEID_CLICK, Target );
		
		this.SourceName = SourceName;
		
		this.X = X;
		this.Y = Y;
		
	};
	
}
