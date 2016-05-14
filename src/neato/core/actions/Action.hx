package neato.core.actions;

import neato.api.game.IGame;
import neato.core.types.DynamicExt;
import neato.core.util.StringUtil;

/**
 * ...
 */
@:keepSub class Action
{
	// Game reference
	private var _game:IGame;
	
	// Callback for complete()
	private var _completeCallback:Action->Void;
	
	// Parameters
	private var _params:DynamicExt;
	
	/**
	 * Constructor.
	 */
	public function new(game:IGame, completeCallback:Action->Void, ?params:DynamicExt) 
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
	
	public function complete():Void
	{
		isRunning = false;
		_completeCallback(this);
	}
}