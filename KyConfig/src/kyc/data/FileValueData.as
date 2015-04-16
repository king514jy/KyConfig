package kyc.data
{
	/*<fileValue title="文件选择:">
		<!-- name:参数名字,文件地址 -->
		<item name="场景背景:" getID="3" getName="bg" linkID="null" type="image" tips="选择图片" extension="*.jpg;*.png"><![CDATA[bg.jpg]]></item>
		</fileValue>*/
	public class FileValueData extends ValueBaseData
	{
		public function FileValueData()
		{
			super();
		}
		override public function analyze(xmlList:XMLList):void
		{
			super.analyze(xmlList);
			var le:uint = xmlList.item.length();
			for(var i:int=0;i<le;i++)
			{
				var item:FileValueItem = new FileValueItem();
				item.name = String(xmlList.item[i].@name);
				item.getID = String(xmlList.item[i].@getID);
				item.getName = String(xmlList.item[i].@getName);
				item.getTips = String(xmlList.item[i].@getTips);
				item.linkID = String(xmlList.item[i].@linkID);
				item.value = String(xmlList.item[i]);
				item.tips = String(xmlList.item[i].@tips);
				item.extension = String(xmlList.item[i].@extension);
				this.itemList.push(item);
			}
		}
	}
}