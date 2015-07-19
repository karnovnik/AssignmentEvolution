package services
{
	import org.robotlegs.mvcs.Actor;
	
	public class InitModelService extends Actor implements IInitModelService
	{
		private const PATH:String 		= "http://109.234.155.186/images/";
		private const NAME_PREF:String 	= "image";
		private const FILE_RES:String 	= ".jpg";
		private const TOTAL_IMAGES:int 	= 48;
		
		public function InitModelService()
		{
		}
		
		public function loadImageNamesList(callback:Function):void
		{
			var _imageNames:Array = [];
			for (var i:int = 0; i < TOTAL_IMAGES; i++) 
			{
				_imageNames.push( PATH + NAME_PREF + (i+1) + FILE_RES );
			}
			
			callback.apply(null, [ JSON.stringify(_imageNames) ]);
		}
		
	}
}