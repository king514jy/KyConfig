package kyc.data
{
	/*<multiValue title="多个值列表设置：">
	<item name="播放器" getID="8" getName="c_play" linkID="null" type="play">
		<value name="播放"><![CDATA[b0x0]]></value>
		<value name="暂停"><![CDATA[b0x0]]></value>
		<value name="停止"><![CDATA[b0x0]]></value>
		<value name="上一个"><![CDATA[b0x0]]></value>
		<value name="下一个"><![CDATA[b0x0]]></value>
	</item>
	</multiValue>*/
	public class MultiValueItem extends ItemBase
	{
		/**
		 * 值的显示名称列表
		 */
		public var valueNameList:Vector.<String> = new Vector.<String>();
		/**
		 * 值列表
		 */
		public var valueList:Vector.<String> = new Vector.<String>();
		public function MultiValueItem()
		{
			super();
		}
	}
}