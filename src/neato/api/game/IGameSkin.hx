package neato.api.game;
import neato.core.types.NativeDisplayTypes.NativeTexture;

/**
 * ...
 */
interface IGameSkin 
{
	public function initialize(textureMap:Map<String, NativeTexture>):Void;
	public function getTexture(name:String):NativeTexture;
}