package neato.api.game;

import neato.api.game.IGameController;
import neato.api.game.IGameModel;
import neato.api.core.IDestroyable;
import neato.api.game.extensions.IExtensionManager;

/**
 */
interface IGame extends IDestroyable
{
	/**
	 * Game model.
	 */
	public var model(default, null):IGameModel;
	
	/**
	 * Game view.
	 */
	public var view(default, null):IGameView;
	
	/**
	 * Game skin.
	 */
	public var skin(default, null):IGameSkin;
	
	/**
	 * Game controller.
	 */
	public var controller(default, null):IGameController;
	
	/**
	 * Game extensions.
	 */
	public var extensions(default, null):IExtensionManager;
	
	
	/**
	 * Initialization routine.
	 */
	public function initialize():Void;
	
	/**
	 * Starts the game.
	 */
	public function start():Void;
}