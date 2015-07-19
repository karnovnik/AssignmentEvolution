package commands
{
	import factory.IImage;
	
	import models.Model;
	
	import org.robotlegs.mvcs.Command;
	
	import services.IInitModelService;
	import services.ILoadImageService;
	
	public class StartUpLoadCommand extends Command
	{
		[Inject]
		public var model:Model;
		
		[Inject]
		public var loadImageNamesService:IInitModelService;
		
		[Inject]
		public var loadImageService:ILoadImageService;
		
		public function StartUpLoadCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			loadImageNamesService.loadImageNamesList(listLoadedCallback);
		}
		
		private function listLoadedCallback(data:String):void
		{
			model.setImageNames(data);
			loadImageService.loadImages(model.getImagesList(), imagesLoadedCallback);
		}
		
		private function imagesLoadedCallback(data:Vector.<IImage>):void
		{
			model.setImages(data);
		}
	}
}