package openpnc.dynamics;

import openpnc.messaging.IMessageParent;

import openpnc.dynamics.IGraphic;

interface IRoom implements IMessageParent
{
	
	public function Initialize () : Void;
	public function UnInitialize () : Void;
	
	public function GetGraphic () : IGraphic;
	
}
