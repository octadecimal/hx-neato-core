package neato.template.controller;

import neato.api.game.IGameModel;
import neato.game.controller.actions.ActionQueue;
import neato.core.integration.ResponseVO;
import neato.game.controller.ActionsController;
import neato.game.controller.actions.initialization.ADetermineGameSize;
import neato.game.controller.actions.initialization.AInitializeApplication;
import neato.game.controller.actions.initialization.AInitializeExtensions;
import neato.game.controller.actions.initialization.ALoadAssetMap;
import neato.game.controller.actions.initialization.ALoadGlobalSettings;
import neato.game.controller.actions.initialization.AParseDOM;
import neato.game.controller.actions.initialization.AParseSettings;
import neato.game.controller.actions.initialization.AStartGame;
import neato.game.controller.actions.loading.ALoadRequiredContexts;
import neato.game.controller.actions.loading.ARequireContext;
import neato.game.controller.actions.scenes.ABuildScene;
import neato.game.controller.actions.scenes.AHideScene;
import neato.game.controller.actions.scenes.AShowScene;
import neato.game.controller.actions.state.ASetGameState;
import neato.game.controller.actions.util.ATimeoutAction;
import neato.game.model.GameStates;
import neato.poker.controller.actions.AClearPokerHand;
import neato.poker.controller.actions.ADisableButtons;
import neato.poker.controller.actions.AEnableButtons;
import neato.poker.controller.actions.ASetWinAmount;
import neato.poker.controller.actions.AShowPokerHand;
import neato.poker.controller.actions.net.AHandleHandshakeResponse;
import neato.poker.controller.actions.net.AHandlePokerDealResponse;
import neato.poker.controller.actions.net.ASendPokerDealRequest;
import neato.poker.controller.actions.net.ASendPokerHandshakeRequest;
import neato.poker.model.PokerStates;

/**
 * ...
 */
class ActionsController_template extends ActionsController
{
	private var _actionQueue:ActionQueue;
	
	/**
	 * Constructor.
	 */
	public function new(gameModel:IGameModel) 
	{
		super(gameModel);
		
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
		
		// Load core resources
		_actionQueue.add(ALoadGlobalSettings);
		_actionQueue.add(ALoadAssetMap);
		
		// Require default context
		_actionQueue.add(ARequireContext, "default");
		_actionQueue.add(ALoadRequiredContexts);
		
		// Parse settings
		_actionQueue.add(AParseSettings);
		
		// Initialize application
		_actionQueue.add(AInitializeApplication);
		
		// Parse game dom
		_actionQueue.add(AParseDOM);
		
		// Require loading context
		_actionQueue.add(ARequireContext, "loading");
		_actionQueue.add(ALoadRequiredContexts);
		
		// Show loading screen
		_actionQueue.add(ABuildScene, "scene-loading");
		_actionQueue.add(AShowScene, "scene-loading");
		
		// Require poker context
		_actionQueue.add(ARequireContext, "poker");
		_actionQueue.add(ALoadRequiredContexts);
		
		// Build main scene
		_actionQueue.add(ABuildScene, "scene-main");
		
		// Initialize extensions
		_actionQueue.add(AInitializeExtensions);
		
		// Initial state
		_actionQueue.add(ADisableButtons);
		
		// Send handshake request
		_actionQueue.add(ASendPokerHandshakeRequest);
		
		// Start game	-- now gets called by GameController on handshake received
		//_actionQueue.add(AStartGame);
		
		_actionQueue.execute();
	}
	
	
	
	// START GAME QUEUE
	//============================================================================================================
	
	override public function startGame(vo:ResponseVO):Void 
	{
		super.startGame(vo);
		
		_actionQueue.add(AHandleHandshakeResponse, vo);
		
		_actionQueue.add(AStartGame);
		
		_actionQueue.add(AShowScene, "scene-main");
		_actionQueue.add(AHideScene, "scene-loading");
		
		_actionQueue.add(AShowPokerHand, vo.result);
		
		_actionQueue.add(AEnableButtons);
		
		_actionQueue.execute();
	}
	
	
	
	// START ROUND QUEUE
	//============================================================================================================
	
	override public function startRound():Void 
	{
		super.startRound();
		
		_actionQueue.add(ASetWinAmount, 0);
		
		//_actionQueue.add(ASetGameState, GameStates.BUSY);
		_actionQueue.add(ADisableButtons);
		_actionQueue.add(AClearPokerHand);
		
		_actionQueue.add(ASendPokerDealRequest, 2);
		
		_actionQueue.execute();
	}
	
	
	
	// FINISH ROUND QUEUE
	//============================================================================================================
	
	override public function finishRound(vo:ResponseVO):Void 
	{
		super.finishRound(vo);
		
		_actionQueue.add(AHandlePokerDealResponse, vo);
		
		_actionQueue.add(ATimeoutAction, 200);
		_actionQueue.add(AShowPokerHand, vo.result);
		
		_actionQueue.add(ATimeoutAction, 500);
		
		if (vo.state == 0)
		{
			_actionQueue.add(ASetWinAmount, vo.winAmount);
		}
		
		_actionQueue.add(AEnableButtons);
		
		
		
		_actionQueue.execute();
	}
}