package openpnc.messaging;

import openpnc.messaging.IMessageTarget;

interface IMessager
{
	
	public function SetMessageTarget ( Target:IMessageTarget ) : Void;
	
}
