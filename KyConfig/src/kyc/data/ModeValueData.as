
package kyc.data
{
	/*<modeValue title="方式选择参数设置:">
	<!-- name:参数名字,value:值,candidate:候选列表 -->
	<item name="操作端在显示端的方向:" getID="2" getName="direction" linkID="null" type="string" value="bottom" mode="下">
	<candidate value="left" mode="左" />
	<candidate value="right" mode="右" />
	<candidate value="top" mode="上" />
	<candidate value="bottom" mode="下" />
	<candidate value="embed" mode="内嵌" />
	</item>
	</modeValue>*/
	public class ModeValueData extends ValueBaseData
	{
		
		public function ModeValueData()
		{
		}
		override public function analyze(xmlList:XMLList):void
		{
			super.analyze(xmlList);
			var le:uint = xmlList.item.length();
			for(var i:int=0;i<le;i++)
			{
				var item:ModeValueItem = new ModeValueItem();
				item.name = String(xmlList.item[i].@name);
				item.getID = String(xmlList.item[i].@getID);
				item.getTips = String(xmlList.item[i].@getTips);
				item.getName = String(xmlList.item[i].@getName);
				item.getTips = String(xmlList.item[i].@getTips);
				item.linkID = String(xmlList.item[i].@linkID);
				item.value = String(xmlList.item[i].@value);
				item.mode = String(xmlList.item[i].@mode);
				var le2:uint = xmlList.item[i].candidate.length();
				for(var j:int=0;j<le2;j++)
				{
					item.candidateValueList.push(String(xmlList.item[i].candidate[j].@value));
					item.candidateModeList.push(String(xmlList.item[i].candidate[j].@mode));
				}
				this.itemList.push(item);
			}
		}
	}
}