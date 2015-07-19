package factory
{
	import com.greensock.TweenLite;
	
	import flash.display.Bitmap;
	import flash.display.Shape;
	import flash.display.Sprite;
	
	public class Image implements IImage
	{
		public static var FULL_IMAGE_WIDTH:uint		= 250;
		public static var FULL_IMAGE_HEIGHT:uint	= 200;
		
		public static var PADDING:uint				= 5;
		
		public static var IMAGE_WIDTH:uint			= 250 - PADDING;
		public static var IMAGE_HEIGHT:uint			= 200 - PADDING;
		
		private const BORDER_COLOR:uint				= 0xF5DEB3;
		private const BORDER_ALPHA:Number			= .7;
		private const BACKGROUND_COLOR:uint			= 0xFFFAF0;
		private const BACKGROUND_ALPHA:Number		= .7;
		
		
		private var _image:Sprite = new Sprite();
		
		
		public function Image(bitmap:Bitmap)
		{
			createImage(bitmap);
		}
		
		private function createImage(bitmap:Bitmap):void
		{
			var background:Shape = new Shape();
			background.graphics.beginFill(BACKGROUND_COLOR, BACKGROUND_ALPHA);
			background.graphics.lineStyle(1, BORDER_COLOR, BORDER_ALPHA);
			background.graphics.drawRect(0, 0, FULL_IMAGE_WIDTH, FULL_IMAGE_HEIGHT);
			background.graphics.endFill();
			_image.addChild(background);
			
			if (bitmap.width > IMAGE_WIDTH || bitmap.height > IMAGE_HEIGHT)
			{
				var max:int = Math.max(bitmap.width, bitmap.height);
				var scale:Number = ( bitmap.width > bitmap.height ? IMAGE_WIDTH / max : IMAGE_HEIGHT / max );
				bitmap.scaleX = bitmap.scaleY = scale;
			}
			
			bitmap.x = ( FULL_IMAGE_WIDTH - bitmap.width ) * .5;
			bitmap.y = ( FULL_IMAGE_HEIGHT - bitmap.height ) * .5;
			_image.addChild(bitmap);
		}
		
		public function remove(fadeCompleteCallback:Function):void
		{
			TweenLite.to(_image, 1, {"alpha":0, "onComplete":fadeCompleteCallback});
		}
		
		public function set x(value:Number):void
		{
			_image.x = value;
		}
		
		public function set y(value:Number):void
		{
			_image.y = value;
		}
		
		public function get x():Number
		{
			return _image.x;
		}
		
		public function get y():Number
		{
			return _image.y;
		}
		
		public function get width():Number
		{
			return _image.width;
		}
		
		public function get height():Number
		{
			return _image.height;
		}
		
		public function set width(value:Number):void
		{
			_image.width = value;
		}
		
		public function set height(value:Number):void
		{
			_image.height = value;
		}
		
		public function get image():Sprite
		{
			return _image;
		}
		
	}
}