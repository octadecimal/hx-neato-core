package neato.template.controller;

import neato.core.actions.Action;
import neato.core.actions.ActionQueue;
import neato.game.controller.ActionsController;
import neato.game.controller.actions.initialization.ADetermineGameSize;
import neato.game.controller.actions.initialization.ALoadAssetMap;
import neato.game.controller.actions.loading.ALoadRequiredContexts;
import neato.game.controller.actions.loading.ARequireContext;
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
		
		// Get game size (asset prefix)
		_actionQueue.add(ADetermineGameSize);
		
		// Load asset map
		_actionQueue.add(ALoadAssetMap);
		
		// Require default context
		_actionQueue.add(ARequireContext, "default");
		_actionQueue.add(ALoadRequiredContexts);
		
		// Require loading context
		_actionQueue.add(ARequireContext, "loading");
		_actionQueue.add(ALoadRequiredContexts);
		
		_actionQueue.execute();
	}
}