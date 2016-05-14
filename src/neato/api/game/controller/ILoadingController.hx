package neato.api.game.controller;

import msignal.Signal;
import neato.api.core.mvc.IController;
import neato.api.core.IDestroyable;
import neato.core.types.NativeDisplayTypes;
import neato.core.types.DynamicExt;

/**
 */
interface ILoadingController extends IController
{
	public var sigComplete(default, null):Signal0;
	
	public function setAssetMap(data:Dynamic):Void;
	public function requireContext(context:String):Void;
	public function loadRequiredContexts():Void;
	
	public function getTexture(key:String):NativeTexture;
	public function getString(key:String):String;
	public function getXml(key:String):Xml;
	public function getJson(key:String):DynamicExt;
	
	public function getTextureMap():Map<String, NativeTexture>;
}