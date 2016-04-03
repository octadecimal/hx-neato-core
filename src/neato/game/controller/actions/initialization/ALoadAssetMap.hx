package neato.game.controller.actions.initialization;

import haxe.Json;
import neato.api.core.loading.ILoader;
import neato.core.actions.Action;
import neato.core.loading.StringLoader;

/**
 * ...
 */
class ALoadAssetMap extends Action
{
	override public function execute():Void 
	{
		var loader:StringLoader = new StringLoader();
		
		loader.sigSuccess.addOnce(onLoaded);
		loader.load(_game.model.gameSize + "/" + "asset-map.json");
	}
	
	private function onLoaded(loader:ILoader, data:Dynamic):Void
	{
		// Set asset map on loading controller
		_game.controller.loading.setAssetMap(Json.parse(data));
		
		complete();
	}
}