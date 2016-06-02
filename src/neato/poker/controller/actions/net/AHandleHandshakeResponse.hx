package neato.poker.controller.actions.net;

import neato.api.game.IGame;
import neato.game.controller.actions.Action;
import neato.core.integration.ResponseVO;
import neato.core.types.DynamicExt;

/**
 * ...
 */
class AHandleHandshakeResponse extends Action
{
	override public function execute():Void 
	{
		var vo:ResponseVO = _params;
		
		_game.model.gameState = Std.string(vo.state);
		
		complete();
	}
}