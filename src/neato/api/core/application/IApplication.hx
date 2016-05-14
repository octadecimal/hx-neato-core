package neato.api.core.application;

import msignal.Signal;
import neato.api.game.IGameView;
import neato.game.view.GameView;

/**
 * ...
 */
interface IApplication 
{
	public var sigReady(default, null):Signal0;
	
	public var backgroundColor(default, default):Int;
	public var width(default, default):Float;
	public var height(default, default):Float;
	
	public function initialize():Void;
	public function setGameView(gameView:GameView):Void;
}