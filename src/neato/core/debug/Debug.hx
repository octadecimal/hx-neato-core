package neato.core.debug;

import haxe.Log;
import neato.api.core.debug.IDebugTarget;
import neato.core.util.StringUtil;

/**
 * ...
 */
class Debug
{
	// Registered debug targets
	private static var _targets:Array<IDebugTarget> = [];
	
	/**
	 * Adds a debug target for outputting.
	 * @param	target
	 */
	public static function addTarget(target:IDebugTarget):Void
	{
		#if debug
		_targets.push(target);
		Debug.output("Debug target added: " + StringUtil.getClassName(target));
		#end 
	}
	
	/**
	 * Outputs a debug message.
	 * @param	object		Calling object.
	 * @param	message		Debug message.
	 */
	public static inline function output(v:Dynamic, ?inf:haxe.PosInfos):Void
	{
		var message:String = StringUtil.prefix("["+inf.className.split(".").pop()+"]", 30) + " " + v;
		//var message:String = inf.className+"::" + inf.methodName+":"+inf.lineNumber+"\n" + v;
		
		#if flash
		flash.Lib.trace(message);
		#end
		
		#if js
		untyped __js__("console").log(message);
		#end
	}
	
	
}