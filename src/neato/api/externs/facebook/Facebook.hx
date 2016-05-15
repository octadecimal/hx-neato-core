package neato.api.externs.facebook;

import neato.core.types.DynamicExt;

/**
 * ...
 */
@:native("FB")
extern class Facebook
{
	/**
	 * Used to initialize and setup the SDK. All other SDK methods must be called after this one.
	 * @param	params
	 */
	public static function init(params:FacebookInitParams):Void;
	
	/**
	 * Make an api call on the Graph
	 * @param	path		This is the Graph API endpoint path that you want to call. You can read the Graph API reference docs to see which endpoint you want to use. This is a required parameter.
	 * @param	method		This is the HTTP method that you want to use for the API request. Consult the Graph API reference docs to see which method you need to use. Default is get
	 * @param	params		This is an object consisting of any parameters that you want to pass into your Graph API call. The parameters that can be used vary depending on the endpoint being called, so check the Graph API reference docs for full lists of available parameters. One parameter of note is access_token which you can use to make an API call with a Page access token. App access tokens should never be used in this SDK as it is client-side, and your app secret would be exposed.
	 * @param	callback	This is the function that is triggered whenever the API returns a response. The response object available to this function contains the API result.
	 */
	//public static function api(path:String, method:FacebookGraphAPIMethod, params, callback:Void->Void):Void;
	
	/**
	 * Retrieves the user id as a string.
	 * @return
	 */
	public static function getUserID():String;
}


// 
//============================================================================================================

typedef FacebookInitParams = 
{
	/**
	 * Your application ID. If you don't have one find it in the App dashboard or go there to create a new app. 
	 * Defaults to null.
	 */
	var appId:String;
	
	/**
	 * Determines which versions of the Graph API and any API dialogs or plugins are invoked when using the .api() 
	 * and .ui() functions. Valid values are determined by currently available versions, such as 'v2.0'. This 
	 * is a required parameter.
	 */
	var version:String;
	
	/**
	 * Determines whether XFBML tags used by social plugins are parsed, and therefore whether the plugins are 
	 * rendered or not. Defaults to false.
	 */
	var xfbml:Bool;
}

enum FacebookGraphAPIMethod
{
	get;
	post;
	delete;
}