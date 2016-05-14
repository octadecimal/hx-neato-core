package neato.poker.controller.actions.net;

import haxe.Http;
import haxe.Json;
import neato.api.game.IGame;
import neato.core.actions.Action;
import neato.core.integration.RequestVO;
import neato.core.integration.ResponseVO;
import neato.core.types.DynamicExt;

/**
 * ...
 */
class ASendPokerHandshakeRequest extends Action
{
	override public function execute():Void 
	{
		var request:RequestVO = new RequestVO();
		
		request.params.set("id", "1");
		request.params.set("action", "0");
		
		_game.controller.integration.sendRequest(request);
		
		complete();
	}
}