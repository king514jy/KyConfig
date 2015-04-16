package kyc.data
{
	public class ModeValueItem extends ItemBase
	{
		/**
		 * 值
		 */
		public var value:String;
		/**
		 * 当前值的显示名称
		 */
		public var mode:String;
		/**
		 * 供选择的值列表
		 */
		public var candidateValueList:Vector.<String> = new Vector.<String>();
		/**
		 * 供选择的显示名称列表
		 */
		public var candidateModeList:Vector.<String> = new Vector.<String>();
		public function ModeValueItem()
		{
			
		}
	}
}