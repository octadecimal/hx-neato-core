package neato.game.controller.actions.scenes;

import neato.api.game.IGame;
import neato.game.controller.actions.Action;
import neato.core.types.DynamicExt;

/**
 * ...
 */
class AShowScene extends Action
{
	override public function execute():Void 
	{
		_game.view.showScene(_params);
		
		complete();
	}
}