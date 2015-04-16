package kyc.data
{
	/*<singleValue title="单个值设置：">
		<item name="开" getID="6" getName="c_open" linkID="null" type="button"><![CDATA[b0x0]]></item>
		<item name="关" getID="7" getName="c_close" linkID="null" type="button"><![CDATA[b0x0]]></item>
	</singleValue>*/
	public class SingleValueData extends ValueBaseData
	{
		public function SingleValueData()
		{
			super();
		}
		override public function analyze(xmlList:XMLList):void
		{
			super.analyze(xmlList);
			var le:uint = xmlList.item.length();
			for(var i:int=0;i<le;i++)
			{
				var item:SingleValueItem = new SingleValueItem();
				item.name = String(xmlList.item[i].@name);
				item.getID = String(xmlList.item[i].@getID);
				item.getTips = String(xmlList.item[i].@getTips);
				item.getName = String(xmlList.item[i].@getName);
				item.linkID = String(xmlList.item[i].@linkID);
				item.type = String(xmlList.item[i].@type);
				item.value = String(xmlList.item[i]);
				this.itemList.push(item);
			}
		}
	}
}