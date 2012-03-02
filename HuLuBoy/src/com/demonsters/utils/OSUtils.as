package com.demonsters.utils
{
	import flash.system.Capabilities;

	public class OSUtils
	{
			public static function os():String
			{
				var osInfo:String=Capabilities.os;
				osInfo=osInfo.toLowerCase();
				if(osInfo.indexOf("windows")!=-1)
					return "windows";
				else if(osInfo.indexOf("mac")!=-1)
					return "mac";
				else
					return "";
			}
	}
}