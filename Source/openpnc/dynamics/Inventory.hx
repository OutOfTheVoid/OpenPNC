package openpnc.dynamics;

import openpnc.dynamics.IInventoryItem;

import openpnc.messaging.IMessageParent;
import openpnc.messaging.IMessageTarget;
import openpnc.messaging.MessageNode;
import openpnc.messaging.MessageSwitch;

import openpnc.graphics.IInventoryUI;

import openpnc.dynamics.messages.InventoryItemCollectMessage;

class Inventory implements IMessageParent
{
	
	private var Items:Array <IInventoryItem>;
	
	private var Node:MessageNode;
	private var Switch:MessageSwitch;
	
	private var UITarget:String;
	private var MessageTarget:IMessageTarget;
	
	private var SelectedItem:IInventoryItem;
	
	private var UI:IInventoryUI;
	
	public function new ( Name:String )
	{
		
		this.Name = Name;
		
		Items = new Array <IInventoryItem>;
		
		Switch = new MessageSwitch ();
		Node = new MessageNode ( Name, Switch );
		
		Switch.SetSwitch ( InventoryItemCollectMessage.MESSAGEID_ITEM_COLLECT, OnItemCollect, InventoryItemCollectMessage );
		Switch.SetSwitch ( InventoryItemRemoveMessage.MESSAGEID_ITEM_REMOVE, OnItemRemove, InventoryItemRemoveMessage );
		
		UITarget = "";
		MessageTarget = null;
		
		SelectedItem = null;
		
		UI = null;
		
	}
	
	public function SetUI ( UI:IInventoryUI ) : Void
	{
		
		this.UI = UI;
		
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
		
		
		
	};
 	
}
