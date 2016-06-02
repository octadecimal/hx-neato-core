package neato.game.controller.actions.scenes;

import neato.core.actions.Action;

/**
 * ...
 */
class ABuildScene extends Action
{
	override public function execute():Void 
	{
		_game.view.buildScene(_params);
		
		complete();
	}
}