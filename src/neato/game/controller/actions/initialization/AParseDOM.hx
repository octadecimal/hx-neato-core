package neato.game.controller.actions.initialization;
import neato.core.actions.Action;
import neato.core.dom.DOMBuilder;
import neato.core.types.DynamicExt;

/**
 * ...
 */
class AParseDOM extends Action
{
	override public function execute():Void 
	{
		// Get dom definitions
		var definitions:Map<String, String> = getDefinitionsMap();
		
		// Create dom builder
		var domBuilder:DOMBuilder = new DOMBuilder(definitions, _game.controller.loading.getTextureMap());
		
		// Parse dom
		domBuilder.parseDom(_game.controller.loading.getXml("dom.ntx"));
		
		// Pass dom builder to game view
		_game.view.domBuilder = domBuilder;
		
		complete();
	}
	
	private function getDefinitionsMap():Map<String, String>
	{
		var domDefinitions:DynamicExt = _game.model.settings.get("dom-definitions");
		var definitionMap:Map<String, String> = new Map<String, String>();
		
		for (definition in domDefinitions.keys())
		{
			definitionMap.set(definition, domDefinitions.get(definition));
		}
		
		return definitionMap;
	}
}