package neato.api.core.mvc;

import neato.core.types.DynamicExt;

/**
 * ...
 */
interface INotifier 
{
	/**
	 * Broadcasts a notification.
	 * @param	notification
	 * @param	params
	 */
	public function broadcast(notification:String, ?params:DynamicExt):Void;
}