package neato.template.controller;

import neato.core.actions.Action;
import neato.core.actions.ActionQueue;
import neato.game.controller.ActionsController;
import neato.template.controller.actions.ATestAction;

/**
 * ...
 */
class ActionsController_template extends ActionsController
{
	private var _actionQueue:ActionQueue;
	
	/**
	 * Constructor.
	 */
	public function new() 
	{
		super();
		
		_actionQueue = new ActionQueue();
	}
	
	/**
	 * Destructor.
	 */
	override public function destroy():Void 
	{
		super.destroy();
		
		_actionQueue.destroy();
		
		_actionQueue = null;
	}
	
	
	
	// INITIALIZATION QUEUE
	//============================================================================================================
	
	override public function initialize():Void 
	{
		super.initialize();
		
		_actionQueue.add(ATestAction);
		
		_actionQueue.execute();
	}
}