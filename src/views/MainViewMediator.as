package views
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import events.GalleryEvent;
	
	import factory.IImage;
	
	import models.Model;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class MainViewMediator extends Mediator
	{
		[Inject]
		public var model:Model;
		
		[Inject]
		public var view:MainView;
		
		private var images:Vector.<IImage>;
				
		public function MainViewMediator()
		{
		}
		
		public override function onRegister():void
		{
			model.updateSignal.add( onModelUpdate );
			eventMap.mapListener(view.stage, MouseEvent.CLICK, onClick);
		}

		protected function onClick(event:MouseEvent):void
		{
			for (var i:int = 0; i < images.length; i++) 
			{
				var iimage:IImage = images[i];
				
				if (iimage.image == event.target)
				{
					dispatch(new GalleryEvent(GalleryEvent.IMAGE_TRY_TO_REMOVE, iimage));
					break;
				}
			}
		}
		
		protected function onModelUpdate():void
		{
			images = model.getImages();
			view.show( images );
		}
	}
}