package;

import openfl.events.EventDispatcher;
import openfl.events.Event;
import haxe.ds.Map;

/**
 * ...
 * @author Vadym
 */
class Model extends EventDispatcher
{
	
	@:isVar public var options(get, set):Map<String, { title:String, color: Int, active: Bool, text: String }> = [];

	public function new() 
	{
		super();
	}
	
	function get_options() {
		return this.options;
	}
	
	function set_options(data) {
		this.options = data;
		
		dispatchEvent(new Event(Event.CHANGE));
		
		return this.options;
	}
}