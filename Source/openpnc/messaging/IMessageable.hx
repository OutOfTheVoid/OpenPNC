package openpnc.messaging;

import openpnc.messaging.IMessage;

interface IMessageable
{
	
	public function SendMessage ( Message:IMessage ) : Void;
	
}
