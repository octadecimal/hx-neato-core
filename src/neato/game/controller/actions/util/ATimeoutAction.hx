package neato.game.controller.actions.util;

import haxe.Timer;
import neato.api.game.IGame;
import neato.game.controller.actions.Action;
import neato.core.types.DynamicExt;

/**
 * ...
 */
class ATimeoutAction extends Action
{
	override public function execute():Void 
	{
		Timer.delay(complete, _params);
	}
}