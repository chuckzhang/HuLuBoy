package
{
	import com.demonsters.debugger.MonsterDebugger;
	
	import flash.display.DisplayObject;
	import flash.display.LoaderInfo;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.system.Security;
	
	public class HuLuPreLoader extends Sprite
	{
		public function HuLuPreLoader()
		{
			Security.allowDomain("*");
			Security.allowInsecureDomain("*");
			this.root.addEventListener("allComplete", allCompleteHandler);
			
			//decode url to get the filter
			var url:String=loaderInfo.loaderURL;
			try
			{
				var params:Array=url.split("?")[1].split("&");
				for each(var param:String in params)
				{
					var index:int=param.indexOf("f=");
					if(index!=-1)
					{
						filter=param.replace("f=","");
					}
				}
			}
			catch(e:Error)
			{
				
			}
		}
		
		public static var mainRoot:DisplayObject;
		private var filter:String="";
		
		protected function allCompleteHandler(event:Event):void
		{
			var loadInfo:LoaderInfo=event.target as LoaderInfo;
			if(loadInfo && loadInfo.url)
			{
				//the target isn't preloader himself &&the target isn't debugger && load file is a swf && the swf is main swf 
				if(loadInfo.url.indexOf("HuLuPreLoader.swf") == -1&& loadInfo.url.indexOf("app:/HuLuClient.swf")==-1&& loadInfo.contentType == "application/x-shockwave-flash" && loadInfo.url==loadInfo.loaderURL)
				{
					if(loadInfo.url.indexOf(filter)!=-1)//the swf fit the filter
					{
						mainRoot=loadInfo.content.root;
						MonsterDebugger.initialize(mainRoot);
						MonsterDebugger.trace(mainRoot,"Debugger Ready.");
					}
				}
			}
		}
	}
}