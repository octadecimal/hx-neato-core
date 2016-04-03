package neato.api.game;
import neato.api.core.IDestroyable;

/**
 */
interface IGameModel extends IDestroyable
{
	var gameSize(default, default):String;
}