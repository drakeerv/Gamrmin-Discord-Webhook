import Toybox.Communications;
import Toybox.Application;
import Toybox.WatchUi;

class DiscordWebhookDelegate extends WatchUi.BehaviorDelegate {
    public var active = true;

    function initialize() {
        BehaviorDelegate.initialize();
    }
    
    function onTap(event) as Boolean {
        return sendRequest();
    }
    
    function onKey(event) as Boolean {
        return sendRequest();
    }
	
	function sendRequest() as Void {
	    if (active) {
	        var url = Application.Properties.getValue("webhookUrl");
	  
	        var params = {
	            "username" => Application.Properties.getValue("username"),
	            "avatar_url" => Application.Properties.getValue("avatarUrl"),
	            "content" => Application.Properties.getValue("content"),
	            "embeds" => [],
	            "components" => []
	        };
	  
	        var options = {                                            
  	 	        :method => Communications.HTTP_REQUEST_METHOD_POST,
   		        :headers => {"Content-Type" => Communications.REQUEST_CONTENT_TYPE_JSON},                                                    
   		        :responseType => Communications.HTTP_RESPONSE_CONTENT_TYPE_JSON
 	        };
	  
	        Communications.makeWebRequest(url, params, options, method(:onResponse));
	        return true;
	    }
	    return false;
	}
	
	function onResponse(status, data) as Boolean {
	    return true;
	}
}