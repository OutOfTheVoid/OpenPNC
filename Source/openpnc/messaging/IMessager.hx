package openpnc.messaging;

import openpnc.messaging.IMessageParent;
import openpnc.messaging.IMessageTarget;

interface IMessager
{
	
	public function SetMessageTarget ( Target:IMessageTarget ) : Void;
	
}
