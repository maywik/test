package;

import IController;
import Model;
import XMLData;

/**
 * ...
 * @author Vadym
 */
class TabController implements IController
{
	private var model:Model;
	private var xmlTabs:XMLData;

	public function new(model:Model) 
	{
		this.model = model;
		
		var xmlFile = 'tabs.xml';
		xmlTabs = new XMLData(xmlFile);
	}
	
	public function update(id:String):Void {
		var updatedOptions = this.model.options;
		
		if (!updatedOptions.exists(id)) {
			updatedOptions = xmlTabs.getData();
		}
		
		for (tabNm in updatedOptions.keys()) {
			var tabOptions = updatedOptions.get(tabNm);
			updatedOptions.set(tabNm, {title: tabOptions.title, color: 0xC2C2C2, active: false, text: tabOptions.text});
			
			if (id == tabNm) {
				updatedOptions.set(tabNm, {title: tabOptions.title, color: 0x24AFC4, active: true, text: tabOptions.text});
			}
		}
		
		this.model.options = updatedOptions;
	}
}