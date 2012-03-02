package
{
	import com.demonsters.debugger.MonsterDebugger;
	
	import flash.display.DisplayObject;
	import flash.display.LoaderInfo;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.system.Security;
	import flash.ui.Keyboard;
	
	public class HuLuPreLoader extends Sprite
	{
		public function HuLuPreLoader()
		{
			Security.allowDomain("*");
			Security.allowInsecureDomain("*");
			this.root.addEventListener("allComplete", allCompleteHandler);
		}
		
		
		private var mainRoot:DisplayObject;
		
		protected function allCompleteHandler(event:Event):void
		{
			var loadInfo:LoaderInfo=event.target as LoaderInfo;
			mainRoot=loadInfo.content.root;
			MonsterDebugger.initialize(mainRoot);
			MonsterDebugger.trace(mainRoot,"Debugger Ready.");
		}
	}
}