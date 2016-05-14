package neato.game.view;

import neato.api.game.IGameSkin;
import neato.core.debug.Debug;
import neato.core.types.NativeDisplayTypes.NativeTexture;

/**
 * ...
 */
class GameSkin implements IGameSkin
{
	private var _textures:Map<String, NativeTexture>;
	
	/**
	 * Constructor.
	 */
	public function new() 
	{
		Debug.output("Created.");
	}
	
	/**
	 * Destructor.
	 */
	public function destroy():Void 
	{
		Debug.output("Destroyed.");
	}
	
	
	
	// API
	//============================================================================================================
	
	public function initialize(textures:Map<String, NativeTexture>):Void
	{
		_textures = textures;
	}
	
	public function getTexture(name:String):NativeTexture
	{
		if (_textures.exists(name))
		{
			return _textures.get(name);
		}
		else
		{
			Debug.output("Texture not found: " + name);
			return null;
		}
	}
}