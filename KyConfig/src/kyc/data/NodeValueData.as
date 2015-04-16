package kyc.data
{
	import flash.events.EventDispatcher;
	
	import kyc.type.DataType;
	
	public class NodeValueData extends EventDispatcher
	{
		/**
		 * 数字类数据
		 */
		public var numData:NumValueData;
		/**
		 * 方式选择类数据
		 */
		public var modeData:ModeValueData;
		/**
		 * 文件选择类数据
		 */
		public var fileData:FileValueData;
		/**
		 * 单值类数据
		 */
		public var singleData:SingleValueData;
		/**
		 * 多值类数据
		 */
		public var multiData:MultiValueData;
		/**
		 * 标题
		 */
		public var title:String;
		/**
		 * id
		 */
		public var getID:String;
		/**
		 * getName
		 */
		public var getName:String;
		/**
		 * 提示说明
		 */
		public var getTips:String;
		public function NodeValueData()
		{
			
		}
		/**
		 * 解析数据
		 * @param xml
		 * 
		 */
		public function analyzeNode(xml:XML):void
		{
			title = String(xml.@title);
			getID = String(xml.@getID);
			getName = String(xml.@getName);
			getTips = String(xml.@getTips);
			if(xml.hasOwnProperty("numValue"))
			{
				numData = null;
				numData = new NumValueData();
				numData.analyze(xml.numValue);
			}
			if(xml.hasOwnProperty("modeValue"))
			{
				modeData = null;
				modeData = new ModeValueData();
				modeData.analyze(xml.modeValue);
			}
			if(xml.hasOwnProperty("fileValue"))
			{
				fileData = null;
				fileData = new FileValueData();
				fileData.analyze(xml.fileValue);
			}
			if(xml.hasOwnProperty("singleValue"))
			{
				singleData = null;
				singleData = new SingleValueData();
				singleData.analyze(xml.singleValue);
			}
			if(xml.hasOwnProperty("multiValue"))
			{
				multiData = null;
				multiData = new MultiValueData();
				multiData.analyze(xml.multiValue);
			}
		}
		/**
		 * 通过ID获取数据，getItem为false返回条目的具体值，getItem为true返回整个条目.默认为false
		 * @param getID id
		 * @param getItem
		 * @return *
		 * 
		 */
		public function getValueFromID(getID:String,getItem:Boolean=false):*
		{
			if(numData && numData.hasID(getID))
			{
				//trace("toNum查找："+getName);
				var ni:NumValueItem = numData.getValueFromID(getID) as NumValueItem;
				if(getItem)
					return ni;
				else
					return ni.value;
			}
			if(modeData && modeData.hasID(getID))
			{
				//trace("toMode查找："+getName);
				var mi:ModeValueItem = modeData.getValueFromID(getID) as ModeValueItem;
				if(getItem)
					return mi;
				else
					return mi.value;
			}
			if(fileData && fileData.hasID(getID))
			{
				//trace("toFile查找："+getName);
				var fi:FileValueItem = fileData.getValueFromID(getID) as FileValueItem;
				if(getItem)
					return fi;
				else
					return fi.value;
			}
			if(singleData && singleData.hasID(getID))
			{
				//trace("toSingle查找："+getName);
				var si:SingleValueItem = singleData.getValueFromID(getID) as SingleValueItem;
				if(getItem)
				{
					return si;
				}
				else
				{
					switch(si.type)
					{
						case DataType.NUMBER:
							return Number(si.value);
							break
						case DataType.STRING:
							return si.value;
							break;
						case DataType.COLOR:
							return Number(si.value);
							break;
					}
				}
			}
			if(multiData && multiData.hasID(getID))
			{
				//trace("toMulti查找："+getName);
				var multiItem:MultiValueItem = multiData.getValueFromID(getID) as MultiValueItem;
				if(getItem)
					return multiItem;
				else
					return multiItem.valueList;
			}
			//trace("no");
			return null;
		}
		/**
		 * 通过name获取数据，getItem为false返回条目的具体值，getItem为true返回整个条目.默认为false
		 * @param getName name
		 * @param getItem
		 * @return *
		 * 
		 */
		public function getValueFromName(getName:String,getItem:Boolean=false):*
		{
			if(numData && numData.hasName(getName))
			{
				//trace("toNum查找："+getName);
				var ni:NumValueItem = numData.getValueFromName(getName) as NumValueItem;
				if(getItem)
					return ni;
				else
					return ni.value;
			}
			if(modeData && modeData.hasName(getName))
			{
				//trace("toMode查找："+getName);
				var mi:ModeValueItem = modeData.getValueFromName(getName) as ModeValueItem;
				if(getItem)
					return mi;
				else
					return mi.value;
			}
			if(fileData && fileData.hasName(getName))
			{
				//trace("toFile查找："+getName);
				var fi:FileValueItem = fileData.getValueFromName(getName) as FileValueItem;
				if(getItem)
					return fi;
				else
					return fi.value;
			}
			if(singleData && singleData.hasName(getName))
			{
				//trace("toSingle查找："+getName);
				var si:SingleValueItem = singleData.getValueFromName(getName) as SingleValueItem;
				if(getItem)
				{
					return si;
				}
				else
				{
					switch(si.type)
					{
						case DataType.NUMBER:
							return Number(si.value);
							break
						case DataType.STRING:
							return si.value;
							break;
						case DataType.COLOR:
							return Number(si.value);
							break;
					}
				}
			}
			if(multiData && multiData.hasName(getName))
			{
				//trace("toMulti查找："+getName);
				var multiItem:MultiValueItem = multiData.getValueFromName(getName) as MultiValueItem;
				if(getItem)
					return multiItem;
				else
					return multiItem.valueList;
			}
			//trace("no");
			return null;
		}
	}
}