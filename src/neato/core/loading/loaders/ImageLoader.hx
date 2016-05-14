package neato.core.loading.loaders;
import pixi.loaders.Loader;

/**
 * ...
 */
class ImageLoader
{
	#if js
	private var _loader:Loader;
	#end
	
	/**
	 * Constructor.
	 */
	public function new() 
	{
		#if js
		_loader = new Loader();
		#end
	}
	
	/**
	 * Destructor.
	 */
	public function destroy():Void 
	{
		
	}
}