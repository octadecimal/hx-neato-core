package neato.api.game.controller;

import neato.api.core.mvc.IController;
import neato.api.core.IDestroyable;

/**
 */
interface ILoadingController extends IController
{
	public function setAssetMap(data:Dynamic):Void;
	public function requireContext(context:String):Void;
	public function loadRequiredContexts():Void;
}