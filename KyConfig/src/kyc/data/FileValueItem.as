package kyc.data
{
	public class FileValueItem extends ItemBase
	{
		/*<fileValue title="文件选择:">
			<!-- name:参数名字,文件地址 -->
			<item name="场景背景:" getID="3" getName="bg" linkID="null" type="image" tips="选择图片" extension="*.jpg;*.png"><![CDATA[bg.jpg]]></item>
			</fileValue>*/
		/**
		 * 文件弹出框上提示文字
		 */
		public var tips:String;
		/**
		 * 支持打开的文件扩展
		 * file.browseForOpen(tips, [new FileFilter("documents",extension)]);
		 */
		public var extension:String;
		/**
		 * 文件地址
		 */
		public var value:String;
		public function FileValueItem()
		{
		}
	}
}