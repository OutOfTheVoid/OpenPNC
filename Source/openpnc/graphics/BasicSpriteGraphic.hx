package openpnc.graphics;

import openpnc.graphics.IGraphic;

import openpnc.graphics.messages.VisibleMessage;

import openpnc.messaging.IMessage;
import openpnc.messaging.MessageSwitch;

import openfl.display.Sprite;

class BasicSpriteGraphic implements IGraphic
{
	
	private var Graphic:Sprite;
	
	private var Switch:MessageSwitch;
	private var Name:String;
	
	public function new ( Graphic:Sprite, Name:String )
	{
		
		this.Graphic = Graphic;
		this.Name = Name;
		
		Switch = new MessageSwitch ();
		
		Switch.SetSwitch ( VisibleMessage.MESSAGEID_MAKE_VISIBLE, OnMakeVisible, VisibleMessage );
		Switch.SetSwitch ( VisibleMessage.MESSAGEID_MAKE_INVISIBLE, OnMakeInvisible, VisibleMessage );
		
	};
	
	public function GetSprite () : Sprite
	{
		
		return Graphic;
		
	};
	
	public function GetName () : String
	{
		
		return Name;
		
	};
	
	public function SendMessage ( Message:IMessage ) : Void
	{
		
		Switch.SendMessage ( Message );
		
	};
	
	public function GetX () : Float
	{
		
		return Graphic.x;
		
	};
	
	public function GetY () : Float
	{
		
		return Graphic.y;
		
	};
	
	public function SetX ( X:Float ) : Float
	{
		
		return Graphic.x = X;
		
	};
	
	public function SetY ( Y:Float ) : Float
	{
		
		return Graphic.y = Y;
		
	};
	
	private function OnMakeVisible ( Message:IMessage ) : Void
	{
		
		Graphic.visible = true;
		
	};
	
	private function OnMakeInvisible ( Message:IMessage ) : Void
	{
		
		Graphic.visible = false;
		
	};
	
}
