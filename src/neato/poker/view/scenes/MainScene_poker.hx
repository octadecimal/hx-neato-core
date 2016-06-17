package neato.poker.view.scenes;

import neato.core.display.Button;
import neato.core.display.TextField;
import neato.core.mvc.ViewComponent;

/**
 * ...
 */
class MainScene_poker extends ViewComponent
{
	// Buttons
	public var btnDeal(default, null):Button;
	
	// Labels
	public var txtWinType(default, null):TextField;
	public var txtWinAmount(default, null):TextField;
	
	// Storage
	private var _buttons:Array<Button> = [];
	
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
	
	
	
	// PUBLIC
	//============================================================================================================
	
	override public function build():Void 
	{
		super.build();
		
		btnDeal = getButton("btn-deal");
		
		txtWinAmount = new TextField("WIN: 0", { fill: "white" });
		txtWinAmount.x = 10;
		txtWinAmount.y = 735;
		addChild(txtWinAmount);
		
		txtWinType = new TextField("", { fill: "white" });
		txtWinType.x = 10;
		txtWinType.y = 700;
		addChild(txtWinType);
	}
	
	public function enableButtons():Void
	{
		for (button in _buttons)
		{
			button.enable();
		}
	}
	
	public function disableButtons():Void
	{
		for (button in _buttons)
		{
			button.disable();
		}
	}
	
	public function showWinAmount(amount:Int, type:Int):Void
	{
		txtWinAmount.text = "WIN: " + Std.string(amount);
		
		if (amount > 0 && (type > -1 && type != null))
		{
			txtWinType.text = _winConfigs.get(type);
		}
		else
		{
			txtWinType.text = "";
		}
	}
	
	
	
	// PRIVATE
	//============================================================================================================
	
	private function getButton(name:String):Button
	{
		var button:Button =  cast getChildByName("btn-deal");
		_buttons.push(button);
		
		return button;
	}
	
	
	
	// MAPS
	//============================================================================================================
	
	private var _winConfigs:Map<Int, String> =
	[
		0 => "JACKS OR BETTER",
		1 => "TWO PAIR",
		2 => "THREE OF A KIND",
		3 => "STRAIGHT",
		4 => "FLUSH",
		5 => "FULL HOUSE",
		6 => "4 OF A KIND",
		7 => "STRAIGHT FLUSH",
		8 => "ROYAL FLUSH",
	];
}