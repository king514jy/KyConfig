package kyc.data
{
	/*<numValue title="数字参数设置:">
		<!-- name:参数名字，value:值，min:最小值,max:最大值，offset:增量,digital:数值保留的小数位数 -->
		<item name="拍照等待时间:" getID="1" getName="waitNumber" linkID="null",type="number" value="3" min="0" max="9" offset="1" digital="0" />
			</numValue>*/
	public class NumValueData extends ValueBaseData
	{
		
		public function NumValueData()
		{
			
		}
		override public function analyze(xmlList:XMLList):void
		{
			super.analyze(xmlList);
			var le:uint = xmlList.item.length();
			for(var i:int=0;i<le;i++)
			{
				var item:NumValueItem = new NumValueItem();
				item.name = String(xmlList.item[i].@name);
				item.getID = String(xmlList.item[i].@getID);
				item.getName = String(xmlList.item[i].@getName);
				item.getTips = String(xmlList.item[i].@getTips);
				item.linkID = String(xmlList.item[i].@linkID);
				item.value = Number(xmlList.item[i].@value);
				item.min = Number(xmlList.item[i].@min);
				item.max = Number(xmlList.item[i].@max);
				item.offset = Number(xmlList.item[i].@offset);
				item.digital = Number(xmlList.item[i].@digital);
				this.itemList.push(item);
			}
		}
	}
}