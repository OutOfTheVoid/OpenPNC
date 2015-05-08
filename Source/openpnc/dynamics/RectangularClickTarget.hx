package openpnc.dynamics;

import openpnc.dynamics.IClickTarget;
import openpnc.dynamics.messages.ClickMessage;

import openpnc.messaging.IMessager;
import openpnc.messaging.IMessageTarget;

class RectangularClickTarget implements IClickTarget
{
	
	private var SourceName:String;
	
	private var Width:Float;
	private var Height:Float;
	
	private var Message:ClickMessage;
	
	private var Target:IMessageTarget;
	
	public function new ( SourceName:String, MessageTarget:String, Width:Float, Height:Float )
	{
		
		this.SourceName = SourceName;
		
		Message = new ClickMessage ( MessageTarget, SourceName );
		
		this.Width = Width;
		this.Height = Height;
		
		Target = null;
		
	};
	
	public function SetTarget ( Target:IMessageTarget ) : Void
	{
		
		this.Target = Target;
		
	};
	
	public function Click ( LocalX:Float, LocalY:Float ) : Void
	{
		
		if ( ( X >= 0.0 ) && ( X <= Width ) && ( Y >= 0.0 ) && ( Y <= Height ) )
		{
			
			if ( Target != null )
				Target.SendMessage ( Message );
			
		}
		
	};
	
}
