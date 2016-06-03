package neato.game.controller.actions.initialization;

import neato.api.game.IGame;
import neato.game.controller.actions.Action;
import neato.core.types.DynamicExt;

/**
 * ...
 */
class AStartGame extends Action
{
	override public function execute():Void 
	{
		_game.start();
		
		complete();
	}
}