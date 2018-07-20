--确认ocr 识别时间不会出错
--突破次数判断  战斗结束后突破次数-1 必须加入recursion 判断

-- 挑战卷： 649,1167,695,1203
-- 勋章数：928,1166,1008,1205
-- 排名： 1598,1164,1705,1206
-- 刷新： 1617,1032,1739,1090
-------------------------------------------------------个人突破------------------------------------------------------------------

function get_star(input_table)
	if if_defeat(input_table) then return 7 end
  for i = 0,5,1 do
    accept_quest()
    x, y = findColorInRegionFuzzy(0xb3a28d, 95, input_table[1]+63*i, input_table[2], input_table[1]+63*i, input_table[2])
    if x > -1 then
      star = i
      return star
    end
  end
  accept_quest()
  x, y = findColorInRegionFuzzy(0xc98a1c, 95, input_table[1]+272, input_table[2]-108, input_table[1]+303, input_table[2]-79)
  if x > -1 then
    return 6   -- 表示打过了
  else 
    return 5
  end
end


function if_defeat(input_table)
	local x, y = findMultiColorInRegionFuzzy(0xaa3333,"8|19|0xab3534,-26|3|0x260803,-2|34|0x3b0b06", 90, input_table[1]+275,input_table[2]-156, input_table[1]+359 , input_table[2]-63)
	if x > -1 then
		return true
	else
		return false
	end
end


function tupo_from_less_star(items)
  local output_table = {}
  local sortedKeys = getKeysSortedByValue(items, function(a, b) return a < b end)
  for _, key in ipairs(sortedKeys) do
		if items[key] < 6 then
			table.insert(output_table, key)
		end
	end
  return output_table
end


function enter_tupo()
  local current_state = check_current_state()
	if current_state == 'tupo' then
		sleepRandomLag(2000)
	elseif current_state == 3 then
		tap(676, 1457)
		sleepRandomLag(2000)
		return enter_tupo()
	else
		enter_tansuo()
		return enter_tupo()
	end
end


function tupo(refresh_count, total_avaliable)
  sysLog(refresh_count..'次刷新')
  if total_avaliable == 0 then
    my_toast(id, "没有挑战卷")
		return 99999999999
  end  
  star_list = {true, true, true,true, true, true,true, true, true}
  keepScreen(true)
  for i = 1,9,1 do
		local this_star = get_star(all_enemy[i])
    star_list[i] = this_star
    sysLog('结界'..i..'勋章: ' .. this_star)
    my_toast(id,'结界'..i..'勋章: ' .. this_star)
  end
  keepScreen(false)	
	tupo_order = tupo_from_less_star(star_list)
	printTable(tupo_order)

	local max_time = tablelength(tupo_order)
	sysLog('此轮突破总次数'..max_time)
  local refresh_state = true
  local j = 1  --从第一次开始
  while refresh_state do
    accept_quest()
    if refresh_count == 3	then
      ifrefresh_x, ifrefresh_y = findColorInRegionFuzzy(0x343956, 95, 824, 1081, 829, 1090) --3次前面的灰色进度条  
    elseif refresh_count == 6 then
      ifrefresh_x, ifrefresh_y = findColorInRegionFuzzy(0x343956, 95, 1120,1083,1130,1092)  -- 6次前面的灰色进度条
    else
      ifrefresh_x = 1
    end
    sysLog('tupo state: '..ifrefresh_x)
    if ifrefresh_x == -1 or j == max_time+1 then
      sysLog(refresh_count..'次已打完')
      my_toast(id,refresh_count..'次已打完')
      tap(690, 270)
      sleepRandomLag(2000)
      tap(690, 270)
      refresh_state = false
    else
      sysLog('开始突破'..tupo_order[j])
      tap(all_enemy[tupo_order[j]][1], all_enemy[tupo_order[j]][2])
      sleepRandomLag(1000)
      tap(all_enemy[tupo_order[j]][1]+187, all_enemy[tupo_order[j]][2]+131)
      start_combat(0, _G.tupo_hero)
			sleepRandomLag(3000)
			tap(690, 270)
      sleepRandomLag(2000)
      tap(690, 270)
      sysLog('本轮已战斗'..j..'次...')
      my_toast(id,'本轮已战斗'..j..'次...')
      j = j + 1
      total_avaliable = total_avaliable -1
      sysLog('挑战卷: '..total_avaliable)
      if total_avaliable == 0 then
        my_toast(id, "已打完挑战卷！")
				return 999999999
        --lockDevice();
        --lua_exit();
      end
    end
  end
  sleepRandomLag(2000)
  accept_quest()
  x, y = findColorInRegionFuzzy(0xf3b25e, 95, 1585, 1051, 1595, 1066)  --刷新黄色
  if x == -1 then
    accept_quest()
    waiting_orc = ocrText(dict, 1674,1036,1789,1081, {"0x37332e-0x505050"}, 95, 1, 1) 
    for k,v in pairs(waiting_orc) do
      sysLog(string.format('{x=%d, y=%d, text=%s}', v.x, v.y, v.text))
    end
    minutes = tonumber(waiting_orc[1].text)*10 + tonumber(waiting_orc[2].text)
    seconds = tonumber(waiting_orc[3].text)*10 + tonumber(waiting_orc[4].text) + 0.5
    microseconds = (minutes*60+seconds)*1000
    sysLog('need to wait '..minutes..' minutes and '..seconds..' seconds('..microseconds..' microseconds)')
		if _G.if_need_wait then
			waiting_clock(microseconds+ math.random(1000, 3000))
		else
			my_toast(id, '个人突破需要等待'..minutes..'分'..math.floor(seconds)..'秒...')
			mSleep(2000)
			return (microseconds - 2000)
		end
  end
  tap(1700, 1070)  --点击刷新
  sleepRandomLag(1000)
  tap(1230, 885) --点击确定
  sleepRandomLag(2000)
  return tupo(refresh_count, total_avaliable)
end

function main_gerentupo(tupo_results)
	_G.tupo_hero = tonumber(tupo_results['11'])+1
	enter_tupo()
	accept_quest()
	local tupo_avaliable_ocr = ocrText(dict, 650,1166,696,1203, {"0x37332e-0x505050"}, 95, 1, 1) -- 表示范围内横向搜索，以table形式返回识别到的所有结果及其坐标
	local tupo_avaliable = 0
	for k,v in pairs(tupo_avaliable_ocr) do
		sysLog(string.format('{x=%d, y=%d, text=%s}', v.x, v.y, v.text))
		tupo_avaliable = tupo_avaliable*10 + tonumber(v.text)
	end
	my_toast(id, '挑战卷个数: '..tupo_avaliable)
	sysLog('挑战卷个数: '..tupo_avaliable)		
	if tupo_results['100'] == '0' then
		return tupo(3, tupo_avaliable)
	elseif tupo_results['100'] == '1' then
		return tupo(6, tupo_avaliable)
	else
		return tupo(9, tupo_avaliable)
	end
end

function tupo_togther()
  if _G.if_liaotupo then
    _G.time_pass = mTime() - _G.liaotupo_t
    --sysLog('突破保底'..tonumber(tupo_results['200']))
    main_liaotupo('combine', tonumber(tupo_results['200']))
		_G.寮突破等待时间 = math.random(12*60*1000, 14*60*1000) - _G.time_pass
		_G.个人突破等待时间 = tonumber(main_gerentupo(tupo_results))
		_G.time_pass = mTime() - _G.liaotupo_t
    --sysLog('突破保底'..tonumber(tupo_results['200']))
    main_liaotupo('combine', tonumber(tupo_results['200']))
		_G.寮突破等待时间 = math.random(12*60*1000, 14*60*1000) - _G.time_pass
		sysLog(_G.个人突破等待时间)
		my_toast(id, '个人突破需要等待'..round(_G.个人突破等待时间/60000, 2))
		mSleep(1500)
		my_toast(id, '寮突破需要等待'..round(_G.寮突破等待时间/60000, 2))
		mSleep(1500)
		waiting_clock(math.min(_G.个人突破等待时间, _G.寮突破等待时间) - 3000)
		return tupo_togther()
  else
	end
end


function main_tupo(tupo_ret,tupo_results)
	_G.if_need_wait = true
  if tupo_ret==0 then	
    toast("您选择了取消，停止脚本运行")
    lua_exit()
  end
	_G.tupo_hero = tonumber(tupo_results['11'])+1
	sysLog(_G.tupo_hero)
	if tupo_results['10'] == '0' then
		main_gerentupo(tupo_results)
	elseif tupo_results['10'] == '1' then
		_G.if_liaotupo = true
		_G.if_liaotupolist = {true, true, true}
		_G.liaotupo_t = 0
		_G.time_pass = mTime() - _G.liaotupo_t
		sysLog('已过去时间'.._G.time_pass)
		main_liaotupo('pure', tonumber(tupo_results['200']))
	elseif tupo_results['10'] == '0@1' then
		_G.if_need_wait = false
		_G.if_liaotupo = true
		_G.if_liaotupolist = {true, true, true}
		_G.liaotupo_t = 0
		_G.time_pass = mTime() - _G.liaotupo_t
		tupo_togther()
	end
end


---------------------------------------------------------------------------寮突破--------------------------------------------------------------------------
function enter_liaotupo()
	my_toast(id, '进入寮突破')
  local current_state = check_current_state()
	if current_state == 'tupo' then
		tap_till_skip({0xf8f2de,"0|5|0x7b471e,0|-5|0x74431a", 95, 1943, 651, 1972, 665}, 1978, 724, 500)
		my_toast(id, '已进入寮突破')
	elseif current_state == 3 then
		tap(676, 1457)
		mSleep(3000)
		return enter_liaotupo()
	else
		enter_tansuo()
		return enter_liaotupo()
	end
end


function find_one_round_metal()
	star_list = {true, true, true, true, true, true,true, true}
  keepScreen(true)
  for i = 1,8,1 do
		local this_star = get_star(liao_enemy[i])
    star_list[i] = this_star
    sysLog('结界'..i..'勋章: ' .. this_star)
    --my_toast(id,'结界'..i..'勋章: ' .. this_star)
  end
	local eight_x, _ = findColorInRegionFuzzy(0xaa8386, 95, 1669, 1065, 1707, 1095)
	if eight_x > -1 then 
		star_list[8] = 9
	end
  keepScreen(false)
	return star_list
end


function one_liaotupo(base_metal, which_liao)
	sysLog('寮'..which_liao..'突破状态:'..tostring(_G.if_liaotupolist[which_liao]))
	local liaotupo_load_x, _ = findMultiColorInRegionFuzzy(0xfee8a8,"3|0|0xfdf8e3,7|0|0x87826c", 95, 683, 582+(which_liao-1)*297, 695, 603+(which_liao-1)*297)
	if liaotupo_load_x > -1 then
		sysLog('寮'..which_liao..'已经完全突破')
		_G.if_liaotupolist[which_liao] = false
	end
	
	if _G.if_liaotupolist[which_liao] == false then
		my_toast(id, '此寮不需要突破')
		sysLog('寮'..which_liao..'突破状态:'..tostring(_G.if_liaotupolist[which_liao]))
		do return end
	end
	local this_star_list = find_one_round_metal()
	local search_state = true
	while search_state do
		for tupo_target = 1, 8, 1 do
			if this_star_list[tupo_target] <= base_metal then
				sysLog('找到目标'..tupo_target..', 勋章数'..this_star_list[tupo_target])
				search_state = false
				tap(liao_enemy[tupo_target][1], liao_enemy[tupo_target][2])
				sleepRandomLag(1000)
				tap(liao_enemy[tupo_target][1]+187, liao_enemy[tupo_target][2]+131)
				start_combat(0, _G.tupo_hero)
				do return end
			end
		end
		--my_swip(1305, 1236, 1305, 470, 20)
		local new = pos:new(1305, 1241)
		local move = {x=1305,y=387}
		local step = 10
		local sleep1,sleep2 = 10, 40
		new:touchMoveTo(move,step,sleep1,sleep2)
		local ifend_x, ifend_y = findColorInRegionFuzzy(0x93897c, 98,779,1001,829,1030)
		
		if ifend_x > -1 then
			my_toast(id, '已到达最底部')
			mSleep(2000)
			this_star_list = find_one_round_metal()
			for tupo_target = 1, 8, 1 do
				if this_star_list[tupo_target] <= base_metal then
					sysLog('找到目标'..tupo_target..', 勋章数'..this_star_list[tupo_target])
					search_state = false
					tap(liao_enemy[tupo_target][1], liao_enemy[tupo_target][2])
					sleepRandomLag(1000)
					tap(liao_enemy[tupo_target][1]+187, liao_enemy[tupo_target][2]+131)
					start_combat(0, _G.tupo_hero)
					do return end
				end
			end
			_G.if_liaotupolist[which_liao] = false
			sysLog('寮'..which_liao..'突破状态:'..tostring(_G.if_liaotupolist[which_liao]))
			do return end
		else
			my_toast(id, '还能继续下拉')
		end
		mSleep(2000)
		this_star_list = find_one_round_metal()
	end
end


function start_liaotupo(base_metal)
	enter_liaotupo()
	sysLog('检测是否需要寮突破')
	mSleep(500)
	local if_select_liao, _ = myFindColor(选择阴阳寮)
	sysLog(if_select_liao)
	if if_select_liao > -1 then
		my_toast(id, '需要选择阴阳寮')
		_G.if_liaotupo = false
		do return end
	end
	for i = 1, 3, 1 do
		tap_till_skip(liao_select[i], liao_list[i][1], liao_list[i][2], 1000)
		one_liaotupo(base_metal, i)
		mSleep(2000)
	end
	sysLog(tostring(_G.if_liaotupo))
	if _G.if_liaotupolist[1] == false and _G.if_liaotupolist[2] == false and _G.if_liaotupolist[3] == false then
		_G.if_liaotupo = false
		sysLog('总状态:'..tostring(_G.if_liaotupo))
	end
end


function main_liaotupo(mode, base_metal)
	_G.tupo_hero = tonumber(tupo_results['11'])+1
	while true do
		--sysLog(mode)
		--sysLog(_G.time_pass)
		if _G.time_pass <= 12*60*1000 then
			local wait_time = math.random(12*60*1000, 14*60*1000) - _G.time_pass
			my_toast(id, '寮突破需要等待'..math.floor(wait_time/(60*1000))..'分钟')
			mSleep(1000)
			--sysLog('等待'..wait_time..'毫秒')
			if mode == 'pure' then
				if _G.if_liaotupo == false then 
					do return end
				else
					waiting_clock(wait_time)
				end
			else
				do return end
			end
		end
		sysLog('可以开始突破')
		_G.liaotupo_t = mTime()
		sysLog(_G.liaotupo_t)
		if _G.if_liaotupo then
			start_liaotupo(base_metal)
		else
			my_toast(id, '寮突破已经打完')
		end
		_G.time_pass = mTime() - _G.liaotupo_t
	end
end


