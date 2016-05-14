package neato.core.loading.loaders;

import haxe.Http;
import msignal.Signal.Signal2;
import neato.api.core.loading.ILoader;

/**
 * ...
 */
class StringLoader implements ILoader
{
	public var sigSuccess(default, null):Signal2<ILoader, Dynamic>;
	public var sigError(default, null):Signal2<ILoader, Dynamic>;
	
	public var data(default, null):String;
	
	/**
	 * Constructor.
	 */
	public function new() 
	{
		sigSuccess = new Signal2();
		sigError = new Signal2();
	}
	
	/**
	 * Destructor.
	 */
	public function destroy():Void 
	{
		sigSuccess.removeAll();
		
		sigSuccess = null;
	}
	
	
	
	// API
	//============================================================================================================
	
	public function load(url:String):Void
	{
		trace("LOADING: " + url);
		
		var http:Http = new Http(url);
		
		http.onError = onError;
		http.onData = onSuccess;
		
		http.request(false);
	}
	
	
	
	// HANDLERS
	//============================================================================================================
	
	private function onSuccess(data:String):Void
	{
		sigSuccess.dispatch(this, data);
	}
	
	private function onError(error:String):Void
	{
		trace("Failed: " + error);
		sigError.dispatch(this, error);
	}
}