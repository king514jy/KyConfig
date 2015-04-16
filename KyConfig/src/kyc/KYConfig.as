package kyc
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import kyc.data.NodeValueData;
	import kyc.events.AnalyzeEvent;
	import kyc.utils.Base64;

	/** 配置文件解析完成后发出 **/
	[Event(name="analyze_complete", type="kyc.events.AnalyzeEvent")]
	/**
	 * Example code:<listing version="3.0">
var kc:KYConfig = new KYConfig();
kc.loadConfig("config.kyc");
kc.addEventListener(AnalyzeEvent.ANALYZE_COMPLETE,onComplete);
function onComplete(e:AnalyzeEvent):void
{
	trace(kc.nodeList);
}
</listing>
	 */
	
	public class KYConfig extends EventDispatcher
	{
		private var _nodeList:Vector.<NodeValueData> = new Vector.<NodeValueData>();
		public function KYConfig()
		{
		}
		/**
		 * 数据节点列表
		 * @return nodeList
		 * 
		 */
		public function get nodeList():Vector.<NodeValueData>{ return _nodeList; }
		/**
		 * 加载配置文件
		 * @param kycURL 配置文件路径
		 * 
		 */
		public function loadConfig(kycURL:String):void
		{
			var urlLoader:URLLoader = new URLLoader();
			urlLoader.load(new URLRequest(kycURL));
			urlLoader.addEventListener(Event.COMPLETE,onComplete);
		}
		private function onComplete(e:Event):void
		{
			var urlLoader:URLLoader = e.target as URLLoader;
			var xml:XML = XML(Base64.decode(decryption(urlLoader.data)));
			//var xml:XML = XML(urlLoader.data);
			_nodeList.length = 0;
			var le:uint = xml.node.length();
			for(var i:int=0;i<le;i++)
			{
				var node:NodeValueData = new NodeValueData();
				node.analyzeNode(xml.node[i]);
				_nodeList.push(node);
			}
			dispatchEvent(new AnalyzeEvent(AnalyzeEvent.ANALYZE_COMPLETE));
		}
		/**
		 *通过title获取节点数据 
		 * @param getName 
		 * @return NodeValueData
		 * 
		 */
		public function getNodeFromName(getName:String):NodeValueData
		{
			for each(var node:NodeValueData in _nodeList)
			{
				if(node.getName == getName)
					return node;
			}
			return null;
		}
		/**
		 *通过节点ID获取节点数据 
		 * @param getID 
		 * @return NodeValueData
		 * 
		 */
		public function getNodeFromID(getID:String):NodeValueData
		{
			for each(var node:NodeValueData in _nodeList)
			{
				if(node.getID == getID)
					return node;
			}
			return null;
		}
		/**
		 *是否含有该ID的节点数据
		 * @param nodeID
		 * @return Boolean
		 * 
		 */
		public function hasID(getID:String):Boolean
		{
			for each(var nb:NodeValueData in _nodeList)
			{
				if(nb.getID == getID)
					return true;
			}
			return false;
		}
		/**
		 * 是否含有该title的节点数据
		 * @param title
		 * @return 
		 * 
		 */
		public function hasName(getName:String):Boolean
		{
			for each(var nb:NodeValueData in _nodeList)
			{
				if(nb.getName == getName)
					return true;
			}
			return false;
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
			var obj:Object;
			for each(var nb:NodeValueData in _nodeList)
			{
				obj =  nb.getValueFromID(getID,getItem);
				if(obj!=null)
					return obj;
			}
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
			var obj:Object;
			for each(var nb:NodeValueData in _nodeList)
			{
				obj = nb.getValueFromName(getName,getItem);
				if(obj!=null)
					return obj;
			}
			return null;
		}
		private static function decryption(str:String):String
		{
			var vc:Array = new Array(4,1,2,0,3);
			var newStr:String;
			var s0:String = str.slice(0,10);
			var s1:String = str.substr(17,5);
			var s2:String = str.slice(22); 
			var s3:String="";
			for(var qin:int;qin<5;qin++)
			{
				var ss:String = s1.charAt(vc[qin]);
				s3=s3+ss;
			}
			newStr = s0+s3+s2;
			return newStr;
		}
	}
}