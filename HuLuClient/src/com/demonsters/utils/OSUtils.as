package com.demonsters.utils
{
	import flash.system.Capabilities;

	public class OSUtils
	{
			public static function os():String
			{
				var osInfo:String=Capabilities.os;
				osInfo=osInfo.toLowerCase();
				if(osInfo.indexOf("windows xp")!=-1)
					return "xp";
				else if(osInfo.indexOf("windows")!=-1)
					return "win7";
				else if(osInfo.indexOf("mac")!=-1)
					return "mac";
				else
					return "";
			}
	}
}