package neato.template.controller.actions;
import neato.game.controller.actions.Action;
import neato.template.extensions.ExtensionNames_template;

/**
 * ...
 */
class ATestAction extends Action
{
	override public function execute():Void 
	{
		trace("Hey there!");
		
		trace("Oh cool, look at this controller: " + _game.controller.loading);
		
		trace("Oh, this is a neat extension: " + _game.extensions.get(ExtensionNames_template.BIG_WIN));
		
		complete();
	}
}