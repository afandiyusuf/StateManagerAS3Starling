package core 
{
	import starling.display.Stage;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author Yusuf Afandi
	 */
	public interface ICore 
	{
		function Init(stage:Stage):void
		function Update(e:Event):void
		function Destroy():void
	}
	
}