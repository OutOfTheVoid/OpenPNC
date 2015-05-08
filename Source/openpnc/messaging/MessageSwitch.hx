package openpnc.messaging;

import openpnc.messaging.IMessage;
import openpnc.messaging.MessageSwitch;

typedef MessageHandler =
{
	
	Handler:IMessage -> Void,
	RequiredType:Class <Dynamic>
	
}

class MessageSwitch
{
	
	var MessageHandlers:Map <String, MessageHandler>;
	
	public function new ()
	{
		
		MessageHandlers = new Map <String, MessageHandler> ();
		
	};
	
	public function SendMessage ( Message:IMessage ) : Void
	{
		
		if ( MessageHandlers.exists ( Message.GetID () ) )
		{
			
			var Handler = MessageHandlers [ Message.GetID () ];
			
			if ( Handler.RequiredType == null )
				return Handler.Handler ( Message );
			
			if ( Std.is ( Message, Handler.RequiredType ) )
				return Handler.Handler ( Message );
			
		}
		
	};
	
	public function SetSwitch ( ID:String, Handler:IMessage -> Void, RequiredType:Class <Dynamic> = null ) : Void
	{
		
		if ( Handler == null )
		{
			
			MessageHandlers.remove ( ID );
			
			return;
			
		}
		
		MessageHandlers.set ( ID, { Handler:Handler, RequiredType:RequiredType } );
		
	};
	
}
