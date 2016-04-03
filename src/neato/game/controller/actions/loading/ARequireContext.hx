package neato.game.controller.actions.loading;
import neato.core.actions.Action;

/**
 * ...
 */
class ARequireContext extends Action
{
	override public function execute():Void 
	{
		_game.controller.loading.requireContext(_params);
		
		complete();
	}
}