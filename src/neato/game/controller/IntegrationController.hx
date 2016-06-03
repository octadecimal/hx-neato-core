package neato.game.controller;

import msignal.Signal.Signal1;
import neato.api.core.integration.IIntegrator;
import neato.api.game.IGameModel;
import neato.api.game.controller.IIntegrationController;
import neato.api.game.notifications.INotificationManager;
import neato.core.debug.Debug;
import neato.core.integration.RequestVO;
import neato.core.integration.ResponseVO;
import neato.core.mvc.Controller;
import neato.core.types.DynamicExt;

/**
 * ...
 */
class IntegrationController extends Controller implements IIntegrationController
{
	public var sigResponseReceived(default, null):Signal1<ResponseVO>;
	
	private var _integrator:IIntegrator;
	
	/**
	 * Constructor.
	 */
	public function new(notifications:INotificationManager, model:IGameModel, integrator:IIntegrator) 
	{
		_integrator = integrator;
		
		super(notifications, model);
		
		sigResponseReceived = new Signal1<ResponseVO>();
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
	
	public function sendRequest(vo:RequestVO):Void
	{
		_integrator.sigResponseReceived.addOnce(onSigResponseReceived);
		_integrator.sendRequest(vo.params);
	}
	
	
	
	// HANDLERS
	//============================================================================================================
	
	private function onSigResponseReceived(response:ResponseVO):Void
	{
		sigResponseReceived.dispatch(response);
	}
}