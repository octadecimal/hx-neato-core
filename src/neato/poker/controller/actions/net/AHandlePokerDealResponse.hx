package neato.poker.controller.actions.net;

import neato.api.game.IGame;
import neato.core.actions.Action;
import neato.core.integration.ResponseVO;
import neato.core.types.DynamicExt;

/**
 * ...
 */
class AHandlePokerDealResponse extends Action
{
	override public function execute():Void 
	{
		var vo:ResponseVO = _params;
		
		_game.model.winAmount = vo.winAmount;
		_game.model.winType = Std.parseInt(vo.winType);
		_game.model.gameState = Std.string(vo.state);
		
		complete();
	}
}