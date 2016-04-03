package neato.game.model;

import neato.api.game.IGameModel;
import neato.core.debug.Debug;

/**
 * ...
 */
class GameModel implements IGameModel
{
	/**
	 * Constructor.
	 */
	public function new() 
	{
		trace("Created.");
	}
	
	/**
	 * Destructor.
	 */
	public function destroy() 
	{
		trace("Destroyed.");
	}
	
	
	
	// ACCESSORS
	//============================================================================================================
	
	public var gameSize(default, default):String;
}