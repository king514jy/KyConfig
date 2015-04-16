package kyc.data
{
	/*<singleValue title="单个值设置：">
	<item name="开" getID="6" getName="c_open" linkID="null" type="button"><![CDATA[b0x0]]></item>
	<item name="关" getID="7" getName="c_close" linkID="null" type="button"><![CDATA[b0x0]]></item>
	</singleValue>*/
	public class SingleValueItem extends ItemBase
	{
		/**
		 * 值
		 */
		public var value:String;
		/**
		 * 值类型
		 * @see kyc.type.DataType
		 */
		public var type:String;
		public function SingleValueItem()
		{
			super();
		}
	}
}