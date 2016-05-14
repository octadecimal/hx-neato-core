package neato.core.loading;

import msignal.Signal;
import neato.core.debug.Debug;
import pixi.core.textures.Texture;
import pixi.loaders.Resource;

import pixi.loaders.Loader;

/**
 * ...
 */
class LoaderQueue
{
	public var sigStringLoaded(default, null):Signal2<String, Dynamic>;
	public var sigTextureLoaded(default, null):Signal2<String, Texture>;
	public var sigComplete(default, null):Signal0;
	
	private var _loader:Loader;
	
	/**
	 * Constructor.
	 */
	public function new() 
	{
		Debug.output("Creating...");
		
		sigTextureLoaded = new Signal2();
		sigStringLoaded = new Signal2();
		sigComplete = new Signal0();
		
		_loader = new Loader();
		
		Debug.output("Created.");
	}
	
	/**
	 * Destructor.
	 */
	public function destroy():Void 
	{
		Debug.output("Destroying...");
		
		Debug.output("Destroyed.");
	}
	
	
	
	// API
	//============================================================================================================
	
	public function addString(id:String, path:String):Void
	{
		_loader.add(id, path, onFileLoaded);
	}
	
	public function addImage(id:String, path:String):Void
	{
		_loader.add(id, path, onFileLoaded);
	}
	
	public function startLoading():Void
	{
		_loader.load(onLoaded);
	}
	
	
	
	// HANDLERS
	//============================================================================================================
	
	function onFileLoaded(resource:Resource):Void
	{
		//trace("LOADED: " + resource.name);
		//trace(resource.data);
		
		if (resource.isImage)
		{
			sigTextureLoaded.dispatch(resource.name, resource.texture);
		}
		
		if (resource.isJson)
		{
			sigStringLoaded.dispatch(resource.name, resource.data);
		}
		
		if (resource.name.lastIndexOf(".ntx") > 0)
		{
			sigStringLoaded.dispatch(resource.name, Xml.parse(resource.data));
		}
	}
	
	private function onLoaded() 
	{
		//trace(PixiUtils.TextureCache);
		
		sigComplete.dispatch();
	}
}