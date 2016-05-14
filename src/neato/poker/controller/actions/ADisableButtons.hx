package neato.poker.controller.actions;

import neato.api.game.IGame;
import neato.core.actions.Action;
import neato.core.types.DynamicExt;
import neato.poker.view.scenes.MainScene_poker;

/**
 * ...
 */
class ADisableButtons extends Action
{
	override public function execute():Void 
	{
		var mainScene:MainScene_poker = cast _game.view.getScene("scene-main");
		
		mainScene.disableButtons();
		
		complete();
	}
}