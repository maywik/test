package;

import openfl.display.Sprite;
import AView;
import IController;
import Model;
import TextView;
import XMLData;
import openfl.Lib;

/**
 * ...
 * @author Vadym
 */
class Main extends Sprite 
{
	private var model:Model;
	private var controller:IController;
	private var tabView:AView;
	private var textContainer:AView;
	private var xmlTabs:XMLData;

	public function new() 
	{
		super();
		
		Lib.current.stage.color = 0xA0A0A0;
		
		initTabNavigation();
	}
	
	private function initTabNavigation():Void {
		model = new Model();
		controller = new TabController(model);
		
		var xmlFile = 'tabs.xml';
		xmlTabs = new XMLData(xmlFile);
		var tabs = xmlTabs.getData();
		
		var i:Int = 0;
		var activeTabId:String = '';
		for (tab in tabs.keys()) {
			tabView = new TabView(model, controller, tab, tabs[tab].title);
			addChild(tabView);
			tabView.graphics.beginFill(tabs[tab].color);
			tabView.graphics.drawRect(0, 0, 100, 30);
			tabView.x = i * 105;
			tabView.y = 0;
			tabView.buttonMode = true;
			i++;
			
			if (tabs[tab].active) {
				activeTabId = tab;
			}
		}
		
		textContainer = new TextView(model, tabs[activeTabId].text);
		addChild(textContainer);
		textContainer.x = 0;
		textContainer.y = 35;
		textContainer.width = 400;
	}
}
