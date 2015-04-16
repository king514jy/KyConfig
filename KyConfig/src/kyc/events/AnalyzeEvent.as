package kyc.events
{
	import flash.events.Event;
	
	public class AnalyzeEvent extends Event
	{
		/**
		 * 数据解析完成
		 */
		public static const ANALYZE_COMPLETE:String = "analyze_complete";
		public function AnalyzeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}