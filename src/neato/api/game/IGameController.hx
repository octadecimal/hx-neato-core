package neato.api.game;

import neato.api.core.mvc.IController;
import neato.api.core.IDestroyable;
import neato.api.game.controller.IActionsController;
import neato.api.game.controller.ILoadingController;

/**
 * 
 */
interface IGameController extends IController
{
	public var actions(default, null):IActionsController;
	public var loading(default, null):ILoadingController;
	
	public function initialize():Void;
}