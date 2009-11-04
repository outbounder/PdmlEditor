package data.model
{
	[Bindable]
	public class PdmlFileNodeArg
	{
		public var argName:String;
		public var argValue:String;
		
		public function PdmlFileNodeArg(argXML:XML)
		{
			this.argName = argXML.name();
			this.argValue = argXML.text();
		}
		
		public function asXMLString():String
		{
			return "<"+this.argName+">"+this.argValue+"</"+this.argName+">";
		}
	}
}