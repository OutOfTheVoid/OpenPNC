package openpnc.messaging;

interface IMessage
{
	
	function GetID () : String;
	
	function GetTarget () : String;
	
}
