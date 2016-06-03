package neato.poker.extensions.hand;

import haxe.Timer;
import neato.core.display.DisplayObject;
import neato.core.display.Sprite;
import neato.core.display.TextField;
import neato.game.extensions.Extension;
import neato.core.geom.Rectangle;
import neato.core.types.NativeDisplayTypes.NativeTexture;
import neato.poker.model.PokerStates;
import neato.poker.view.GameSkin_poker;

/**
 * ...
 */
class PokerHandExtension extends Extension
{
	private var _cards:Array<Sprite> = [];
	private var _holdLabels:Array<TextField> = [];
	private var _heldCards:Array<Int> = [-1, -1, -1, -1, -1];
	
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
	
	override public function start():Void 
	{
		buildCards();
		buildLabels();
	}
	
	public function showResult(result:Array<String>):Void
	{
		for (i in 0...5)
		{
			var texture:String = result[i];
			
			texture = _cardMap.get(Std.parseInt(result[i]));
			
			setCardTexture(i, texture, 100 * i);
		}
	}
	
	public function clear():Void
	{
		trace("Clearing, state: " + _gameModel.gameState);
		
		if (_gameModel.gameState == PokerStates.DEAL)
		{
			_heldCards = [-1, -1, -1, -1, -1];
		}
		
		for (i in 0...5)
		{
			if (_gameModel.gameState == PokerStates.DEAL)
			{
				setCardTexture(i, "back");
				_holdLabels[i].visible = false;
			}
			else
			{
				if (_heldCards[i] == -1)
				{
					setCardTexture(i, "back");
				}
			}
		}
	}
	
	public function getHeldCards():Array<Int>
	{
		var output:Array<Int> = [];
		
		for (i in 0..._heldCards.length)
		{
			if (_heldCards[i] == 1)
			{
				output.push(i);
			}
		}
		
		return output;
	}
	
	
	
	// PRIVATE
	//============================================================================================================
	
	private function buildCards():Void
	{
		var cardsRegion:Rectangle = _gameView.domBuilder.getRegion("card-display");
		
		for (i in 0...5)
		{
			var region:Rectangle = _gameView.domBuilder.getRegion("card-" + i);
			
			var sprite:Sprite = new Sprite(_gameSkin.getTexture("back.png"));
			sprite.x = region.x;
			sprite.y = cardsRegion.y;
			
			sprite.interactive = true;
			
			sprite.sigClicked.add(onCardClicked);
			
			_gameView.addChild(sprite);
			
			_cards.push(sprite);
		}
	}
	
	private function buildLabels():Void
	{
		for (i in 0..._cards.length)
		{
			var card:Sprite = _cards[i];
			
			var tf:TextField = new TextField("HOLD", { font: "Arial 18px", fill: "white" });
			
			tf.visible = false;
			tf.pivotX = tf.width / 2;
			tf.x = card.x + (card.width/2);
			tf.y = card.y + card.height;
			
			_gameView.addChild(tf);
			
			_holdLabels.push(tf);
		}
	}
	
	private function setCardTexture(index:Int, textureName:String, ?delay:Int = 0):Void
	{
		function apply():Void
		{
			_cards[index].texture = _gameSkin.getTexture(textureName+".png");
		}
		
		Timer.delay(apply, delay);
	}
	
	
	
	// HANDLERS
	//============================================================================================================
	
	private function onCardClicked(card:DisplayObject):Void
	{
		if (_gameModel.gameState == PokerStates.DRAW)
		{
			var cardIndex:Int = _cards.indexOf(cast card);
			
			_holdLabels[cardIndex].visible = !_holdLabels[cardIndex].visible;
			
			_heldCards[cardIndex] *= -1;
		}
	}
	
	
	
	// MAPS
	//============================================================================================================
	
	
	/**
	 * Card map (id|key)
	 */
	private var _cardMap:Map<Int, String> =
	[
		0 => "2c",
		1 => "2d",
		2 => "2h",
		3 => "2s",
		4 => "3c",
		5 => "3d",
		6 => "3h",
		7 => "3s",
		8 => "4c",
		9 => "4d",
		10 => "4h",
		11 => "4s",
		12 => "5c",
		13 => "5d",
		14 => "5h",
		15 => "5s",
		16 => "6c",
		17 => "6d",
		18 => "6h",
		19 => "6s",
		20 => "7c",
		21 => "7d",
		22 => "7h",
		23 => "7s",
		24 => "8c",
		25 => "8d",
		26 => "8h",
		27 => "8s",
		28 => "9c",
		29 => "9d",
		30 => "9h",
		31 => "9s",
		32 => "10c",
		33 => "10d",
		34 => "10h",
		35 => "10s",
		36 => "Jc",
		37 => "Jd",
		38 => "Jh",
		39 => "Js",
		40 => "Qc",
		41 => "Qd",
		42 => "Qh",
		43 => "Qs",
		44 => "Kc",
		45 => "Kd",
		46 => "Kh",
		47 => "Ks",
		48 => "Ac",
		49 => "Ad",
		50 => "Ah",
		51 => "As",
	];
}