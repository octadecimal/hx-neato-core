package neato.api.game;
import neato.api.core.IDestroyable;
import neato.core.types.DynamicExt;

/**
 */
interface IGameModel extends IDestroyable
{
	var gameSize(default, default):String;
	
	var settings(default, default):DynamicExt;
	
	var gameState(default, default):String;
	
	var winAmount(default, default):Int;
	
	var winType(default, default):Int;
}