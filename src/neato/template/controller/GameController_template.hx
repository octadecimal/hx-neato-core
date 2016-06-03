package neato.template.controller;

import neato.api.game.IGameModel;
import neato.api.game.IGameView;
import neato.api.game.controller.IActionsController;
import neato.api.game.controller.IIntegrationController;
import neato.api.game.controller.ILoadingController;
import neato.api.game.controller.ISoundsController;
import neato.api.game.notifications.INotificationManager;
import neato.core.display.DisplayObject;
import neato.core.integration.ResponseVO;
import neato.game.controller.GameController;
import neato.poker.view.scenes.MainScene_poker;

/**
 * ...
 */
class GameController_template extends GameController
{
	private var _mainScene:MainScene_poker;
	
	/**
	 * Constructor.
	 */
	public function new(model:IGameModel, view:IGameView, notifications:INotificationManager, actions:IActionsController, loading:ILoadingController, integration:IIntegrationController, sounds:ISoundsController) 
	{
		super(model, view, notifications, actions, loading, integration, sounds);
		
		integration.sigResponseReceived.add(onIntegrationResponseReceived);
	}
	
	/**
	 * Destructor.
	 */
	override public function destroy():Void 
	{
		super.destroy();
	}
	
	
	
	// API
	//============================================================================================================
	
	override public function start():Void 
	{
		super.start();
		
		// Get reference to main scene
		_mainScene = cast _view.getScene("scene-main");
		
		// Button events
		_mainScene.btnDeal.sigClicked.add(onDealClicked);
	}
	
	
	
	// HANDLERS
	//============================================================================================================
	
	private function onIntegrationResponseReceived(response:ResponseVO):Void
	{
		// Handshake
		if (response.action == 0)
		{
			// Start game
			actions.startGame(response);
		}
		
		// Deal
		if (response.action == 1)
		{
			actions.finishRound(response);
		}
		
		// Draw
		if (response.action == 2)
		{
			actions.finishRound(response);
		}
	}
	
	private function onDealClicked(target:DisplayObject):Void
	{
		actions.startRound();
	}
}