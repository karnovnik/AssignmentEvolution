package commands
{
	import events.GalleryEvent;
	
	import factory.IImage;
	
	import models.Model;
	
	import org.robotlegs.mvcs.Command;
	
	import services.ILoadImageService;
	
	public class RemoveImageCommand extends Command
	{
		[Inject]
		public var model:Model;
		
		[Inject]
		public var event:GalleryEvent;
		
		[Inject]
		public var loadImageService:ILoadImageService;

		private var iImage:IImage;
		
		public function RemoveImageCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			iImage = event.iImage;
			iImage.remove(fadeCompleteCallback);
		}
		
		private function fadeCompleteCallback():void
		{
			model.removeImage(iImage);
			iImage = null;
			
			loadImageService.loadImages(model.getImagesList(), onImagesLoaded);
		}
		
		private function onImagesLoaded(data:Vector.<IImage>):void
		{
			model.setImages(data);
		}
	}
}