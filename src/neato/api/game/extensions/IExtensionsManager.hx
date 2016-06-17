package neato.api.game.extensions;

import neato.api.core.IDestroyable;
import neato.api.game.extensions.IExtension;

/**
 * ...
 */
interface IExtensionsManager extends IDestroyable
{
	public function register(name:String, definition:Class<Dynamic>):Void;
	public function get(name:String):IExtension;
	public function getAllExtensions():Array<IExtension>;
}