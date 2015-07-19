package models
{
	import factory.IImage;
	
	import org.osflash.signals.Signal;
	import org.robotlegs.mvcs.Actor;

	public class Model extends Actor
	{
		private const START_IMAGE_COUNT:int		= 9;
		
		public var updateSignal:Signal			= new Signal();
		
		private var _images:Vector.<IImage>		= null;
		private var _imageNames:Array			= [];
			
		public function Model()
		{
			_images = new Vector.<IImage>();
		}
		
		public function setImageNames(list:String):void
		{
			_imageNames = JSON.parse(list) as Array;
		}
		
		public function getImagesList():Array
		{
			var returnArray:Array = [];
			var num:int = ( _images.length == 0 ? START_IMAGE_COUNT : _images.length + 1 );
			
			if (_imageNames.length == _images.length + 1)
				return [];
				
			for (var i:int = _images.length; i < num; i++) 
			{
				returnArray.push(_imageNames[i]);
			}
						
			return returnArray;
		}
		
		public function getImages():Vector.<IImage>
		{
			return _images;
		}
		
		public function setImages(value:Vector.<IImage>):void
		{
			for (var i:int = 0; i < value.length; i++) 
			{
				_images.push(value[i]);
			}
			
			updateSignal.dispatch();
		}
		
		public function removeImageAt(index:int):void
		{
			_images.splice(index, 1);
			_imageNames.splice(index, 1);
		}
		
		public function removeImage(image:IImage):void
		{
			var index:int = _images.indexOf(image);
			_images.splice(index, 1);
			_imageNames.splice(index, 1);
		}
	}
}