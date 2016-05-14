package neato.game.controller;

import msignal.Signal.Signal0;
import neato.api.game.controller.ILoadingController;
import neato.core.debug.Debug;
import neato.core.loading.LoaderQueue;
import neato.core.mvc.Controller;
import neato.core.types.NativeDisplayTypes;
import neato.core.types.DynamicExt;
import pixi.core.textures.Texture;

/**
 * ...
 */
class LoadingController extends Controller implements ILoadingController
{
	/**
	 * Dispatched when all queued assets have been loaded.
	 */
	public var sigComplete(default, null):Signal0;
	
	// Our registered asset map.
	private var _assetMap:DynamicExt;
	
	// Our loader queue.
	private var _queue:LoaderQueue;
	
	// Storage
	private var _assetPaths:Map<String, String>;
	private var _requiredContexts:Array<String>;
	private var _strings:Map<String, String>;
	private var _xmls:Map<String, Xml>;
	private var _jsons:Map<String, DynamicExt>;
	private var _textures:Map<String, Texture>;
	
	/**
	 * Constructor.
	 */
	public function new() 
	{
		Debug.output("Creating...");
		
		super();
		
		sigComplete = new Signal0();
		
		_requiredContexts = [];
		_assetPaths = new Map<String, String>();
		_strings = new Map<String, String>();
		_xmls = new Map<String, Xml>();
		_jsons = new Map<String, DynamicExt>();
		_textures = new Map<String, Texture>();
		
		_queue = new LoaderQueue();
		
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
	
	/**
	 * Sets the asset map, the map of asset names and their path.
	 * @param	assetMap	JSON object.
	 */
	public function setAssetMap(assetMap:DynamicExt):Void
	{
		// Save reference
		_assetMap = assetMap;
		
		// Build asset path map
		for (contextKey in assetMap.keys())
		{
			var contextExt:DynamicExt = assetMap.get(contextKey);
			
			for (contextAssetKey in contextExt.keys())
			{
				_assetPaths.set(contextAssetKey, contextExt.get(contextAssetKey));
			}
		}
		
		Debug.output("Asset paths map set.");
	}
	
	/**
	 * Requires a context by queueing all assets of this context for loading.
	 * @param	context		The context to be required.
	 */
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
	
	/**
	 * Loads all assets of all required contexts.
	 */
	public function loadRequiredContexts():Void
	{
		for (requiredContext in _requiredContexts)
		{	
			Debug.output("Loading required context: " + requiredContext);
			
			var context:DynamicExt = _assetMap.get(requiredContext);
			
			for (key in context.keys())
			{
				enqueue(key, context.get(key));
			}
		}
		
		_requiredContexts = [];
		
		_queue.sigComplete.add(onLoadingComplete);
		_queue.sigStringLoaded.add(onStringLoaded);
		_queue.sigTextureLoaded.add(onTextureLoaded);
		_queue.startLoading();
	}
	
	/**
	 * Retrieves a reference previously loaded texture.
	 * @param	key		Asset id to be retrieved.
	 * @return
	 */
	public function getTexture(key:String):NativeTexture
	{
		return _textures.get(key);
	}
	
	/**
	 * Retrieves a reference previously loaded string.
	 * @param	key		Asset id to be retrieved.
	 * @return
	 */
	public function getString(key:String):String
	{
		return _strings.get(key);
	}
	
	/**
	 * Retrieves a reference previously loaded xml.
	 * @param	key		Asset id to be retrieved.
	 * @return
	 */
	public function getXml(key:String):Xml
	{
		return _xmls.get(key);
	}
	
	/**
	 * Retrieves a reference previously loaded json.
	 * @param	key		Asset id to be retrieved.
	 * @return
	 */
	public function getJson(key:String):DynamicExt
	{
		return _jsons.get(key);
	}
	
	/**
	 * Returns the texture map.
	 * @return
	 */
	public function getTextureMap():Map<String, NativeTexture>
	{
		return _textures;
	}
	
	
	
	// PRIVATE
	//============================================================================================================
	
	/**
	 * Enqueues an asset for loading, the asset type will be guessed, or an error thrown for unknown asset types.
	 * @param	id
	 * @param	url
	 */
	private function enqueue(id:String, url:String):Void
	{
		// Get file extension
		var split:Array<String> = url.split(".");
		var extension:String = split[split.length - 1];
		
		// Handle extension
		switch(extension)
		{
			case "json":
				queueString(id, url);
			case "xml":
				queueString(id, url);
			case "txt":
				queueString(id, url);
			case "ntx":
				queueString(id, url);
			
			case "jpg":
				queueImage(id, url);
			case "png":
				queueImage(id, url);
			case "gif":
				queueImage(id, url);
			case "atf":
				queueImage(id, url);
			
			default:
				Debug.output("Unknown file extension: " + extension + " for file: " + id);
		}
	}
	
	/**
	 * Queues a string for loading.
	 * @param	id
	 * @param	url
	 */
	private function queueString(id:String, url:String):Void
	{
		trace("Queued string: " + url);
		
		_queue.addString(id, url);
	}
	
	/**
	 * Queues an image for loading.
	 * @param	id
	 * @param	url
	 */
	private function queueImage(id:String, url:String):Void
	{
		trace("Queued image: " + url);
		
		_queue.addImage(id, url);
	}
	
	
	
	// HANDLERS
	//============================================================================================================
	
	/**
	 * signal: All queued assets loaded.
	 */
	private function onLoadingComplete():Void
	{
		sigComplete.dispatch();
	}
	
	/**
	 * signal: A string has been loaded.
	 * @param	id		Asset key.
	 * @param	data	Asset contents.
	 */
	private function onStringLoaded(id:String, data:DynamicExt):Void
	{
		trace("String loaded: " + id);
		
		if (Std.is(data, String))
		{
			_strings.set(id, cast(data, String));
		}
		else if (Std.is(data, Xml))
		{
			_xmls.set(id, cast(data, Xml));
		}
		else
		{
			_jsons.set(id, data);
		}
	}
	
	/**
	 * signal: A texture has been loaded.
	 * @param	id			Asset key.
	 * @param	texture		Asset contents.
	 */
	private function onTextureLoaded(id:String, texture:Texture):Void
	{
		trace("Texture loaded: " + id);
		
		_textures.set(id, texture);
	}
}