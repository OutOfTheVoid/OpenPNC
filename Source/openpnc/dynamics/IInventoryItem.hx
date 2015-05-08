package openpnc.dynamics;

import openpnc.graphics.IGraphic;
import openpnc.messaging.IMessageTarget;

interface IInventoryItem extends IMessageTarget
{
	
	public function GetInventoryGraphic () : IGraphic;
	public function GetMouseGraphic () : IGraphic;
	
	public function GetItemName () : String;
	public function GetItemDescription () : String;
		
}
