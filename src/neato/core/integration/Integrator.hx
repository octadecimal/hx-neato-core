package neato.core.integration;

import haxe.Http;
import haxe.Json;
import msignal.Signal.Signal1;
import neato.api.core.integration.IIntegrator;
import neato.core.debug.Debug;
import neato.core.types.DynamicExt;

/**
 * A standard generic integrator that accepts a raw map of key-pair values to be sent to the url endpoint
 * via http GET. A json string response is expected, and this class will build the responseVO before
 * then dispatching it to the integration controller.
 */
class Integrator implements IIntegrator
{
	public var sigResponseReceived:Signal1<DynamicExt>;
	
	private var _url:String;
	
	/**
	 * Constructor.
	 */
	public function new(url:String) 
	{
		_url = url;
		
		sigResponseReceived = new Signal1<DynamicExt>();
	}
	
	
	
	// API
	//============================================================================================================
	
	public function sendRequest(params:Map<String, String>):Void 
	{
		Debug.output("Sending request: " + params);
		
		var http:Http = new Http(_url);
		http.onData = onData;
		http.onError = onError;
		http.onStatus = onStatus;
		
		for (key in params.keys())
		{
			Debug.output("param: " + key + "->" + params.get(key));
			http.setParameter(key, params.get(key));
		}
		
		http.request(false);
	}
	
	
	
	// HANDLERS
	//============================================================================================================
	
	private function onStatus(status:Int):Void
	{
		trace("STATUS: " + status);
	}
	
	private function onError(error):Void
	{
		trace("ERROR: " + error);
	}
	
	private function onData(data):Void
	{
		trace("DATA: " + data);
		
		// Create output response vo
		var responseVO:ResponseVO = new ResponseVO();
		
		// Convert raw input to json
		var json:DynamicExt = Json.parse(data);
		
		// Set properties
		responseVO.action = json.get("action");
		responseVO.state = json.get("state");
		responseVO.result = json.get("result");
		responseVO.winAmount = json.get("winAmount");
		responseVO.winType = json.get("win");
		
		// Dispatch
		sigResponseReceived.dispatch(responseVO);
	}
}