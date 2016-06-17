package neato.game.controller;

import howler.Howl;
import howler.Howl.HowlOptions;
import neato.api.game.IGameModel;
import neato.api.game.controller.ISoundsController;
import neato.api.game.notifications.INotificationManager;
import neato.core.mvc.Controller;
import neato.core.types.DynamicExt;

/**
 * ...
 */
class SoundsController extends Controller implements ISoundsController
{
	/**
	 * Constructor.
	 */
	public function new(notifications:INotificationManager, model:IGameModel) 
	{
		super(notifications, model);
		
		subscribe("CARD_CHANGED", onCardChanged);
		subscribe("CARD_HELD", onCardHeld);
		subscribe("DECK_CLEARED", onDeckCleared);
	}
	
	/**
	 * Destructor.
	 */
	override public function destroy():Void 
	{
		super.destroy();
	}
	
	
	
	// NOTIFICATIONS
	//============================================================================================================
	
	private function onCardChanged(params:DynamicExt):Void
	{
		var options:HowlOptions = {};
		options.src = ["assets/desktop/contexts/poker/sounds/click-basic.wav"];
		options.autoplay = true;
		
		var snd = new Howl(options);
		snd.play();
	}
	
	private function onCardHeld():Void
	{
		var options:HowlOptions = {};
		options.src = ["assets/desktop/contexts/poker/sounds/click.wav"];
		options.autoplay = false;
		options.onload = function () { trace("WOW"); };
		
		var snd = new Howl(options);
		snd.play();
	}
	
	private function onDeckCleared():Void
	{
		var options:HowlOptions = {};
		options.src = ["assets/desktop/contexts/poker/sounds/click-basic.wav"];
		//options.src = ["assets/desktop/contexts/poker/sounds/bonk-click-w-deny-feel.wav"];
		options.autoplay = true;
		
		var snd = new Howl(options);
		snd.play();
	}
}