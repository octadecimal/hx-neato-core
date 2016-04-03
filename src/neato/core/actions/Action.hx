package neato.core.actions;

import neato.api.game.IGame;
import neato.core.util.StringUtil;

/**
 * ...
 */
@:keepSub class Action
{
	// Game reference
	private var _game:IGame;
	
	// Callback for complete()
	private var _completeCallback:Action->Bool->Void;
	
	// Parameters
	private var _params:Dynamic;
	
	/**
	 * Constructor.
	 */
	public function new(game:IGame, completeCallback:Action->Bool->Void, ?params:Dynamic) 
	{
		isRunning = false;
		
		_game = game;
		_completeCallback = completeCallback;
		_params = params;
	}
	
	/**
	 * Destructor.
	 */
	public function destroy():Void 
	{
		_game = null;
		_completeCallback = null;
		_params = null;
	}
	
	/**
	 * ToString.
	 */
	public function toString():String 
	{ 
		return StringUtil.getClassName(this); 
		
	}
	
	
	
	// ACCESSORS
	//============================================================================================================
	
	public var isRunning(default, default):Bool;
	
	
	
	// API
	//============================================================================================================
	
	public function execute():Void
	{
		
	}
	
	public function complete(?success:Bool = true):Void
	{
		isRunning = false;
		_completeCallback(this, success);
	}
}