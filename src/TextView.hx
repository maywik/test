package;

import Model;
import openfl.display.Sprite;
import openfl.text.TextField;
import openfl.events.Event;
import openfl.events.MouseEvent;

/**
 * ...
 * @author Vadym
 */
class TextView extends AView
{
	private var model: Model;
	private var tField:TextField;

	public function new(model:Model, text:String) 
	{
		super();
		
		this.model = model;
		model.addEventListener(Event.CHANGE, changed);
		
		var tWrap = new Sprite();
		tField = new TextField();
		addChild(tWrap);
		tWrap.graphics.beginFill(0x24AFC4);
		tWrap.graphics.drawRect(0, 0, 400, 200);
		tWrap.x = 0;
		tWrap.y = 0;
            
        tField.visible = true; 
        tField.selectable = false; 
        tField.width = 400;    
        tField.height = 200;
        tField.textColor = 0x4D4D4D;
        tField.text = text;
        tWrap.addChild(tField);
		
		tField.addEventListener(MouseEvent.MOUSE_WHEEL, onScroll);
	}
	
	private function onScroll(e:MouseEvent):Void {
		if (e.delta > 0) {
			this.tField.scrollH += 30;
		} else if (e.delta < 0) {
			this.tField.scrollH -= 30;
		}
	}
	
	private function changed(e: Dynamic):Void {
		if (this.model.options != null) {
			for (tabNm in this.model.options.keys()) {
			  var tabOptions = this.model.options.get(tabNm);
			  if (tabOptions.active) { 
				this.tField.text = tabOptions.text;
				this.tField.scrollH = 0;
			  }
			}
		}
	}
}