package neato.core.actions;

import neato.api.core.actions.IActionQueue;
import neato.api.game.IGame;
import neato.game.Game;

/**
 * ...
 */
class ActionQueue implements IActionQueue
{
	private var _queue:Array<Action>;
	private var _game:IGame;
	
	/**
	 * Constructor.
	 */
	public function new() 
	{
		// Create queue
		_queue = [];
	}
	
	/**
	 * Destructor.
	 */
	public function destroy():Void
	{
		for (action in _queue)
		{
			action.destroy();
		}
		
		_queue = null;
		_game = null;
	}
	
	
	
	// API
	//============================================================================================================
	
	public function add(actionDefinition:Class<Dynamic>, ?params:Dynamic = null):Void
	{
		// Get privileged access to static game reference
		if (_game == null)
		{
			_game = Game.getInstance(this);
		}
		
		// Instantiate action
		var instance:Action = Type.createInstance(actionDefinition, [_game, onActionComplete, params]);
		_queue.push(instance);
	}
	
	public function execute():Void
	{
		executeNext();
	}
	
	
	
	// PRIVATE
	//============================================================================================================
	
	private function executeNext():Void
	{
		if (_queue.length > 0)
		{
			var nextAction:Action = _queue.shift();
			trace("Executing: " + nextAction);
			nextAction.isRunning = true;
			nextAction.execute();
		}
		else
		{
			trace("Queue complete!");
		}
	}
	
	
	
	// HANDLERS
	//============================================================================================================
	
	private function onActionComplete(action:Action, success:Bool):Void
	{
		action.destroy();
		executeNext();
	}
}