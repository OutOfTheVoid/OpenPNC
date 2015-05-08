package openpnc.dynamics.messages;

import openpnc.messaging.Message;

import openpnc.dynamics.IInventoryItem;

class InventoryItemRemoveMessage extends Message
{
	
	public static inline var MESSAGEID_ITEM_REMOVE:String = "inv_item_remove";
	
	private var Item:IInventoryItem;
	
	public function new ( Target:String, Item:IInventoryItem )
	{
		
		super ( MESSAGEID_ITEM_REMOVE, Target );
		
		this.Item = Item;
		
	};
	
	public function Reset ( Target:String, Item:IInventoryItem ) : Void
	{
		
		ResetMessage ( MESSAGEID_ITEM_REMOVE, Target );
		
		this.Item = Item;
		
	};
	
	public function GetItem () : IInventoryItem
	{
		
		return Item;
		
	};
	
}