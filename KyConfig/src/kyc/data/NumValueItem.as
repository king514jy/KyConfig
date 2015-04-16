package kyc.data
{
	public class NumValueItem extends ItemBase
	{
		/**
		 * 值
		 */
		public var value:Number;
		/**
		 * 供编辑器设置用：最小值
		 */
		public var min:Number;
		/**
		 * 供编辑器设置用：最大值
		 */
		public var max:Number;
		/**
		 * 供编辑器设置用：变化时偏移量
		 */
		public var offset:Number;
		/**
		 * 保留的小数位数
		 */
		public var digital:Number;
		public function NumValueItem()
		{
		}
	}
}