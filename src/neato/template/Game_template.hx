package neato.template;

#if flash
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.Lib;
import flash.text.TextField;
#end

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
		#if flash
		var stage = Lib.current.stage;
		stage.scaleMode = StageScaleMode.NO_SCALE;
		stage.align = StageAlign.TOP_LEFT;
		// Entry point
		
		var tf:TextField = new TextField();
		tf.text = "neato!";
		
		stage.addChild(tf);
		#end
	}
	
	/**
	 * Destructor.
	 */
	public function destroy():Void 
	{
		
	}
}