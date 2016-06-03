package neato.api.core.mvc;
import neato.api.core.IDestroyable;

/**
 * ...
 */
interface IModel implements IDestroyable
{
	public function toString():String;
	public function reset():Void;
}