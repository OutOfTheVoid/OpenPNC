package openpnc.graphics;

import openpnc.messaging.IMessageTarget;

import openfl.display.Sprite;

interface IGraphic extends IMessageTarget
{
	
	public function GetSprite () : Sprite;
	
	public function GetX () : Float;
	public function GetY () : Float;
	
}
