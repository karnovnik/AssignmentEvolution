package
{
	import flash.display.DisplayObjectContainer;
	
	import commands.RemoveImageCommand;
	import commands.StartUpLoadCommand;
	
	import events.GalleryEvent;
	
	import models.Model;
	
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Context;
	
	import services.IInitModelService;
	import services.ILoadImageService;
	import services.InitModelService;
	import services.LoadImageService;
	
	import views.MainView;
	import views.MainViewMediator;
	
	public class GalleryContext extends Context
	{
		public function GalleryContext(contextView:DisplayObjectContainer)
		{
			super(contextView);
		}
		
		override public function startup():void
		{
			injector.mapSingleton(Model);
			
			injector.mapSingletonOf(IInitModelService, InitModelService);
			injector.mapSingletonOf(ILoadImageService, LoadImageService);
			
			commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, StartUpLoadCommand, null, true);
			commandMap.mapEvent(GalleryEvent.IMAGE_TRY_TO_REMOVE, RemoveImageCommand, GalleryEvent);
			
			mediatorMap.mapView(MainView, MainViewMediator);
						
			contextView.addChild(new MainView());
			
			super.startup();
		}
	}
}