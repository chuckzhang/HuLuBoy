package
{
	import com.demonsters.debugger.MonsterDebugger;
	import com.etm.core.etm_internal;
	
	import flash.display.DisplayObject;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.system.ApplicationDomain;
	import flash.system.Security;
	
	public class HuLuPreLoader extends Sprite
	{
		public function HuLuPreLoader()
		{
			Security.allowDomain("*");
			Security.allowInsecureDomain("*");
			root.addEventListener("allComplete", allCompleteHandler);
			var params:Object=loaderInfo.parameters;
			filter=params["f"]||"";
		}
		
		public static var mainRoot:DisplayObject;
		private var oldStage:Stage;
		
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
						if(mainRoot.stage)
						{
							MonsterDebugger.initialize(mainRoot);
							MonsterDebugger.trace(mainRoot,"Debugger Ready.");
							MonsterDebugger.etm_internal::send({command:"params",data:loadInfo.parameters});
						}
					}
				}
			}
		}
	}
}