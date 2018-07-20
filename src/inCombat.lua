-------------------------------------------标记类型a--------------------------------------
--[[
mark_cases = switch {
  [0] = function() end,
  [1] = function() tap(1060, 270) end, --标记主目标
	-----yh标记----
	[2] = function() tap(530, 560) end,		--标记左边
	[3] = function() tap(1076, 397) end,  --标记中间(灯，蛇）
	[4] = function() tap(1580, 535)	end,	--标记右边
	[5] = function() first_mark()	end, --标记二口女
	[6] = function() end,　-- 不标记
	----------探索---------------
	[10] = function() end,
	[11] = function() tap(1060, 311) end,
	[12] = function() tap(759, 443) end,

}
--]]
mark_cases = switch{
[0] = function() end,
[1] = function() tap(1060, 270) end, --标记主目标
-----yh标记----
[2] = function() tap(530, 560) end,  --标记左边
[3] = function() tap(1076, 397) end,  --标记中间(灯，蛇）
[4] = function() tap(1580, 535)	end,  --标记右边
[5] = function() first_mark()	end,  --标记二口女
[6] = function() end,                 --不标记
[7] = function() last_mark() end,			--先左后右
----------探索---------------
[10] = function() end,										
[11] = function() tap(1060, 311) end,		--标记中间	
[12] = function() tap(759, 443) end,    --标记左边
}
	

function if_mark(tap_situation, time_limit)
	local time_limit = time_limit or 10000
	if tap_situation ~= 6 and tap_situation ~= 0 then
		--sysLog('if_mark'..tap_situation)
		local initial_t = mTime()	
		accept_quest()
		local x, y = myFindColor(战斗标记)
		if x ~= -1 then
			my_toast(id, '队友已标记')
			do return end
		end
		local force_skip_t = mTime() - initial_t
		while x == -1 do
			sysLog(force_skip_t)
			mark_cases:case(tap_situation)
			mSleep(200)
			x, y = myFindColor(战斗标记)
			force_skip_t = mTime() - initial_t
			if force_skip_t >= time_limit then
				my_toast(id, '标记超时, 直接下一轮标记')
				do return end
			end
		end
		my_toast(id,'为您标记好了')
		mSleep(1000)
	end
end


-------------------------------------------开始战斗--------------------------------------
function begin()
	accept_quest()
  local x, y = findColorInRegionFuzzy(0xf3b25e, 95, 1457, 1121, 1511, 1128)
  if x > -1 then
    tap(1547, 1157)
  end
end

-------------------------------------------准备--------------------------------------
function if_start_combat()
	my_toast(id, '等待队友准备中...')
	mSleep(100)
	wait_for_leaving_state(准备还有鼓)
end

function if_start_combat_intime()
	accept_quest()
	local initial_t = mTime()
	local limit_t = mTime() - initial_t
	local ready_x, ready_y = myFindColor(准备)
	--sysLog(limit_t)
	while limit_t <= 30000 do
		if ready_x > -1 then
			sysLog('可以开始战斗')
			return true
		else
			local count_limit = 30000 - limit_t
			my_toast(id, '防卡死倒计时: '..string.format("%.2d:%.2d", 0, count_limit/1000))
			--sysLog('经过'..limit_t..'仍未开始战斗')
			ready_x, ready_y = myFindColor(准备)
		end
		limit_t = mTime() - initial_t
	end
	return false
end

function ready()
	accept_quest()
  local ready_x, ready_y = findMultiColorInRegionFuzzy(0xfffffa,"5|-39|0xfffff9,27|-34|0xfff3d1,27|-1|0xfffaeb,51|-17|0xfff2d0", 90, 1789, 1274, 1798, 1283)
	if ready_x > -1 then
    my_toast(id,"您已经准备好了")
    tap(1879, 1285)
		mSleep(200)
		return if_start_combat()
  else
    my_toast(id,"准备开始战斗")
    mSleep(200)
    return ready()
  end
end



-------------------------------------------战斗过程及标记--------------------------------------
function end_combat(tap_situation)
	--sysLog('combat result')
	combat_result = '未知'
	accept_quest()
	--local x_defeat, y_defeat = findMultiColorInRegionFuzzy(0x5c5266,"21|-70|0x50495a,82|0|0x595063,37|-11|0xb7a58f,42|31|0xc1ae94,62|77|0xbba689,28|109|0x6c5638,27|146|0x201d25,-54|32|0xbca78a,-5|28|0x230a07", 90, 583, 159, 980, 508)  -- 鼓上的裂纹
	--local x_win, y_win = findMultiColorInRegionFuzzy(0x76170f,"-34|39|0x941b11,28|39|0x8e1a11,-2|26|0xcdbeaa,4|129|0xdbcfb8,16|155|0xa78d69,26|181|0x4f0e05,-2|205|0x8d2016", 90, 717, 252, 819, 337)
	local x_win, y_win = myFindColor(战斗胜利)
	local x_defeat, y_defeat = myFindColor(战斗失败)
	if x_defeat > -1 then
		--combat_win = false
		combat_result = 'defeat'
		sysLog("战斗失败")
		my_toast(id,"战斗失败")
		wait_for_leaving_state(战斗失败, {true, 1028, 476})
		mSleep(2000)
	elseif x_win > 1 then
		combat_result = 'win'
		--combat_win = true
		sysLog("战斗胜利")
		my_toast(id,"战斗胜利")
		wait_for_leaving_state(战斗胜利, {true, 1028, 476})
		open_damo()
  else
    my_toast(id,"战斗中")
    sleepRandomLag(1000)
		return end_combat(tap_situation)
	end
	return combat_result
end
			
			
function open_damo()
	local bool_val = true
	while bool_val do
		accept_quest()
		keepScreen(true)
		local damo_1_x, damo_1_y =  myFindColor(达摩1)
		local damo_2_x, damo_2_y = myFindColor(达摩2)
		keepScreen(false)
		if damo_1_x > -1 then
			my_toast(id,"找到达摩1")
			tap(1020, 850)
			mSleep(200)
			tap(1020, 850)
			mSleep(1000)
			damo_1_x, damo_1_y =  myFindColor(达摩1)
			while damo_1_x > -1 do
				sysLog('还能找到达摩1')
				tap(1020, 850)
				mSleep(200)
				damo_1_x, damo_1_y =  myFindColor(达摩1)
			end
			
		elseif damo_2_x > -1 then
			my_toast(id,"找到达摩2")
			tap(damo_2_x, damo_2_y)
			mSleep(1000) 
			damo_2_x, damo_2_y = myFindColor(达摩2)
			while damo_2_x > -1 do
				sysLog('还能找到达摩2')
				tap(damo_2_x, damo_2_y)
				mSleep(1000)
				damo_2_x, damo_2_y = myFindColor(达摩2)
			end
			my_toast(id,"结束战斗")
			bool_val = false
			
		else
			mSleep(100)
		end
	end
end


-------------------------------------------汇总--------------------------------------
function start_combat(tap_situation, hero_num)
	local hero_num = hero_num or 0
	accept_quest()
	if if_start_combat_intime() then
		if_change_hero(hero_num)
		ready()
	else
		sysLog('战斗未开始, 跳出战斗循环')
		return 'defeat'
	end
	if_mark(tap_situation)
  combat_result = end_combat(tap_situation)
	return combat_result
end