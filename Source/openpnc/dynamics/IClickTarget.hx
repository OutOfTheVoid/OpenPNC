package openpnc.dynamics;

import openpnc.messaging.IMessager;

interface IClickTarget extends IMessager
{
	
	public function Click ( LocalX:Float, LocalY:Float ) : Void;
	
	public function GetX () : Float;
	public function GetY () : Float;
		
}
