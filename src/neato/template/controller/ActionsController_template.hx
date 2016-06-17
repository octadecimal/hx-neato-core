package neato.template.controller;

import neato.api.game.IGameModel;
import neato.api.game.notifications.INotificationManager;
import neato.core.integration.ResponseVO;
import neato.game.controller.ActionsController;
import neato.game.controller.actions.initialization.AInitializeExtensions;
import neato.game.controller.actions.initialization.AStartGame;
import neato.game.controller.actions.loading.ALoadRequiredContexts;
import neato.game.controller.actions.loading.ARequireContext;
import neato.game.controller.actions.scenes.ABuildScene;
import neato.game.controller.actions.scenes.AHideScene;
import neato.game.controller.actions.scenes.AShowScene;
import neato.game.controller.actions.util.ATimeoutAction;
import neato.poker.controller.actions.AClearPokerHand;
import neato.poker.controller.actions.ADisableButtons;
import neato.poker.controller.actions.AEnableButtons;
import neato.poker.controller.actions.ASetWinAmount;
import neato.poker.controller.actions.AShowPokerHand;
import neato.poker.controller.actions.net.AHandleHandshakeResponse;
import neato.poker.controller.actions.net.AHandlePokerDealResponse;
import neato.poker.controller.actions.net.ASendPokerDealRequest;
import neato.poker.controller.actions.net.ASendPokerHandshakeRequest;

/**
 * ...
 */
class ActionsController_template extends ActionsController
{
	/**
	 * Constructor.
	 */
	public function new(notifications:INotificationManager, gameModel:IGameModel) 
	{
		super(notifications, gameModel);
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
		
		// Require loading context
		add(ARequireContext, "loading");
		add(ALoadRequiredContexts);
		
		// Show loading screen
		add(ABuildScene, "scene-loading");
		add(AShowScene, "scene-loading");
		
		// Require poker context
		add(ARequireContext, "poker");
		add(ALoadRequiredContexts);
		
		// Build main scene
		add(ABuildScene, "scene-main");
		
		// Initial state
		add(ADisableButtons);
		
		// Send handshake request
		add(ASendPokerHandshakeRequest);
		
		// Execute
		execute();
	}
	
	
	
	// START GAME QUEUE
	//============================================================================================================
	
	override public function startGame(vo:ResponseVO):Void 
	{
		super.startGame(vo);
		
		// Handle handshake
		add(AHandleHandshakeResponse, vo);
		
		// Start game
		add(AStartGame);
		
		// Show main scene
		add(AShowScene, "scene-main");
		add(AHideScene, "scene-loading");
		
		// Show initial poker hand
		add(AShowPokerHand, vo.result);
		
		// Enable buttons
		add(AEnableButtons);
		
		// Execute
		execute();
	}
	
	
	
	// START ROUND QUEUE
	//============================================================================================================
	
	override public function startRound():Void 
	{
		super.startRound();
		
		add(ASetWinAmount, 0);
		
		add(ADisableButtons);
		add(AClearPokerHand);
		
		add(ASendPokerDealRequest, 2);
		
		execute();
	}
	
	
	
	// FINISH ROUND QUEUE
	//============================================================================================================
	
	override public function finishRound(vo:ResponseVO):Void 
	{
		super.finishRound(vo);
		
		add(AHandlePokerDealResponse, vo);
		
		add(ATimeoutAction, 200);
		add(AShowPokerHand, vo.result);
		
		add(ATimeoutAction, 500);
		
		if (vo.state == 0)
		{
			add(ASetWinAmount, vo.winAmount);
		}
		
		add(AEnableButtons);
		
		
		
		execute();
	}
}