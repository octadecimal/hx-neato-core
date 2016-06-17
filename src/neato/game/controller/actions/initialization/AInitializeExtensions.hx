package neato.game.controller.actions.initialization;

import neato.api.game.extensions.IExtension;
import neato.api.game.IGame;
import neato.api.game.extensions.IExtensionsManager;
import neato.game.controller.actions.Action;
import neato.core.types.DynamicExt;

/**
 * ...
 */
class AInitializeExtensions extends Action
{
	override public function execute():Void 
	{
		var extensions:Array<IExtension> = _game.extensions.getAllExtensions();
		
		for (extension in extensions)
		{
			extension.initialize(_game.model, _game.view, _game.skin, _game.notifications);
		}
		
		complete();
	}
}