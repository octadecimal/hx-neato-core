package neato.api.core.mvc;
import neato.core.types.DynamicExt;

/**
 * ...
 */
interface INotifiable 
{
	/**
	 * Subscribes to a notification.
	 * @param	notification
	 * @param	handler
	 */
	public function subscribe(notification:String, handler:DynamicExt):Void;
	
	/**
	 * Unsubscribes to a notification.
	 * @param	notification
	 * @param	handler
	 */
	public function unsubscribe(notification:String, handler:DynamicExt):Void;
}