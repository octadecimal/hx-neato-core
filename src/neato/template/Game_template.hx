package neato.template;

import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.Lib;
import flash.text.TextField;

/**
 * ...
 */
class Game_template
{
	/**
	 * Constructor.
	 */
	public function new() 
	{
		var stage = Lib.current.stage;
		stage.scaleMode = StageScaleMode.NO_SCALE;
		stage.align = StageAlign.TOP_LEFT;
		// Entry point
		
		var tf:TextField = new TextField();
		tf.text = "neato!";
		
		stage.addChild(tf);
	}
	
	/**
	 * Destructor.
	 */
	public function destroy():Void 
	{
		
	}
}