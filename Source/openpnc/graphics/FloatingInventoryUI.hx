package openpnc.graphics;

import openpnc.graphics.IInventoryUI;
import openpnc.graphics.IGraphic;

import openpnc.dynamics.IInventoryItem;

import openfl.display.Sprite;

class FloatingInventoryUI implements IInventoryUI
{
	
	private var Items:Array <IInventoryItem>;
	
	private var Graphic:Sprite;
	
	private var Name:String;
	
	private var ItemSpacing:Float;
	private var CenterOffset:Float;
	private var MouseTravel:Float;
	private var ItemY:Float;
	
	public function new ( Name:String )
	{
		
		Items = new Array <IInventoryItem> ();
		
		Graphic = new Sprite ();
		
		this.Name = Name;
		
		ItemSpacing = 25.0;
		CenterOffset = 250.0;
		MouseTravel = 10.0;
		
	};
	
	public function GetSprite () : Sprite
	{
		
		return Graphic;
		
	};
	
	public function GetX () : Float
	{
		
		return Graphic.x;
		
	};
	
	public function GetY () : Float
	{
		
		return Graphic.y;
		
	};
	
	public function GetName () : String
	{
		
		return Name;
		
	};
	
	public function Click ( LocalX:Float, LocalY:Float ) : Void
	{
		
		
		
	};
	
	public function Update () : Void
	{
		
		var I:UInt = 0;
		var Count:UInt = Items.length;
		
		var Item:IInventoryItem;
		var InvGraphic:IGraphic;
		
		while ( I < Count )
		{
			
			Item = Items [ I ];
			InvGraphic = Item.GetInventoryGraphic ();
			
			InvGraphic.x = CenterOffset + ( ( cast ( I, Float ) / cast ( Count, Float ) ) * 2.0 - 1.0 ) * ItemSpacing;
			InvGraphic.y = ItemY;
			
			
		}
		
	};
	
}
