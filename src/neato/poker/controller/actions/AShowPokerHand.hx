package neato.poker.controller.actions;

import neato.api.game.IGame;
import neato.core.actions.Action;
import neato.core.types.DynamicExt;
import neato.poker.extensions.PokerExtensions;
import neato.poker.extensions.hand.PokerHandExtension;

/**
 * ...
 */
class AShowPokerHand extends Action
{
	override public function execute():Void 
	{
		var result:String = _params;
		
		var hand:PokerHandExtension = cast _game.extensions.get(PokerExtensions.POKER_HAND);
		
		hand.showResult(result.split(","));
		
		complete();
	}
	
	
}