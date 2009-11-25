package data.model
{
	import flash.filesystem.File;
	
	import mx.collections.ArrayCollection;

	[Bindable]
	public class PdmlFile
	{
		public var name:String = null;
		public var rootTagName:String = "pdml";
		public var parser:String = "org.dassista.modules.parsers.ActionPdml";
		public var classname:String = "";
		public var nodes:ArrayCollection = new ArrayCollection();
		
		public function PdmlFile(fileXML:XML)
		{
			if(fileXML != null)
			{
				this.parser = fileXML.@parser;
				this.classname = fileXML.@classname;
				this.rootTagName = fileXML.name();
				
				for each(var node:XML in fileXML.children())
				{
					if("@classname" in node)
						this.nodes.addItem(new PdmlFileNode(node));
					else
						this.nodes.addItem(new PdmlFileNodeArg(node));
				}
			}
		}
		
		public function asXMLString():String
		{
			var result:StringBuf = new StringBuf();
			result.add("<"+this.rootTagName);
			if(this.classname != "")
				result.add(" classname='"+this.classname+"'");
			result.add(" parser='"+this.parser+"'");
			result.add(">");
			for each(var node:Object in this.nodes)
				result.add(node.asXMLString());
			result.add("</"+this.rootTagName+">");
			return result.toString();
		}
	}
}