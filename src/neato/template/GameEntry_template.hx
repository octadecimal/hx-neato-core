package neato.template;

import haxe.Log;
import neato.api.game.IGameController;
import neato.api.game.IGameModel;
import neato.api.game.IGameSkin;
import neato.api.game.IGameView;
import neato.api.game.extensions.IExtensionManager;
import neato.core.debug.Debug;
import neato.core.debug.targets.TraceTarget;
import neato.game.GameEntry;
import neato.poker.extensions.PokerExtensions;
import neato.poker.extensions.hand.PokerHandExtension;
import neato.poker.view.GameSkin_poker;
import neato.slots.extensions.SlotsExtensions;
import neato.slots.extensions.reels.ReelsExtension;
import neato.template.controller.GameController_template;
import neato.template.extensions.ExtensionNames_template;
import neato.template.extensions.bigwin.EBigWin;
import neato.template.model.GameModel_template;
import neato.template.view.GameView_template;

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
		//Log.trace = Debug.output;
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
	
	override function getGameController(model:IGameModel, view:IGameView):IGameController 
	{
		return new GameController_template(model, view);
	}
	
	override public function getGameView():IGameView 
	{
		return new GameView_template();
	}
	
	override public function getGameSkin():IGameSkin 
	{
		return new GameSkin_poker();
	}
	
	override function registerExtensions(extensionManager:IExtensionManager):Void 
	{
		super.registerExtensions(extensionManager);
		
		extensionManager.register(PokerExtensions.POKER_HAND, PokerHandExtension);
		extensionManager.register(SlotsExtensions.REELS, ReelsExtension);
		extensionManager.register(ExtensionNames_template.BIG_WIN, EBigWin);
	}
}