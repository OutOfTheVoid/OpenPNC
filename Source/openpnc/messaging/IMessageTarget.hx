package openpnc.messaging;

import openpnc.messaging.IMessageable;

interface IMessageTarget extends IMessageable
{
	
	public function GetName () : String;
	
}
