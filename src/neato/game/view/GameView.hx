package neato.game.view;

import neato.api.game.IGameView;
import neato.core.debug.Debug;
import neato.core.display.Sprite;

/**
 * ...
 */
class GameView extends Sprite implements IGameView
{
	/**
	 * Constructor.
	 */
	public function new() 
	{
		super();
		
		Debug.output("Created.");
	}
	
	/**
	 * Destructor.
	 */
	override public function destroy():Void
	{
		super.destroy();
		
		Debug.output("Destroyed.");
	}
}