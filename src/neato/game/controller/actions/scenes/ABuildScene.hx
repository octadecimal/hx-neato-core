package neato.game.controller.actions.scenes;

import neato.game.controller.actions.Action;

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