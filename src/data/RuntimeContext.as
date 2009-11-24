package data
{
	public class RuntimeContext
	{
		private static var _rootFolder:String;
		
		public function RuntimeContext()
		{
		}
		
		public function get rootFolder():String
		{
			return _rootFolder;
		}
		
		public function set rootFolder(value:String):void
		{
			_rootFolder = value;			
		}
	}
}