package neato.core.debug.targets;

import neato.api.core.debug.IDebugTarget;

/**
 * ...
 */
class TraceTarget implements IDebugTarget
{

	public function new() 
	{
		
	}
	
	public function output(target:String, message:String):Void
	{
		trace(target + " " + message);
	}
	
}