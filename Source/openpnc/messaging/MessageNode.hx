package openpnc.messaging;

import openpnc.messaging.IMessageParent;
import openpnc.messaging.IMessageTarget;
import openpnc.messaging.IMessage;
import openpnc.messaging.IMessageable;


class MessageNode implements IMessageParent
{
	
	private var Name:String;
	
	private var ChildMap:Map <String, IMessageTarget>;
	private var ChildParentMap:Map <String, IMessageParent>;
	
	private var Receiver:IMessageable;
	
	public function new ( Name:String, DirectMessageReceiver:IMessageable )
	{
		
		this.Name = Name;
		
		ChildMap = new Map <String, IMessageTarget> ();
		ChildParentMap = new Map <String, IMessageParent> ();
		
		this.Receiver = DirectMessageReceiver;
		
	};
	
	public function GetName () : String
	{
		
		return Name;
		
	};
	
	public function AddMessageChild ( Child:IMessageTarget ) : Void
	{
		
		if ( Child == null )
			return;
			
		var ChildParent:IMessageParent;
		
		try
		{
			
			ChildParent = cast ( Child, IMessageParent );
			
		}
		catch ( UnknownException:Dynamic )
		{
			
			ChildMap.set ( Child.GetName (), Child );
			
			return;
			
		}
		
		ChildParentMap.set ( ChildParent.GetName (), ChildParent );
		
	};
	
	public function RemoveMessageChild ( Child:IMessageTarget ) : Void
	{
		
		ChildMap.remove ( Child.GetName () );
		ChildParentMap.remove ( Child.GetName () );
		
	};
	
	public function CascadeMessage ( Message:IMessage, LastSeperatorIndex:Int ) : Void
	{
		
		var MTarget:String = Message.GetTarget ();
		var ChildName:String;
		
		var NextSeperatorIndex:Int = MTarget.indexOf ( ".", LastSeperatorIndex + 1 );
		
		if ( NextSeperatorIndex == - 1 )
		{
			
			ChildName = MTarget.substr ( LastSeperatorIndex + 1 );
			
			if ( ChildMap.exists ( ChildName ) )
				ChildMap [ ChildName ].SendMessage ( Message );
				
			if ( ChildName == "*" )
			{
				
				for ( Child in ChildMap )
					Child.SendMessage ( Message );
				
			}
				
			return;
			
		}
		
		ChildName = MTarget.substr ( LastSeperatorIndex + 1, NextSeperatorIndex - LastSeperatorIndex - 1 );
		
		if ( ChildParentMap.exists ( ChildName ) )
			ChildParentMap [ ChildName ].CascadeMessage ( Message, NextSeperatorIndex );
			
		if ( ChildName == "*" )
		{
			
			for ( ChildParent in ChildParentMap )
				ChildParent.CascadeMessage ( Message, NextSeperatorIndex );
			
		}
		
	};
	
	public function InitialCascadeMessage ( Message:IMessage ) : Void
	{
		
		var MTarget:String = Message.GetTarget ();
		
		if ( MTarget == "" )
			SendMessage ( Message );
		
		var NextSeperatorIndex:Int = MTarget.indexOf ( "." );
		
		if ( NextSeperatorIndex == - 1 )
		{
			
			if ( ChildMap.exists ( MTarget ) )
				ChildMap [ MTarget ].SendMessage ( Message );
				
			if ( MTarget == "*" )
			{
				
				for ( Child in ChildMap )
					Child.SendMessage ( Message );
				
			}
			
		}
		
		var ChildName:String = MTarget.substr ( 0, NextSeperatorIndex - 1 );
		
		if ( ChildParentMap.exists ( ChildName ) )
			ChildParentMap [ ChildName ].CascadeMessage ( Message, NextSeperatorIndex );
			
		if ( ChildName == "*" )
		{
			
			for ( ChildParent in ChildParentMap )
				ChildParent.CascadeMessage ( Message, NextSeperatorIndex );
			
		}
		
	};
	
	public function SendMessage ( Message:IMessage ) : Void
	{
		
		if ( Receiver != null )
			Receiver.SendMessage ( Message );
		
	};
	
}
