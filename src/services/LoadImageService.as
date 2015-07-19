package services
{
	import flash.display.Loader;
	import flash.events.Event;
	import flash.net.URLRequest;
	
	import factory.IImage;
	import factory.ImageFactory;
	
	import org.robotlegs.mvcs.Actor;
	
	public class LoadImageService extends Actor implements ILoadImageService
	{
		private var _totalLoadCount:int				= 0;
		private var _currentLoadCount:int			= 0;
		private var _outputImages:Vector.<IImage>	= null;
		private var _imagesCallback:Function		= null;
		
		public function LoadImageService()
		{
		}
		
		public function loadImages(imageList:Array, callback:Function):void
		{
			_outputImages = new Vector.<IImage>();
			_imagesCallback = callback;
			_totalLoadCount = imageList.length;
			_currentLoadCount = 0;
			
			for (var i:int = 0; i < imageList.length; i++) 
			{
				var path:String = imageList[i];
				loadImage(path);
			}
		}
			
		// these can use LoaderMax by GreenSocks, but I don`t like it, because it works longly, because at first getting weight of loading images 
		private function loadImage(path:String):void 
		{
			var loader:Loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadComplete);
			loader.load(new URLRequest(path));
		}
		
		protected function onLoadComplete(event:Event):void
		{
			_currentLoadCount++;
			_outputImages.push( ImageFactory.Create( event.target.content ));
			
			if ( _currentLoadCount == _totalLoadCount )
			{
				_imagesCallback.apply(null, [_outputImages]);
			}
		}
	}
}