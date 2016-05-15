package neato.core.application;

import msignal.Signal;
import neato.api.core.application.IApplication;
import neato.game.view.GameView;
import pixi.plugins.app.Application;
import js.Browser;

/**
 * ...
 */
class PixiApplication extends Application implements IApplication
{
	public var sigReady(default, null):Signal0;
	
	/**
	 * Constructor.
	 */
	public function new() 
	{
		sigReady = new Signal0();
		
		super();
	}
	
	/**
	 * Destructor.
	 */
	public function destroy():Void 
	{
		
	}
	
	
	
	// API
	//============================================================================================================
	
	public function initialize():Void
	{
		backgroundColor = 0x1481ae;
		
		start(null, Browser.window.document.getElementById("lobby-container"));
		
		sigReady.dispatch();
	}
	
	public function setGameView(gameView:GameView):Void
	{
		stage.addChild(gameView.nativeStage);
	}
}