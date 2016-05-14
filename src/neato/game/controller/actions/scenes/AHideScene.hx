package neato.game.controller.actions.scenes;

import neato.api.game.IGame;
import neato.core.actions.Action;
import neato.core.types.DynamicExt;

/**
 * ...
 */
class AHideScene extends Action
{
	override public function execute():Void 
	{
		_game.view.hideScene(_params);
		
		complete();
	}
}