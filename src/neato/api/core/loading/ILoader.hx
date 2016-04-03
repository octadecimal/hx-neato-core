package neato.api.core.loading;

import msignal.Signal.Signal2;

/**
 * 
 */
interface ILoader 
{
	public var sigSuccess(default, null):Signal2<ILoader, Dynamic>;
	public var sigError(default, null):Signal2<ILoader, Dynamic>;
	public var data(default, null):Dynamic;
	
	public function load(url:String):Void;
}