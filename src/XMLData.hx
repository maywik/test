package;

import haxe.xml.Access;
import lime.system.System;
import sys.io.File;
import haxe.io.Path;

/**
 * ...
 * @author Vadym
 */
class XMLData 
{
	private var xmlData:Map<String, { title:String, color: Int, active: Bool, text: String }>= [];

    public function new(xmlFile:String):Void
    {
		var appDir:String = Path.normalize(System.applicationDirectory).split('test')[0];
        var xml = Xml.parse(File.getContent(appDir + "test/assets/" + xmlFile ));
		var access = new haxe.xml.Access(xml.firstElement());
		
		buildData(access);
    }

    private function buildData(access:Access):Void
    {
		var tabs = access.node.tabs;
		for (p in tabs.nodes.tab) {
		  var node = p.node;
		  
		  this.xmlData.set(p.att.id, {
			 title: node.title.innerData,
			 color: Std.parseInt(node.color.innerData),
			 active: (node.active.innerData == 'true') ? true : false,
			 text: node.text.innerData
		 });
		}
    }
	
	public function getData():Map<String, { title:String, color: Int, active: Bool, text: String }> {
		return this.xmlData;
	}
	
}