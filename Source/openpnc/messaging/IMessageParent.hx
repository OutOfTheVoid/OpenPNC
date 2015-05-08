package openpnc.messaging;

import openpnc.messaging.IMessageTarget;
import openpnc.messaging.IMessage;

interface IMessageParent extends IMessageTarget
{
	
	public function AddMessageChild ( Child:IMessageTarget ) : Void;
	public function RemoveMessageChild ( Child:IMessageTarget ) : Void;
	
	public function CascadeMessage ( Message:IMessage, LastSeperatorIndex:Int ) : Void;
	public function InitialCascadeMessage ( Message:IMessage ) : Void;
	
}
