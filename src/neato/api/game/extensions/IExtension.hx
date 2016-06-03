package neato.api.game.extensions;

import neato.api.core.IDestroyable;
import neato.api.game.notifications.INotificationManager;
import neato.api.game.IGameModel;
import neato.api.game.IGameSkin;
import neato.api.game.IGameView;

/**
 * ...
 */
interface IExtension extends IDestroyable
{
	public function toString():String;
	public function initialize(gameModel:IGameModel, gameView:IGameView, gameSkin:IGameSkin, notifications:INotificationManager):Void;
	public function start():Void;
}