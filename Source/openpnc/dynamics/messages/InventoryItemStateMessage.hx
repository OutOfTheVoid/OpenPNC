package openpnc.dynamics.messages;

import openpnc.messaging.Message;

class InventoryItemStateMessage extends Message
{
	
	public static inline var MESSAGEID_ITEM_STATE_IDLE:String = "inv_item_state_idle";
	public static inline var MESSAGEID_ITEM_STATE_HOVER:String = "inv_item_state_hover";
	public static inline var MESSAGEID_ITEM_STATE_SELECTED:String = "inv_item_state_selected";
	public static inline var MESSAGEID_ITEM_STATE_REMOVED:String = "inv_item_state_removed";
	
	public function new ( ID:String, Target:String )
	{
		
		super ( ID, Target );
		
	};
	
	public function ResetInventoryItemStateMessage ( ID:String, Target:String ) : Void
	{
		
		ResetMessage ( ID, Target );
		
	};
	
}
