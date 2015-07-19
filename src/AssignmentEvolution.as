package
{
	import flash.display.Sprite;
	import flash.system.Security;
	
	[SWF(width="800", height="700")]
	public class AssignmentEvolution extends Sprite
	{
		protected var context:GalleryContext;
		
		public function AssignmentEvolution()
		{
			Security.allowDomain("*");
			
			context = new GalleryContext(this);
		}
	}
}