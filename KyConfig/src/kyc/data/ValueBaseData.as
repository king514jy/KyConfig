package kyc.data
{
	import flash.events.EventDispatcher;
	
	public class ValueBaseData extends EventDispatcher
	{
		/**
		 * 类型数据的标题
		 */
		public var title:String;
		/**
		 * 条目列表
		 */
		public var itemList:Vector.<ItemBase> = new Vector.<ItemBase>();
		public function ValueBaseData()
		{
			
		}
		/**
		 * 解析xml
		 * @param xmlList
		 * 
		 */
		public function analyze(xmlList:XMLList):void
		{
			itemList.length = 0;
			title = String(xmlList.@title);
		}
		/**
		 * 通过id获取条目
		 * @param id id
		 * @return ItemBase
		 * 
		 */
		public function getValueFromID(id:String):ItemBase
		{
			for each(var nvi:ItemBase in itemList)
			{
				if(nvi.getID == id)
					return nvi;
			}
			return null;
		}
		/**
		 * 通过getName获取条目
		 * @param getName
		 * @return ItemBase
		 * 
		 */
		public function getValueFromName(getName:String):ItemBase
		{
			for each(var nvi:ItemBase in itemList)
			{
				if(nvi.getName == getName)
					return nvi;
			}
			return null;
		}
		/**
		 *是否含有该ID的数据
		 * @param getID
		 * @return Boolean
		 * 
		 */
		public function hasID(getID:String):Boolean
		{
			for each(var ib:ItemBase in itemList)
			{
				if(ib.getID == getID)
					return true;
			}
			return false;
		}
		/**
		 * 是否含有该名字的数据
		 * @param getName
		 * @return 
		 * 
		 */
		public function hasName(getName:String):Boolean
		{
			for each(var ib:ItemBase in itemList)
			{
				if(ib.getName == getName)
					return true;
			}
			return false;
		}
	}
}