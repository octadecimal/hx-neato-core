package neato.game.extensions;

import neato.api.core.extensions.IExtension;
import neato.api.game.extensions.IExtensionManager;
import neato.core.debug.Debug;

/**
 * ...
 */
class ExtensionManager implements IExtensionManager
{
	// Extension map
	private var _extensions:Map<String, IExtension>;
	
	/**
	 * Constructor.
	 */
	public function new() 
	{
		_extensions = new Map<String, IExtension>();
		
		Debug.output("Created.");
	}
	
	/**
	 * Destructor.
	 */
	public function destroy():Void 
	{
		Debug.output("Destroying...");
		
		for (extension in _extensions)
		{
			extension.destroy();
		}
		
		_extensions = null;
		
		Debug.output("Destroyed.");
	}
	
	
	
	// API
	//============================================================================================================
	
	/**
	 * Registers an extension. If an extension with the same name already exists,
	 * an error will be thrown.
	 * @param	name		Extension name used for lookup.
	 * @param	definition	Extension class definition.
	 */
	public function register(name:String, definition:Class<Dynamic>):Void
	{
		Debug.output("Registering extension: " + name + "...");
		
		if (!_extensions.exists(name))
		{
			_extensions.set(name, Type.createInstance(definition, []));
		}
		else
		{
			throw "Extension already registered: " + name;
		}
	}
	
	/**
	 * Retrieves an extension by name.
	 * @param	name	Extension name used when registering.
	 * @return	Extension instance with matching name.
	 */
	public function get(name:String):IExtension
	{
		if (_extensions.exists(name))
		{
			return _extensions.get(name);
		}
		else
		{
			throw "Could not find extension: " + name;
			return null;
		}
	}
	
	/**
	 * Retrieves a reference to all registered extensions.
	 * @return
	 */
	public function getAllExtensions():Array<IExtension>
	{
		var output:Array<IExtension> = [];
		
		for (extension in _extensions)
		{
			output.push(extension);
		}
		
		return output;
	}
}