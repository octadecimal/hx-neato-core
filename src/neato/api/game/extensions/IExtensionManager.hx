package neato.api.game.extensions;

import neato.api.core.IDestroyable;
import neato.api.core.extensions.IExtension;

/**
 * ...
 */
interface IExtensionManager extends IDestroyable
{
	public function register(name:String, definition:Class<Dynamic>):Void;
	public function get(name:String):IExtension;
	public function getAllExtensions():Array<IExtension>;
}