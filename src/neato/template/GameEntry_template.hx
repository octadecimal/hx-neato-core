package neato.template;

import haxe.Log;
import neato.api.game.IGameController;
import neato.api.game.IGameModel;
import neato.api.game.extensions.IExtensionManager;
import neato.core.debug.Debug;
import neato.core.debug.targets.TraceTarget;
import neato.game.GameEntry;
import neato.template.controller.GameController_template;
import neato.template.extensions.ExtensionNames_template;
import neato.template.extensions.bigwin.EBigWin;
import neato.template.model.GameModel_template;

/**
 * ...
 */
class GameEntry_template extends GameEntry
{
	/**
	 * Entry.
	 */
	public static function main():Void
	{
		// Configure debugger
		#if debug
		Log.trace = Debug.output;
		Debug.addTarget(new TraceTarget());
		#end
		
		// Create game
		new GameEntry_template();
	}
	
	/**
	 * Constructor.
	 */
	public function new() 
	{
		super();
	}
	
	/**
	 * Destructor.
	 */
	override public function destroy() 
	{
		super.destroy();
	}
	
	
	// CONFIGURATION
	//============================================================================================================
	
	override function getGameModel():IGameModel 
	{
		return new GameModel_template();
	}
	
	override function getGameController():IGameController 
	{
		return new GameController_template();
	}
	
	override function registerExtensions(extensionManager:IExtensionManager):Void 
	{
		super.registerExtensions(extensionManager);
		
		extensionManager.register(ExtensionNames_template.BIG_WIN, EBigWin);
	}
}