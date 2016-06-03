package neato.game.controller.actions.initialization;
import neato.game.controller.actions.Action;
import neato.core.debug.Debug;

/**
 * ...
 */
class ADetermineGameSize extends Action
{
	override public function execute():Void 
	{
		_game.model.gameSize = "assets/desktop";
		
		Debug.output("Set game size: " + _game.model.gameSize);
		
		complete();
	}
}