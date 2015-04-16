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
	public class MultiValueData extends ValueBaseData
	{
		public function MultiValueData()
		{
			super();
		}
		override public function analyze(xmlList:XMLList):void
		{
			super.analyze(xmlList);
			var le:uint = xmlList.item.length();
			for(var i:int=0;i<le;i++)
			{
				var item:MultiValueItem = new MultiValueItem();
				item.name = String(xmlList.item[i].@name);
				item.getID = String(xmlList.item[i].@getID);
				item.getTips = String(xmlList.item[i].@getTips);
				item.getName = String(xmlList.item[i].@getName);
				item.getTips = String(xmlList.item[i].@getTips);
				item.linkID = String(xmlList.item[i].@linkID);
				var le2:uint = xmlList.item[i].value.length();
				for(var j:int=0;j<le2;j++)
				{
					item.valueNameList.push(String(xmlList.item[i].value[j].@name));
					item.valueList.push(String(xmlList.item[i].value[j]));
				}
				this.itemList.push(item);
			}
		}
	}
}