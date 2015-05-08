package openpnc.messaging;

import openpnc.messaging.IMessage;

class Message implements IMessage
{
	
	private var ID:String;
	private var Target:String;
	
	public function new ( ID:String, Target:String )
	{
		
		this.ID = ID;
		this.Target = Target;
		
	};
	
	public function ResetMessage ( ID:String, Target:String ) : Void
	{
		
		this.ID = ID;
		this.Target = Target;
		
	};
	
	public function GetID () : String
	{
		
		return ID;
		
	};
	
	public function GetTarget () : String
	{
		
		return Target;
		
	};
	
}
