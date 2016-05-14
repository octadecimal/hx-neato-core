package neato.api.game.controller;

import msignal.Signal.Signal1;
import neato.api.core.mvc.IController;
import neato.core.integration.RequestVO;
import neato.core.integration.ResponseVO;

/**
 * ...
 */
interface IIntegrationController extends IController
{
	public var sigResponseReceived(default, null):Signal1<ResponseVO>;
	
	public function sendRequest(request:RequestVO):Void;
}