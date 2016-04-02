package neato.template;

#if flash
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.Lib;
import flash.text.TextField;
import flash.events.Event;
#end

/**
 * ...
 */
class Game_template
{
	#if flash
	private var _tf:TextField;
	
	/**
	 * Constructor.
	 */
	public function new() 
	{
		var stage = Lib.current.stage;
		stage.scaleMode = StageScaleMode.NO_SCALE;
		stage.align = StageAlign.TOP_LEFT;
		stage.addEventListener(Event.RESIZE, draw);
		// Entry point
		
		_tf = new TextField();
		_tf.text = "neato!";
		
		stage.addChild(_tf);
	}
	
	private function draw(e:Event):Void 
	{
		var stage = Lib.current.stage;
		_tf.text = stage.stageWidth + " x " + stage.stageHeight;
	}
	
	/**
	 * Destructor.
	 */
	public function destroy():Void 
	{
		
	}
	#end
}