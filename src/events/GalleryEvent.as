package events
{
	import flash.events.Event;
	
	import factory.IImage;
	
	public class GalleryEvent extends Event
	{
		public static const IMAGE_TRY_TO_REMOVE:String 	= "IMAGE_TRY_TO_REMOVE";
				
		private var _iImage:IImage;
				
		public function GalleryEvent(type:String, iImage:IImage = null)
		{
			_iImage = iImage;
			super(type);
		}
		
		public function get iImage():IImage
		{
			return _iImage;
		}
		
		public override function clone():Event
		{
			return new GalleryEvent(type, _iImage);
		}
	}
}