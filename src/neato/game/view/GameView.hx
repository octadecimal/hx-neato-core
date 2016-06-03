package neato.game.view;

import neato.api.core.application.IApplication;
import neato.api.game.IGameView;
import neato.core.debug.Debug;
import neato.core.dom.DOMBuilder;
import neato.core.mvc.ViewComponent;
import neato.core.types.NativeDisplayTypes.NativeContainer;

/**
 * ...
 */
class GameView extends ViewComponent implements IGameView
{
	public var application(default, default):IApplication;
	
	public var nativeStage(default, null):NativeContainer;
	
	public var domBuilder(default, default):DOMBuilder;
	
	private var _scenes:Map<String, ViewComponent>;
	
	/**
	 * Constructor.
	 */
	public function new() 
	{
		super();
		
		nativeStage = _native_Container;
		
		_scenes = new Map<String, ViewComponent>();
		
		Debug.output("Created.");
	}
	
	/**
	 * Destructor.
	 */
	override public function destroy():Void
	{
		super.destroy();
		
		Debug.output("Destroyed.");
	}
	
	
	
	// API
	//============================================================================================================
	
	/**
	 * Builds a scene by name.
	 * @param	name	Name of scene (as defined in the dom.xml) to be built.
	 */
	public function buildScene(name:String):Void
	{
		if (_scenes.exists(name))
		{
			throw "Scene already built: " + name;
		}
		
		var scene:ViewComponent = domBuilder.buildScene(name, this);
		
		scene.visible = false;
		
		_scenes.set(name, scene);
	}
	
	/**
	 * Retrieves a reference to a scene by name.
	 * @param	name	Name of scene.
	 * @return
	 */
	public function getScene(name:String):ViewComponent
	{
		if (_scenes.exists(name))
		{
			return _scenes.get(name);
		}
		else
		{
			throw "Scene now found: " + name;
		}
	}
	
	/**
	 * Shows a scene by name.
	 * @param	name	Name of scene.
	 */
	public function showScene(name:String):Void
	{
		if (_scenes.exists(name))
		{
			_scenes.get(name).visible = true;
		}
		else
		{
			throw "Scene not found: " + name;
		}
	}
	
	/**
	 * Hides a scene by name.
	 * @param	name	Name of scene.
	 */
	public function hideScene(name:String):Void
	{
		if (_scenes.exists(name))
		{
			_scenes.get(name).visible = false;
		}
		else
		{
			throw "Scene not found: " + name;
		}
	}
}