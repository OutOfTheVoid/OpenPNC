package openpnc.graphics.messages;

import openpnc.messaging.Message;

class AnimationValueMessage extends Message
{
	
	public static inline var MESSAGEID_ANIMATION_VALUE_MESSAGE:String = "anim_value";
	
	private var ValueName:String;
	private var Value:Float;
	
	public function new ( ValueName:String, Value:Float, Target:String )
	{
		
		super ( MESSAGEID_ANIMATION_VALUE_MESSAGE, Target );
		
		this.ValueName = ValueName;
		this.Value = Value;
		
	};
	
	public function SetValue ( Value:Float ) : Void
	{
		
		this.Value = Value;
		
	};
	
	public function SetValueName ( Value:Float ) : Void
	{
		
		this.Value = Value;
		
	};
	
	public function ResetAnimationValueMessage ( ValueName:String, Value:Float, Target:String ) : Void
	{
		
		ResetMessage ( MESSAGEID_ANIMATION_VALUE_MESSAGE, Target );
		
		this.ValueName = ValueName;
		this.Value = Value;
		
	};
	
	public function GetValueName () : String
	{
		
		return ValueName;
		
	};
	
	public function GetValue () : Float
	{
		
		return Value;
		
	};
	
}

