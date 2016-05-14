package neato.api.core.integration;

import msignal.Signal.Signal1;
import neato.core.integration.RequestVO;
import neato.core.types.DynamicExt;

/**
 */
interface IIntegrator 
{
	public var sigResponseReceived:Signal1<DynamicExt>;
	
	public function sendRequest(params:Map<String, String>):Void;
}