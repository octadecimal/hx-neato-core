package neato.game.controller.actions.state;

import neato.api.game.IGame;
import neato.game.controller.actions.Action;
import neato.core.types.DynamicExt;

/**
 * ...
 */
class ASetGameState extends Action
{
	override public function execute():Void 
	{
		_game.model.gameState = _params;
		
		complete();
	}
}