package neato.poker.controller.actions.net;

import neato.api.game.IGame;
import neato.game.controller.actions.Action;
import neato.core.integration.RequestVO;
import neato.core.types.DynamicExt;
import neato.poker.extensions.PokerExtensions;
import neato.poker.extensions.hand.PokerHandExtension;
import neato.poker.model.PokerStates;

/**
 * ...
 */
class ASendPokerDealRequest extends Action
{
	override public function execute():Void 
	{
		var hand:PokerHandExtension = cast _game.extensions.get(PokerExtensions.POKER_HAND);
		
		var request:RequestVO = new RequestVO();
		var action:String = "";
		
		// Determine action (deal or draw)
		if (_game.model.gameState == "0")
		{
			action = "1";
		}
		else if(_game.model.gameState == "1")
		{
			action = "2";
		}
		
		// Get held cards
		var heldCards:Array<Int> = hand.getHeldCards();
		
		// Form string
		var hold:String = "";
		for (heldCard in heldCards)
		{
			hold += heldCard + ",";
		}
		hold = hold.substr(0, hold.length - 1);
		
		// Set params
		request.params.set("id", "1");
		request.params.set("action", Std.string(action));
		request.params.set("hold", hold);
		
		// Send request
		_game.controller.integration.sendRequest(request);
		
		complete();
	}
}