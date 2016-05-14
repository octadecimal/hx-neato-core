package neato.poker.model;

import neato.api.core.integration.IIntegrator;
import neato.core.integration.Integrator;

/**
 * ...
 */
class PokerIntegrator extends Integrator implements IIntegrator
{
	/**
	 * Constructor.
	 */
	public function new(url:String) 
	{
		super(url);
	}
	
	/**
	 * Destructor.
	 */
	public function destroy():Void 
	{
		
	}
}