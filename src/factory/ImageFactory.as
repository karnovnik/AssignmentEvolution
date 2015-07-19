package factory
{
	import flash.display.Bitmap;
	

	public class ImageFactory
	{
		// in fact this factory seems unnecessary, but it allows to save services from certain IImage implementation
		public static function Create(bitmap:Bitmap):IImage 
		{
			return new Image(bitmap);
		}
	}
}