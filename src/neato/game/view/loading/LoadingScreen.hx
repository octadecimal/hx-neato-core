package neato.game.view.loading;

import motion.Actuate;
import motion.easing.Back;
import motion.easing.Sine;
import neato.core.display.Sprite;
import neato.core.mvc.ViewComponent;

/**
 * ...
 */
class LoadingScreen extends ViewComponent
{
	private var _logo:Sprite;
	private var _progressBackground:Sprite;
	private var _progressForeground:Sprite;
	
	/**
	 * Constructor.
	 */
	public function new() 
	{
		super();
	}
	
	/**
	 * Destructor.
	 */
	override public function destroy():Void 
	{
		super.destroy();
	}
	
	
	
	// API
	//============================================================================================================
	
	override public function build():Void 
	{
		_logo = cast getChildByName("loading-logo.png");
		_progressBackground = cast getChildByName("progress-background.png");
		_progressForeground = cast getChildByName("progress-foreground.png");
		
		_progressForeground.scaleX = 0;
		Actuate.tween(_progressForeground, 4, { scaleX: 1 }).ease(Sine.easeInOut).onComplete(onComplete);
	}
	
	override public function setInitialState():Void 
	{
		_logo.alpha = 0;
		_progressBackground.alpha = 0;
		_progressForeground.alpha = 0;
		
		_logo.y -= 150;
		_progressBackground.y += 50;
		_progressForeground.y += 50;
		
		Actuate.tween(_logo, 1.5, { alpha: 1 });
		Actuate.tween(_logo, 0.5, { y: _logo.y + 150 }).ease(Back.easeOut);
		
		Actuate.tween(_progressBackground, 0.5, { alpha: 1 }).delay(0.1);
		Actuate.tween(_progressBackground, 0.5, { y: _progressBackground.y - 50 }).delay(0.1).ease(Back.easeOut);
		
		Actuate.tween(_progressForeground, 0.5, { alpha: 1 }).delay(0.1);
		Actuate.tween(_progressForeground, 0.5, { y: _progressForeground.y - 50 }).delay(0.1).ease(Back.easeOut);
	}
	
	private function onComplete() 
	{
		Actuate.tween(_logo, 1.5, { alpha: 0 }).delay(0.1);
		Actuate.tween(_logo, 1, { y: _logo.y - 100 }).delay(0.1).ease(Back.easeIn);
		
		Actuate.tween(_progressBackground, 0.5, { alpha: 0 });
		Actuate.tween(_progressBackground, 0.5, { y: _progressBackground.y + 50 }).ease(Back.easeIn);
		
		Actuate.tween(_progressForeground, 0.5, { alpha: 0 });
		Actuate.tween(_progressForeground, 0.5, { y: _progressForeground.y + 50 }).ease(Back.easeIn);
	}
}