package views
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	import factory.IImage;
	import factory.Image;

	public class MainView extends Sprite
	{
		private var _titleX:Number		= 20;
		private var _titleY:Number		= 10;
		
		private var _hGap:Number		= 12;
		private var _vGap:Number		= 12;
				
		private var _imagelayer:Sprite	= new Sprite();

		public function MainView()
		{
			var title:TextField = new TextField();
			title.text = "Gallery of Riga";
			title.setTextFormat(new TextFormat(null, 16, 0x000000));
			title.autoSize = TextFieldAutoSize.LEFT;
			title.x = _titleX;
			title.y = _titleY;
			addChild(title);
			
			_imagelayer = new Sprite();
			_imagelayer.y = _titleY + title.height;
			addChild(_imagelayer);
		}
			
		public function show(images:Vector.<IImage>):void
		{
			_imagelayer.removeChildren();
			
			var currentX:Number = _hGap;
			var currentY:Number = _vGap;
						
			for (var i:int = 0; i < images.length; i++) 
			{
				var iimage:IImage = images[i];
					
				iimage.x = currentX;
				iimage.y = currentY;
				
				_imagelayer.addChild(iimage.image);
								
				currentX += Image.FULL_IMAGE_WIDTH + _hGap;
				
				if ( (currentX + _hGap) > stage.stageWidth )
				{
					currentX = _hGap;
					currentY += Image.FULL_IMAGE_HEIGHT + _vGap;
				}
			}
		}
	}
}