package neato.api.game;

import neato.api.core.application.IApplication;
import neato.api.core.display.IContainer;
import neato.api.core.display.IDisplayObject;
import neato.api.game.IGameView;
import neato.core.display.Container;
import neato.core.dom.DOMBuilder;
import neato.core.mvc.ViewComponent;
import neato.core.types.DynamicExt;
import neato.core.types.NativeDisplayTypes;

/**
 */
interface IGameView extends IContainer
{
	public var application(default, default):IApplication;
	public var nativeStage(default, null):NativeContainer;
	public var domBuilder(default, default):DOMBuilder;
	
	public function buildScene(name:String):Void;
	public function showScene(name:String):Void;
	public function hideScene(name:String):Void;
	public function getScene(scene:String):ViewComponent;
}