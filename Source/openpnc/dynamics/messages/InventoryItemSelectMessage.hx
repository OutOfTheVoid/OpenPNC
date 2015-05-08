package openpnc.dynamics.messages;

import openpnc.dynamics.IInventoryItem;

import openpnc.messaging.Message;

class InventoryItemSelectMessage extends Message
{
	
	public static inline var MESSAGEID_INVENTORY_ITEM_SELECT:String = "inv_item_select";
	
	private var Item:IInventoryItem;
	
	public function new ( Item:IInventoryItem, Target:String )
	{
		
		super ( MESSAGEID_INVENTORY_ITEM_SELECT, Target );
		
		this.Item = Item;
		
	};
	
	
	public function ResetInventoryItemSelectMessage ( Item:IInventoryItem, Target:String ) : Void
	{
		
		ResetMessage ( MESSAGEID_INVENTORY_ITEM_SELECT, Target );
		
		this.Item = Item;
		
	};
	
	public function GetItem () : IInventoryItem
	{
		
		return Item;
		
	};
	
}
