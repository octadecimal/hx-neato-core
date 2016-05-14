package neato.api.game.controller;

import neato.api.core.mvc.IController;
import neato.core.integration.ResponseVO;

/**
 * 
 */
interface IActionsController extends IController
{
	public function initialize():Void;
	
	public function startGame(vo:ResponseVO):Void;
	
	public function startRound():Void;
	
	public function finishRound(vo:ResponseVO):Void;
}