package neato.template.controller.actions;

import neato.api.game.IGame;
import neato.core.actions.Action;
import neato.core.display.Sprite;
import neato.core.types.NativeDisplayTypes;

/**
 * ...
 */
class ASpriteTest extends Action
{
	override public function execute():Void 
	{
		// Testing
		var texture:NativeTexture = _game.controller.loading.getTexture("loading-logo.png");
		var sprite:Sprite = new Sprite(texture);
		
		_game.view.addChild(sprite);
		
		_game.view.application.width = 200;
		
		trace(_game.view.application.width);
	}
}