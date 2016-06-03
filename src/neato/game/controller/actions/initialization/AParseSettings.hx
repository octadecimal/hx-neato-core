package neato.game.controller.actions.initialization;

import neato.game.controller.actions.Action;
import neato.core.types.DynamicExt;

/**
 * ...
 */
class AParseSettings extends Action
{
	override public function execute():Void 
	{
		// Get local settings
		var localSettings:DynamicExt = _game.controller.loading.getJson("settings.json");
		
		// Override any first-level properties
		for (key in localSettings.keys())
		{
			_game.model.settings.set(key, localSettings.get(key));
		}
		
		complete();
	}
}