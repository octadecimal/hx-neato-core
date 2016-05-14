package neato.core.dom;

import neato.core.debug.Debug;
import neato.core.display.Button;
import neato.core.display.Container;
import neato.core.display.DisplayObject;
import neato.core.display.Sprite;
import neato.core.display.TextField.TextStyle;
import neato.core.geom.Rectangle;
import neato.core.mvc.ViewComponent;
import neato.core.types.DynamicExt;
import neato.core.types.NativeDisplayTypes;

/**
 * ...
 */
class DOMBuilder
{
	private static inline var SCENE:String = "scene";
	private static inline var CONTAINER:String = "container";
	private static inline var SPRITE:String = "sprite";
	private static inline var TEXTFIELD:String = "textfield";
	private static inline var RECT:String = "rect";
	private static inline var BUTTON:String = "button";
	
	private var _scenes:Map<String, DOMElement>;
	private var _definitions:Map<String, String>;
	private var _textureList:Map<String, NativeTexture>;
	private var _scale:Float;
	private var _rects:Map<String, Rectangle>;
	
	/**
	 * Constructor.
	 */
	public function new(definitions:Map<String, String>, textureList:Map<String, NativeTexture>, ?scale:Float = 1) 
	{
		//_scenes = scenes;
		_definitions = definitions;
		_textureList = textureList;
		_scale = scale;
		
		_rects = new Map<String, Rectangle>();
	}
	
	/**
	 * Destructor.
	 */
	public function destroy():Void 
	{
		
	}
	
	
	
	// API
	//==================================================================================================================
	
	public function parseDom(dom:Xml):Void
	{
		_scenes = new Map<String, DOMElement>();
		
		// Loop through scenes
		for(scene in dom.firstElement().elements())
		{
			// Get scene id
			var sceneID:String = scene.get("name");
			
			// Ensure scene has id
			if(sceneID == null)
			{
				throw "Found scene without a name: " + scene.toString();
			}
			
			// Parse scene
			_scenes.set(sceneID, parseNode(scene));
		}
	}
	
	public function buildScene(sceneName:String, targetParent:ViewComponent):ViewComponent
	{
		if(!_scenes.exists(sceneName))
		{
			throw "Scene not found: " + sceneName;
		}
		
		var scene:ViewComponent = cast buildElement(_scenes.get(sceneName), targetParent);
		
		return scene;
	}
	
	public function getRect(name:String):Rectangle
	{
		if (_rects.exists(name))
		{
			return _rects.get(name);
		}
		else
		{
			Debug.output("Rect not found: " + name);
			return null;
		}
	}
	
	
	
	// PRIVATE
	//==================================================================================================================
	
	private function parseNode(node:Xml):DOMElement
	{
		var domElementChildren:Array<DOMElement> = new Array<DOMElement>();
		
		trace("Parsing node: " + node.get("name"));
		
		for(child in node.elements())
		{
			domElementChildren.push(parseNode(child));
		}
		
		var element:DOMElement = {
			name: node.get("name"),
			type: node.nodeName,
			children: domElementChildren,
			x: Std.parseFloat(node.get("x")),
			y: Std.parseFloat(node.get("y")),
			width: Std.parseFloat(node.get("width")),
			height: Std.parseFloat(node.get("height")),
			scaleX: Std.parseFloat(node.get("scaleX")),
			scaleY: Std.parseFloat(node.get("scaleY")),
			rotation: Std.parseFloat(node.get("rotation")),
			font: node.get("font"),
			fill: node.get("fill"),
			text: node.get("text"),
			up: node.get("up"),
			down: node.get("down"),
			off: node.get("off")
		}
		
		return element;
	}

	private function buildElement(element:DOMElement, parent:Container):Dynamic
	{
		trace("Building element: " + element.name);
		
		var output:Dynamic = null;
		
		switch(element.type)
		{
			case RECT:
				output = buildRect(element, parent);
			default:
				output = buildDisplayObject(element, parent);
		}
		
		return output;
	}
	
	private function buildDisplayObject(element:DOMElement, parent:Container):DisplayObject
	{
		var displayObject:DisplayObject = null;	
		var args:Array<Dynamic> = [];
		
		// Get element definition
		var elementDefinitionName:String = _definitions.get(element.name);
		
		// Build type-specific arguments
		switch(element.type)
		{
			case SPRITE:
				args.push(_textureList.get(element.name));
			case TEXTFIELD:
				args.push("");
				args.push(getTextStyleFromElement(element));
			case BUTTON:
				args.push(_textureList.get(element.up));
				args.push(_textureList.get(element.down));
				args.push(_textureList.get(element.off));
		}
		
		// Create display object from custom definition, otherwise use element type
		if(elementDefinitionName != null)
		{
			// Get custom definition
			var definition:Class<Dynamic> = Type.resolveClass(elementDefinitionName);
			
			// Ensure declared definition exists
			if(definition == null)
			{
				throw "Could not create class from definition for element: "+element.name+" => "+elementDefinitionName+". \n - Does the class exist and have the correct namespace?\n - Does the class inherit from a correct display type?\n - Does the class need a @:keep macro?";
			}
			
			// Create display object from custom definition
			displayObject = Type.createInstance(definition, args);
		}
		else
		{
			// No custom definition defined, build from generic display objects
			switch(element.type)
			{
				case SCENE:
					displayObject = new Container();
				case CONTAINER:
					displayObject = new Container();
				case SPRITE:
					displayObject = new Sprite(args[0]);
				case TEXTFIELD:
					//displayObject = new TextField(args[0], args[1]);
				case BUTTON:
					displayObject = new Button(args[0], args[1], args[2]);
				default:
					throw "Type not found: `"+element.type+"`` for element: "+element.name;
			}
		}
		
		// Set defined properties
		displayObject.name  = element.name;
		if (isDefined(element.x))         displayObject.x         = element.x * _scale;
		if (isDefined(element.y))         displayObject.y         = element.y * _scale;
		if (isDefined(element.width))     displayObject.width     = element.width * _scale;
		if (isDefined(element.height))    displayObject.height    = element.height * _scale;
		if (isDefined(element.pivotX))    displayObject.pivotX    = element.pivotX * _scale;
		if (isDefined(element.pivotY))    displayObject.pivotY    = element.pivotY * _scale;
		if (isDefined(element.scaleX))    displayObject.scaleX    = element.scaleX;
		if (isDefined(element.scaleY))    displayObject.scaleY    = element.scaleY;
		if (isDefined(element.rotation))  displayObject.rotation  = element.rotation;
		if (isDefined(element.alpha))     displayObject.alpha     = element.alpha;
		
		trace("Created element: " + displayObject.name);
		
		// Add to parent
		if(parent != null)
		{
			parent.addChild(displayObject);
		}
		
		// Build children
		for(child in element.children)
		{
			buildElement(child, cast(displayObject, Container));
		}
		
		// Call build() on displayObject if view component
		if (Std.is(displayObject, ViewComponent))
		{
			cast(displayObject, ViewComponent).build();
			cast(displayObject, ViewComponent).setInitialState();
		}
		
		return displayObject;
	}
	
	private function buildRect(element:DOMElement, parent:DisplayObject):Rectangle
	{
		var rect:Rectangle = new Rectangle();
		
		if (isDefined(element.x))         rect.x         = element.x * _scale;
		if (isDefined(element.y))         rect.y         = element.y * _scale;
		if (isDefined(element.width))     rect.width     = element.width * _scale;
		if (isDefined(element.height))    rect.height    = element.height * _scale;
		
		if (Std.is(parent, ViewComponent))
		{
			cast(parent, ViewComponent).addRect(element.name, rect);
		}
		
		if (_rects.exists(element.name))
		{
			throw "Rect already defined, names must be unique for rects: " + element.name;
		}
		else
		{
			_rects.set(element.name, rect);
		}
		
		return rect;
	}

	private function getTextStyleFromElement(element:DOMElement):TextStyle
	{
		var textStyle:TextStyle = {};
		
		textStyle.font = element.font;
		textStyle.fill = element.fill;
		
		return textStyle;
	}
	
	private function isDefined(property:Dynamic):Bool
	{
		return !Math.isNaN(property);
	}
}