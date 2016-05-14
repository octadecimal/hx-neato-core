package neato.api.core.display;

import neato.core.display.DisplayObject;

/**
 * ...
 */
interface IContainer extends IDisplayObject
{
	public function addChild(child:DisplayObject):DisplayObject;
}