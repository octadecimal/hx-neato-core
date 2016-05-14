package neato.game.model;

import neato.api.game.IGameModel;
import neato.core.debug.Debug;
import neato.core.types.DynamicExt;

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
		Debug.output("Created.");
	}
	
	/**
	 * Destructor.
	 */
	public function destroy() 
	{
		Debug.output("Destroyed.");
	}
	
	
	
	// ACCESSORS
	//============================================================================================================
	
	public var gameSize(default, default):String;
	
	public var settings(default, default):DynamicExt;
	
	public var gameState(default, default):String;
	
	public var coinSize(default, default):Int;
	
	public var winAmount(default, default):Int;
	
	public var winType(default, default):Int;
}