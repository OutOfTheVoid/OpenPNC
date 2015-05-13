package openpnc.dynamics.messages;

import openpnc.dynamics.IInventoryItem;

public class InventoryItemHoverMessage
{
	
	public static inline var MESSAGEID_ITEM_STATE_IDLE:String = "inv_item_hover";
	
	private var Item:IInventoryItem;
	
	public function new ( Item:IInventoryItem, Target:String )
	{
		
		super ( MESSAGEID_ITEM_STATE_IDLE, Target );
		
		this.Item = Item;
		
	};
	
	public function ResetInventoryItemStateMessage ( Item:IInventoryItem, Target:String ) : Void
	{
		
		ResetMessage ( MESSAGEID_ITEM_STATE_IDLE, Target );
		
		this.Item = Item;
		
	};
	
	public function GetItem () : IInventoryItem
	{
		
		return Item;
		
	};
	
}
