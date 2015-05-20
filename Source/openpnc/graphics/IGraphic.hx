package openpnc.graphics;

import openpnc.messaging.IMessageTarget;

import openfl.display.Sprite;

interface IGraphic extends IMessageTarget
{
	
	public function GetSprite () : Sprite;
	
	public function GetX () : Float;
	public function SetX ( X:Float ) : Float;
	public function GetY () : Float;
	public function SetY ( Y:Float ) : Float;
	
}
