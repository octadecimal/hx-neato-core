package neato.game.controller.actions.loading;

import neato.api.game.controller.ILoadingController;
import neato.core.actions.Action;

/**
 * ...
 */
class ARequireResource extends Action
{
	override public function execute():Void 
	{
		// Get loading controller
		var loadingController:ILoadingController = _game.controller.loading;
		
		complete();
	}
}