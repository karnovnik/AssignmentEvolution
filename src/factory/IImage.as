package factory
{
	import flash.display.Sprite;
	

	public interface IImage
	{
		function remove(fadeCompleteCallback:Function):void;
	
		function set x(value:Number):void;
		function set y(value:Number):void;
		
		function get width():Number;
		function get height():Number;
		
		function set width(value:Number):void;
		function set height(value:Number):void;
		
		function get image():Sprite;
	}
}