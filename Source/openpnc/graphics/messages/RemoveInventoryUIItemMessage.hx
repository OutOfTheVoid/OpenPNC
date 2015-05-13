package openpnc.graphics.messages;

class RemoveInventoryUIItemMessage
{
	
	public static inline var MESSAGEID_REMOVE_INVUI_ITEM:String = "invui_remove_item";
	
	private var Item:IInventoryItem;
	
	public function new ( Item:IInventoryItem, Target:String )
	{
		
		super ( MESSAGEID_ADD_INVUI_ITEM, Target );
		
		this.Item = Item;
		
	};
	
	public function ResetRemoveInevtoryUIItemMessage ( Item:IInventoryItem, Target:String ) : Void
	{
		
		ResetMessage ( MESSAGEID_ADD_INVUI_ITEM, Target );
		
		this.Item = Item;
		
	};
	
	public function GetItem () : IInventoryItem
	{
		
		return Item;
		
	};
	
}
