package openpnc.graphics.messages;

import openpnc.messaging.Message;

class VisibleMessage extends Message
{
	
	public static inline var MESSAGEID_MAKE_VISIBLE:String = "make_visible";
	public static inline var MESSAGEID_MAKE_INVISIBLE:String = "make_invisible";
	
	public function new ( Visible:Bool, Target:String )
	{
		
		super ( Visible ? MESSAGEID_MAKE_VISIBLE : MESSAGEID_MAKE_INVISIBLE, Target );
		
	};
	
	public function ResetVisibleMessage ( Visible:Bool, Target:String ) : Void
	{
		
		ResetMessage ( Visible ? MESSAGEID_MAKE_VISIBLE : MESSAGEID_MAKE_INVISIBLE, Target );
		
	};
	
}
