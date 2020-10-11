package;

import Model;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.text.TextField;

/**
 * ...
 * @author Vadym
 */
class TabView extends AView
{
	private var model: Model;
	private var controller:IController;
	private var tab: Sprite;
	private var id:String;
	private var tField:TextField;

	public function new(model:Model, controller:IController, id:String, tabTitle:String) 
	{
		super();
		
		this.model = model;
		model.addEventListener(Event.CHANGE, changed);
		
		this.controller = controller;
		this.id = id;
		
		this.tab = new Sprite();
		addChild(this.tab);
		
		tField = new TextField();
		tField.visible = true; 
        tField.selectable = false; 
        tField.width = 350;    
        tField.height = 200;
        tField.textColor = 0x4D4D4D;
        tField.text = tabTitle;
        this.tab.addChild(tField);
		
		this.addEventListener(MouseEvent.CLICK, update);
	}
		
	private function update(e: Dynamic):Void {
		this.controller.update(e.currentTarget.id);
	}
		
	private function changed(e: Dynamic):Void {
		if (this.model.options != null) {
			for (tabNm in this.model.options.keys()) {
			  var tabOptions = this.model.options.get(tabNm);
			  if (tabNm == this.id ) { 
				this.tab.graphics.beginFill(tabOptions.color);
				this.tab.graphics.drawRect(0, 0, 100, 30);
			  }
			}
		}
	}
}