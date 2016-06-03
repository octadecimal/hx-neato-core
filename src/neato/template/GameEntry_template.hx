package neato.template;

import neato.core.debug.Debug;
import neato.core.debug.targets.TraceTarget;
import neato.game.GameEntry;
import neato.game.model.vo.GameConfigurationVO;
import neato.poker.extensions.PokerExtensions;
import neato.poker.extensions.hand.PokerHandExtension;
import neato.poker.view.GameSkin_poker;
import neato.slots.extensions.SlotsExtensions;
import neato.slots.extensions.reels.ReelsExtension;
import neato.template.controller.ActionsController_template;
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
		
		var config:GameConfigurationVO = new GameConfigurationVO();
		
		config.model = GameModel_template;
		config.controller = GameController_template;
		config.view = GameView_template;
		config.skin = GameSkin_poker;
		
		config.actions = ActionsController_template;
		
		config.extension(PokerExtensions.POKER_HAND, PokerHandExtension);
		config.extension(SlotsExtensions.REELS, ReelsExtension);
		config.extension(ExtensionNames_template.BIG_WIN, EBigWin);
		
		createGameFromConfiguration(config);
	}
}