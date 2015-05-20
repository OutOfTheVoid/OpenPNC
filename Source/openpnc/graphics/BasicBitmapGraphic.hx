package openpnc.graphics;

import openfl.display.BitmapData;
import openfl.display.Bitmap;
import openfl.display.Sprite;

import openpnc.graphics.IGraphic;

class BasicBitmapGraphic implements IGraphic
{
	
	private var BGraphic:Bitmap;
	private var Graphic:Sprite;
	
	private var Switch:MessageSwitch;
	private var Name:String;
	
	public function new ( Data:BitmapData )
	{
		
		Graphic = new Sprite ();
		BGraphic = new Bitmap ( Data );
		Graphic.addChild ( BGraphic );
		
		this.Name = Name;
		
		Switch = new MessageSwitch ();
		
		Switch.SetSwitch ( VisibleMessage.MESSAGEID_MAKE_VISIBLE, OnMakeVisible );
		Switch.SetSwitch ( VisibleMessage.MESSAGEID_MAKE_INVISIBLE, OnMakeInvisible );
		Switch.SetSwitch ( AnimationValueMessage.MESSAGEID_ANIMATION_VALUE_MESSAGE, OnAnimationValue, AnimationValueMessage );
		
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
	
	private function AnimationValueMessage ( Message:AnimationValueMessage ) : Void
	{
		
		switch ( Message.GetValueName () )
		{
		case "X":
			Graphic.x = Message.GetValue ();
			
		case "Y":
			Graphic.y = Message.GetValue ();
			
		}
		
	};
	
}
