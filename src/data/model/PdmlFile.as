package data.model
{
	import mx.collections.ArrayCollection;

	[Bindable]
	public class PdmlFile
	{
		public var parser:String;
		public var classname:String;
		public var nodes:ArrayCollection = new ArrayCollection();
		
		public function PdmlFile(fileXML:XML)
		{
			if(fileXML != null)
			{
				this.parser = fileXML.@parser;
				this.classname = fileXML.@classname;
				for each(var node:XML in fileXML.children())
				{
					if("@classname" in node)
						this.nodes.addItem(new PdmlFileNode(node));
					else
						this.nodes.addItem(new PdmlFileNodeArg(node));
				}
			}
		}
	}
}