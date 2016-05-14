package neato.game.controller.actions.loading;
import neato.core.actions.Action;

/**
 * ...
 */
class ALoadRequiredContexts extends Action
{
	override public function execute():Void 
	{
		_game.controller.loading.sigComplete.addOnce(complete);
		_game.controller.loading.loadRequiredContexts();
	}
}