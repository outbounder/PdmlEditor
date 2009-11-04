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
		
		public function asXMLString():String
		{
			var result:StringBuf = new StringBuf();
			result.add("<"+this.method);
			if(this.classname != "")
				result.add(" classname='"+this.classname+"'");
			result.add(">");
			for each(var arg:PdmlFileNodeArg in this.args)
				result.add(arg.asXMLString());
			result.add("</"+this.method+">");
			return result.toString();
		}
	}
}