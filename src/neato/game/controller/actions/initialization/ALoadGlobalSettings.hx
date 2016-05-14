package neato.game.controller.actions.initialization;

import haxe.Json;
import neato.api.core.loading.ILoader;
import neato.api.game.IGame;
import neato.core.actions.Action;
import neato.core.loading.loaders.StringLoader;
import neato.core.types.DynamicExt;

/**
 * ...
 */
class ALoadGlobalSettings extends Action
{
	override public function execute():Void 
	{
		var loader:StringLoader = new StringLoader();
		
		loader.sigSuccess.addOnce(onLoaded);
		loader.load("assets/settings.json");
	}
	
	private function onLoaded(loader:ILoader, data:DynamicExt):Void
	{
		// Set on game model (later on, context-specific settings will be loaded
		// and will override any properties
		_game.model.settings = Json.parse(data);
		
		complete();
	}
}