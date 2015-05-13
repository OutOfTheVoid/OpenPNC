package openpnc.dynamics;

import openpnc.dynamics.IInventoryItem;

import openpnc.messaging.IMessageParent;
import openpnc.messaging.IMessageTarget;
import openpnc.messaging.MessageNode;
import openpnc.messaging.MessageSwitch;

import openpnc.graphics.IInventoryUI;

import openpnc.dynamics.messages.InventoryItemCollectMessage;
import openpnc.dynamics.messages.InventoryItemRemoveMessage;
import openpnc.dynamics.messages.InventoryItemSellectMessage;
import openpnc.dynamics.messages.InventoryItemHoverMessage;

import openpnc.graphics.messages.AddInventoryUIItemMessage;
import openpnc.graphics.messages.RemoveInventoryUIItemMessage;

import openpnc.dynamics.messages.InventoryItemStateMessage;

class Inventory implements IMessageParent
{
	
	private var Items:Array <IInventoryItem>;
	
	private var Node:MessageNode;
	private var Switch:MessageSwitch;
	
	private var UITarget:String;
	private var MessageTarget:IMessageTarget;
	
	private var SelectedItem:IInventoryItem;
	private var HoveredItem:IInventoryItem;
	
	private var UI:IInventoryUI;
	
	private var PersistantItemStateMessage:InventoryItemStateMessage;
	
	public function new ( Name:String )
	{
		
		this.Name = Name;
		
		Items = new Array <IInventoryItem>;
		
		Switch = new MessageSwitch ();
		Node = new MessageNode ( Name, Switch );
		
		Switch.SetSwitch ( InventoryItemCollectMessage.MESSAGEID_ITEM_COLLECT, OnItemCollect, InventoryItemCollectMessage );
		Switch.SetSwitch ( InventoryItemRemoveMessage.MESSAGEID_ITEM_REMOVE, OnItemRemove, InventoryItemRemoveMessage );
		Switch.SetSwitch ( InventoryItemSelectMessage.MESSAGEID_ITEM_SELECT, OnItemSelect, InventoryItemSelectMessage );
		Switch.SetSwitch ( InventoryItemSelectMessage.MESSAGEID_ITEM_HOVER, OnItemHover, InventoryItemHoverMessage );
		
		UITarget = "";
		MessageTarget = null;
		
		SelectedItem = null;
		HoveredItem = null;
		
		UI = null;
		
		
		PersistantItemStateMessage = new InventoryItemStateMessage ( PersistantItemStateMessage.MESSAGEID_ITEM_STATE_IDLE, "" );
		
	}
	
	public function SetUI ( UI:IInventoryUI ) : Void
	{
		
		if ( this.UI == UI )
			return;
		
		if ( this.UI != null )
			this.UI.SetMessageTarget ( null );
		
		this.UI = UI;
		
		UI.SetMessageTarget ( this );
		
		var AddItemMessage:AddInventoryUIItemMessage = new AddInventoryUIItemMessage ( null, "" );
		
		PersistantItemStateMessage.Reset ( InventoryItemStateMessage.MESSAGEID_ITEM_STATE_IDLE, "" );
		
		for ( Item in Items )
		{
			
			Item.SendMessage ( PersistantItemStateMessage );
			
			AddItemMessage.ResetAddInventoryUIItemMessage ( Item, "" );
			UI.SendMessage ( AddItemMessage );
			
		}
		
	}
	
	public function SetMessageTarget ( Target:IMessageTarget ) : Void
	{
		
		MessageTarget = Target;
		
	};
	
	public function SetUITarget ( Target:String ) : Void
	{
		
		UITarget = Target;
		
	};
	
	public function GetName () : String
	{
		
		return Node.GetName ();
		
	};
	
	public function AddMessageChild ( Child:IMessageTarget ) : Void
	{
		
		Node.AddMessageChild ( Child );
		
	};
	
	public function RemoveMessageChild ( Child:IMessageTarget ) : Void
	{
		
		Node.RemoveMessageChild ( Child );
		
	};
	
	public function CascadeMessage ( Message:IMessage, LastSeperatorIndex:Int ) : Void
	{
		
		Node.CascadeMessage ( Message, LastSeperatorIndex );
		
	};
	
	public function InitialCascadeMessage ( Message:IMessage ) : Void
	{
		
		Node.InitialCascadeMessage ( Message );
		
	};
	
	public function SendMessage ( Message:IMessage ) : Void
	{
		
		Node.SendMessage ( Message );
		
	};
	
	private function OnItemCollect ( Message:InventoryItemCollectMessage ) : Void
	{
		
		var Item:IInventoryItem = Message.GetItem ();
		
		Items.push ( Item );
		Node.AddMessageChild ( Item );
		
		PersistantItemStateMessage.Reset ( InventoryItemStateMessage.MESSAGEID_ITEM_STATE_IDLE, "" );
		Item.SendMessage ( PersistantItemStateMessage );
		
		if ( UI != null )
			UI.SendMessage ( new AddInventoryUIItemMessage ( Item, "" ) );
		
	};
	
	private function OnItemRemove ( Message:InventoryItemRemoveMessage ) : Void
	{
		
		var Item:IInventoryItem = Message.GetItem ();
		
		Items.remove ( Item );
		Node.RemoveMessageChild ( Item );
		
		if ( Item == SelectedItem )
			SelectedItem = null;
			
		PersistantItemStateMessage.Reset ( InventoryItemStateMessage.MESSAGEID_ITEM_STATE_REMOVED, "" );
		Item.SendMessage ( PersistantItemStateMessage );
		
		if ( UI != null )
			UI.SendMessage ( new RemoveInventoryUIItemMessage ( Item, "" ) );
		
	};
 	
 	private function OnItemSelect ( Message:InventoryItemSelectMessage ) : Void
 	{
 		
 		if ( SelectedItem != null )
 		{
 			
 			if ( SelectedItem == HoveredItem )
 				PersistantItemStateMessage.Reset ( InventoryItemStateMessage.MESSAGEID_ITEM_STATE_HOVER, "" );
 			else
 				PersistantItemStateMessage.Reset ( InventoryItemStateMessage.MESSAGEID_ITEM_STATE_IDLE, "" );
 			
 			SelectedItem.SendMessage ( PersistantItemStateMessage );
 			
 		}
 		
 		var Item:IInventoryItem = Message.GetItem ();
 		
 		if ( SelectedItem == Item )
 		{
 			
 			SelectedItem = null;
 			
 			return;
 			
 		}
 		
 		SelectedItem = Item;
 		
 		PersistantItemStateMessage.Reset ( InventoryItemStateMessage.MESSAGEID_ITEM_STATE_SELECTED, "" );
 		SelectedItem.SendMessage ( PersistantItemStateMessage );
 		
 	};
 	
 	private function OnItemHover ( Message:InventoryItemHoverMessage ) : Void
 	{
 		
 		if ( HoveredItem != null )
 		{
 			
 			if ( HoveredItem != SelectedItem )
 			{
 				
 				PersistantItemStateMessage.Reset ( InventoryItemStateMessage.MESSAGEID_ITEM_STATE_IDLE, "" );
 				SelectedItem.SendMessage ( PersistantItemStateMessage );
 				
 			}
 			
 		}
 		
 		HoveredItem = Message.GetItem ();
 		
 		if ( HoveredItem != SelectedItem )
 		{
 			
 			PersistantItemStateMessage.Reset ( InventoryItemStateMessage.MESSAGEID_ITEM_STATE_HOVER, "" );
 			HoveredItem.SendMessage ( PersistantItemStateMessage );
 			
 		}
 		
 	};
 	
}
