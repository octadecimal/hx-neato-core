package neato.game.controller.actions.initialization;

import neato.api.core.application.IApplication;
import neato.core.actions.Action;
import neato.core.application.PixiApplication;

/**
 * ...
 */
class AInitializeApplication extends Action
{
	private var _application:IApplication;
	
	override public function execute():Void 
	{
		#if js
		_application = new PixiApplication();
		var scale:Float = _game.model.settings.get("window").get("scale");
		_application.width = _game.model.settings.get("window").get("width") * scale;
		_application.height = _game.model.settings.get("window").get("height") * scale;
		#end
		
		// Listen for application ready
		_application.sigReady.addOnce(onSigReady);
		
		// Initialize application
		_application.initialize();
	}
	
	private function onSigReady() 
	{
		// Set application reference on game view
		_game.view.application = _application;
		
		// Add game view to application stage
		_application.setGameView(cast _game.view);
		
		// Complete
		complete();
	}
}