package kyc.data
{
	public class ItemBase
	{
		/**
		 * 条目名称
		 */
		public var name:String;
		/**
		 * 条目ID
		 */
		public var getID:String;
		/**
		 * 条目获取的名称
		 */
		public var getName:String;
		/**
		 * 条目说明
		 */
		public var getTips:String;
		/**
		 * 条目关联的另外条目的ID
		 */
		public var linkID:String;
		public function ItemBase()
		{
		}
	}
}