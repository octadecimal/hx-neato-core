package neato.core.extensions;

import neato.api.core.extensions.IExtension;
import neato.api.game.IGameModel;
import neato.api.game.IGameSkin;
import neato.api.game.IGameView;
import neato.core.debug.Debug;
import neato.core.util.StringUtil;

/**
 * ...
 */
class Extension implements IExtension
{
	// Game model reference, gets set via initialize method.
	private var _gameModel:IGameModel;
	
	// Game view reference, gets set via initialize method.
	private var _gameView:IGameView;
	
	// Game skin reference, gets set via initialize method.
	private var _gameSkin:IGameSkin;
	
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
	public function destroy():Void 
	{
		Debug.output("Destroyed.");
	}
	
	
	
	// API
	//============================================================================================================
	
	/**
	 * ToString.
	 */
	public function toString():String 
	{ 
		return StringUtil.getClassName(this); 
	}
	
	/**
	 * Initialization routine, allows for the AInitializeExtensions action to pass in references for this extension.
	 */
	public function initialize(gameModel:IGameModel, gameView:IGameView, gameSkin:IGameSkin):Void
	{
		_gameModel = gameModel;
		_gameView = gameView;
		_gameSkin = gameSkin;
	}
	
	/**
	 * Starts this extension.
	 */
	public function start():Void
	{
		
	}
}