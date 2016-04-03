package neato.game.controller;

import haxe.Json;
import neato.api.core.IDestroyable;
import neato.api.game.controller.ILoadingController;
import neato.core.debug.Debug;
import neato.core.mvc.Controller;
import neato.core.util.DynamicExt;
import neato.core.util.StringUtil;

/**
 * ...
 */
class LoadingController extends Controller implements ILoadingController
{
	private var _assetMap:DynamicExt;
	private var _requiredContexts:Array<String>;
	
	/**
	 * Constructor.
	 */
	public function new() 
	{
		Debug.output("Creating...");
		
		super();
		
		_requiredContexts = [];
		
		Debug.output("Created.");
	}
	
	/**
	 * Destructor.
	 */
	override public function destroy():Void 
	{
		Debug.output("Destroying...");
		
		super.destroy();
		
		Debug.output("Destroyed.");
	}
	
	
	
	// API
	//============================================================================================================
	
	public function setAssetMap(assetMap:Dynamic):Void
	{
		_assetMap = assetMap;
		
		Debug.output("Asset map set.");
	}
	
	public function requireContext(context:String):Void
	{
		if (_requiredContexts.indexOf(context) == -1)
		{
			_requiredContexts.push(context);
			
			Debug.output("Context required: " + context);
		}
		else
		{
			Debug.output("Context already required: " + context);
		}
	}
	
	public function loadRequiredContexts():Void
	{
		for (requiredContext in _requiredContexts)
		{	
			Debug.output("Loading required context: " + requiredContext);
			
			var context:DynamicExt = _assetMap.get(requiredContext);
			
			for (key in context.keys())
			{
				enqueue(context.get(key));
			}
		}
		
		_requiredContexts = [];
	}
	
	
	
	// PRIVATE
	//============================================================================================================
	
	private function enqueue(path:String):Void
	{
		// Get file extension
		var split:Array<String> = path.split(".");
		var extension:String = split[split.length - 1];
		
		// Handle extension
		switch(extension)
		{
			case "json":
				queueString(path);
			case "xml":
				queueString(path);
			case "txt":
				queueString(path);
			
			case "jpg":
				queueImage(path);
			case "png":
				queueImage(path);
			case "gif":
				queueImage(path);
			case "atf":
				queueImage(path);
		}
	}
	
	private function queueString(path:String):Void
	{
		trace("Queued string: " + path);
	}
	
	private function queueImage(path:String):Void
	{
		trace("Queued image: " + path);
	}
}