package data.model
{
	import mx.collections.ArrayCollection;

	[Bindable]
	public class PdmlFileNode
	{
		public var classname:String;
		public var method:String;
		public var args:ArrayCollection = new ArrayCollection();
		
		public function PdmlFileNode(nodeXML:XML)
		{
			this.method = nodeXML.name();
			this.classname = nodeXML.@classname;
			for each(var arg:XML in nodeXML.children())
			{
				this.args.addItem(new PdmlFileNodeArg(arg));
			}
		}
	}
}