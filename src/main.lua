--
init("0", 1)
setScreenScale(1536,2048)
--init("0", 1)


width,height = getScreenSize()
sysLog("width: "..width.."; height: "..height)


require "utils"
require "party_info"
require "yuhun_info"
require "inCombat"
require "tansuo"
require "xuche"
require "tupo"
require "spec"
require "richang"
require 'xsfy'
pos = require("bblibs/pos")
math.randomseed(mTime())
dict = createOcrDict("dict.txt") 
id = createHUD()     --创建一个HUD
my_toast(id,"欢迎使用大便脚本！")     --显示HUD内容

init_ret,init_results = showUI("Initial.json")
if init_ret==0 then	
	my_toast(id, "您选择了取消，停止脚本运行")
	lua_exit()
else
	init("0", tonumber(init_results['100'])+1)
end

function main()
  ret,results = showUI("ui.json")
  if ret==0 then	
    toast("您选择了取消，停止脚本运行")
    lua_exit()
  else
    --toast_screensize()
    --↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓获取UI配置↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
		_G.friend_quest_action = results['01']
		if _G.friend_quest_action == '0' then
			my_toast(id, '接受悬赏: 是')
		else
			my_toast(id, '接受悬赏: 否')
		end
		sysLog('接受悬赏状态: '.._G.friend_quest_action)
		_G.exist_method = results['02']
		if _G.exist_method == '0' then
			my_toast(id, '结束锁屏: 是')
			_G.exist_method = true
		else
			my_toast(id, '结束锁屏: 否')
			_G.exist_method = false
		end
		sysLog('结束锁屏状态: '..tostring(_G.exist_method))
		
    -------------------------------------------个人突破--------------------------------------
    if results['100'] == '0' then	
      tupo_ret,tupo_results = showUI("tupo.json")
      main_tupo(tupo_ret,tupo_results)
      
      -------------------------------------------悬赏封印--------------------------------------
    elseif results['100'] == '1' then
      toast("功能处于测试版本,请阅读脚本说明以及教程后进行设置,若出现问题请加q群反馈bug")
      悬赏封印_ret,悬赏封印_results = showUI("xsfy.json")
      main_xsfy(悬赏封印_ret,悬赏封印_results)
      
      -------------------------------------------御魂10--------------------------------------
    elseif results['100'] == '2' then
      yh_ret,yh_results = showUI("yuhun.json")
      main_yh(yh_ret,yh_results)
      -------------------------------------------阴阳寮续车--------------------------------------	
    elseif results['100'] == '3' then
      xuche_ret, xuche_results = showUI("xuche.json")
			main_xuche(xuche_ret, xuche_results)
      -------------------------------------------探索--------------------------------------
    elseif results['100'] == '4' then
      ts_ret,ts_results = showUI("free_tansuo.json")
      main_freets(ts_ret, ts_results)
      
      -------------------------------------------业原火--------------------------------------	
    elseif results['100'] == '5' then
      enter_yeyuanhuo()
      yyh_ret,yyh_results = showUI("yeyuanhuo.json")
      main_yeyuanhuo(yyh_ret,yyh_results)
      -------------------------------------------妖气封印--------------------------------------	
    elseif results['100'] == '6' then
      yqfy_ret,yqfy_results = showUI("yqfy.json")
      main_yqfy(yqfy_ret, yqfy_results)
      
      -------------------------------------------日常杂项--------------------------------------	
    elseif results['100'] == '7' then
      richang_ret,richang_results = showUI("richang.json")
      main_richang(richang_ret,richang_results)
      -------------------------------------------一条龙挂机--------------------------------------	
    elseif results['100'] == '9' then
      dialog('功能马上完成, 敬请期待')
      -------------------------------------------开发中--------------------------------------	
		elseif results['100'] == '8' then
			jx_ret,jx_results = showUI("juexing.json")
      main_jx(jx_ret,jx_results)
    else 
      toast("您什么都没有设置")
      lua_exit()
    end
    my_exist(_G.exist_method)
  end
end


main()
--/User/Library/XXIDEHelper/xsp/Temp/5星.png