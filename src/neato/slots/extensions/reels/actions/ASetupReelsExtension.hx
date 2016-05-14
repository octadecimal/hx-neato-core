package neato.slots.extensions.reels.actions;

import neato.api.game.IGame;
import neato.core.actions.Action;
import neato.core.types.DynamicExt;
import neato.slots.extensions.reels.ReelsExtension;
import neato.template.extensions.ExtensionNames_template;

/**
 * ...
 */
class ASetupReelsExtension extends Action
{
	override public function execute():Void 
	{
		var extension:ReelsExtension = cast _game.extensions.get(SlotsExtensions.REELS);
	}
}