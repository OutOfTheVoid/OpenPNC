package openpnc.graphics.messages;

import openpnc.messaging.Message;

import openpnc.dynamics.IInventoryItem;

class AddInevtoryUIItemMessage extends Message
{
	
	public static inline var MESSAGEID_ADD_INVUI_ITEM:String = "invui_add_item";
	
	private var Item:IInventoryItem;
	
	public function new ( Item:IInventoryItem, Target:String )
	{
		
		super ( MESSAGEID_ADD_INVUI_ITEM, Target );
		
		this.Item = Item;
		
	};
	
	public function ResetAddInevtoryUIItemMessage ( Item:IInventoryItem, Target:String ) : Void
	{
		
		ResetMessage ( MESSAGEID_ADD_INVUI_ITEM, Target );
		
		this.Item = Item;
		
	};
	
	public function GetItem () : IInventoryItem
	{
		
		return Item;
		
	};
	
}
