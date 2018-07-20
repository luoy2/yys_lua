-------------------------------------------一键挂机--------------------------------------

function enter_party_yuhun(yuhun_floor)
	enter_party()
	mSleep(500)
	tap(400, 1130)
	mSleep(200)
	wait_for_leaving_state(刷新等待)
	mSleep(200)
	wait_for_state(组队刷新)
	return choose_yuhun_floor(yuhun_floor)
end

function choose_yuhun_floor(yuhun_floor)
	my_swip(775, 610, 762, 1150, 20)
	mSleep(500)
	if yuhun_floor <= 5 then
		local y = 712 + (yuhun_floor - 1)*108
		tap(765, y)
	else
		local y =  750 + (yuhun_floor - 6)*108
		my_swip(775, 1150, 762, 610, 20)
		mSleep(500)
		tap(765, y)
	end
	mSleep(200)
	wait_for_leaving_state(刷新等待)
	mSleep(200)
	wait_for_state(组队刷新)
end

function create_party(visible)
	state_transit(组队刷新, 创建, 1600, 1300, true)
	local creat_x, creat_y = myFindColor(创建)
	while creat_x == -1 do
		sysLog('未找到')
		mSleep(500)
		creat_x, creat_y = myFindColor(创建)
	end
	if visible == 'friend' then
		tap(768, 1020)
	elseif visible == 'public' then
		tap(495, 1023)
	else
		tap(1223, 1024)
	end
	mSleep(1000)
	--魂10检测等级限制
	if yh_floor == 10 then
		local lvl_floor = myFindColor(六十底)
		local lvl_top = myFindColor(六十顶)
		my_toast(id, '检测等级设置')
		for i = 1,5,1 do
			if lvl_floor == -1 then 
				my_swip(1320, 900, 1320, 0, 50)
			end
			if lvl_top == -1 then
				my_swip(1485, 900, 1485, 0, 50)
			end
			mSleep(200)
			lvl_floor = myFindColor(六十底)
			lvl_top = myFindColor(六十顶)
			if lvl_floor > -1 and lvl_top > -1 then
				break end
		end
		mSleep(1000)
	end
	my_toast(id, '创建队伍')
	tap(creat_x, creat_y)
	if_outof_sushi()
	wait_for_state(离开队伍)
end


function conditional_invite(current_fight, fight_count, yuhun_floor, visible, mark_case)
	accept_quest()
	local combat_result = nil
	mSleep(1000)
	local current_party_statue = party_statue()
	--sysLog(current_party_statue)
	if current_party_statue == 5 then
		my_toast(id, "开始队伍")
		tap(1547, 1157)
		if_outof_sushi()
		local combat_result = custom_mark_combat(mark_case, 30000, _G.yh_hero)
		if _G.if_tupo then
			sysLog('需要突破')
			this_if_tupo = current_fight+1 - math.floor((current_fight+1)/tupo_sep)*_G.tupo_sep
			sysLog(this_if_tupo)
			my_toast(id, '当前御魂次数'..(current_fight+1)..'; 突破间隔'.._G.tupo_sep)
			if this_if_tupo == 0 then
				tap(836, 883)
				sysLog('已经刷完'..(current_fight+1)..'次, 开始结界突破')
				my_toast(id, '已经刷完'..(current_fight+1)..'次副本, 现在开始个人结界突破')
				return main_gerentupo(tupo_results)
			end
		end
		sysLog(combat_result)
		sleepRandomLag(1000)
		if combat_result == 'win' then
			while invite_color_1 == -1 or invite_color_2 == -1 do
				accept_quest()
				mSleep(200)
				invite_color_1, y_2 = findColorInRegionFuzzy(0xdf6851, 95, 897, 876, 937, 897)
				invite_color_2, y_3 = findColorInRegionFuzzy(0xf3b25e, 95, 1107, 870, 1133, 887)
			end
			my_toast(id,"重新邀请")
			tap(1184, 877)
			mSleep(1500)
			if_outof_sushi()
			current_party_statue = party_statue()
			sysLog(current_party_statue)
			while current_party_statue == 4 do
				sysLog(current_party_statue)
				mSleep(1000)
				current_party_statue = party_statue()
				if_outof_sushi()
			end
		else
			my_toast(id,"翻车了, 不要这批队友了")
			tap(836, 883)
			return create_yuhun(current_fight+1, fight_count, yuhun_floor, visible, mark_case)
		end
	elseif current_party_statue == 0 or current_party_statue == 2 then
		sleepRandomLag(1000)
		my_toast(id,'等待队友加入')
		return conditional_invite(current_fight, fight_count, yuhun_floor, visible, mark_case)
	else
		local current_state = check_current_state()
		if current_state == 'create_party' then
			tap(1387, 1107)
			return conditional_invite(current_fight+1, fight_count, yuhun_floor, visible, mark_case)
		else
			return create_yuhun(current_fight+1, fight_count, yuhun_floor, visible, mark_case)
		end
	end
	end

function create_yuhun(current_fight, fight_count, yuhun_floor, visible, mark_case)
	if yuhun_floor == 0 then
		yuhun_floor = math.random(1, 10)
	end
	--sysLog('2:'..mark_case[1])
	if fight_count == 0 then
		fight_count = 99999
	end
	enter_party_yuhun(yuhun_floor)
	--sysLog('3:'..mark_case[1])
	create_party(visible)
	--sysLog('4:'..mark_case[1])
	while current_fight <= fight_count do
		--sysLog('5:'..mark_case[1])
		conditional_invite(current_fight, fight_count, yuhun_floor, visible, mark_case)
		current_fight = current_fight + 1
		sysLog('战斗次数: '..current_fight..'/'..fight_count)
	end
end
	











-------------------------------------------急速（需要修复）--------------------------------------
function recursive_task()
  accept_quest()
  start_color, y_1 = findColorInRegionFuzzy(0xf3b25e, 95, 1457, 1121, 1511, 1128)
  full_color, y_full = findColorInRegionFuzzy(0xf6eee2, 95, 1599, 777, 1622, 782)
  if start_color > -1 then
    toast ("开始队伍")
    tap(1547, 1157)
    mSleep(200)
    ready()
    toast ("点击准备")
    while true do
      accept_quest()
      invite_color_1, y_2 = findColorInRegionFuzzy(0xdf6851, 95, 897, 876, 937, 897)
      invite_color_2, y_3 = findColorInRegionFuzzy(0xf3b25e, 95, 1107, 870, 1133, 887)
      if invite_color_1 > -1 and invite_color_2 > -1 then
        toast ("重新邀请")
        tap(1184, 877)
        mSleep(1000)
        recursive_task()
      else
        first_mark()
      end
    end
  else
    mSleep(1000)
    toast ("尝试开始队伍")
    return recursive_task()
  end
end
-------------------------------------------单刷--------------------------------------
function solo_yh(mark_case)
  current_state = check_current_state()
	if current_state == 3 then
  else
		enter_tansuo()
	end
	mSleep(1000)
	local tansuo_x, tansuo_y = findColorInRegionFuzzy(0x1e1ea6, 95, 314, 1493, 340, 1509) -- 探索yuhun下方蓝色
	while tansuo_x > -1 do
		tap(326, 1454)
		mSleep(1000)
		accept_quest()
		tansuo_x, tansuo_y = findColorInRegionFuzzy(0x1e1ea6, 95, 314, 1493, 340, 1509) -- 探索yuhun下方蓝色
	end
	mSleep(1000)
	tap(600, 800)
  mSleep(1000)
  swip(650, 830, 650, 450)
  swip(650, 830, 650, 450)
  swip(650, 830, 650, 450)
  tap(627, 810)
	while _G.fight_times < _G.yh_times do
		mSleep(1000)
		tap(1540, 990)
		custom_mark_combat(mark_case, 120000, _G.yh_hero)
		_G.fight_times = _G.fight_times + 1
	end
end








-------------------------------------------队长--------------------------------------
function team_leader(mark_case, member_number)
  accept_quest()
	mSleep(1000)
	local current_party_statue = party_statue()
  if member_number == 3 then
    if current_party_statue == 5 then
      toast ("开始队伍")
      tap(1547, 1157)
			if_outof_sushi()
      combat_result = custom_mark_combat(mark_case, 30000, _G.yh_hero)
      while true do
        accept_quest()
        invite_color_1, y_2 = findColorInRegionFuzzy(0xdf6851, 95, 897, 876, 937, 897)
        invite_color_2, y_3 = findColorInRegionFuzzy(0xf3b25e, 95, 1107, 870, 1133, 887)
        if invite_color_1 > -1 and invite_color_2 > -1 then
          my_toast(id,"重新邀请")
          tap(1184, 877)
          mSleep(2000)
          break end
          mSleep(100)
        end
		else
			mSleep(100)
			my_toast(id,'等待队友加入')
			team_leader(mark_case, member_number)
		end
	else
		if current_party_statue == 0 then
			my_toast(id, "开始队伍")
			tap(1547, 1157)
			if_outof_sushi()
			custom_mark_combat(mark_case, 30000, _G.yh_hero)
			sleepRandomLag(1000)
			while true do
				accept_quest()
				invite_color_1, y_2 = findColorInRegionFuzzy(0xdf6851, 95, 897, 876, 937, 897)
				invite_color_2, y_3 = findColorInRegionFuzzy(0xf3b25e, 95, 1107, 870, 1133, 887)
				if invite_color_1 > -1 and invite_color_2 > -1 then
					toast ("重新邀请")
					tap(1184, 877)
					mSleep(2000)
				break end
					sleepRandomLag(1000)
			end
		else
				sleepRandomLag(3000)
				my_toast(id,'等待队友加入')
				return team_leader(mark_case, member_number)
		end
	end
end
    
    
    
    
    
    
    
    
    -------------------------------------------队员接受邀请--------------------------------------
function accept_invite(mark_case)
	accept_quest()
	local invite_col, y_1 = findColorInRegionFuzzy(0x52ae5d, 95, 215, 409, 229, 417)
	if invite_col > -1 then
		tap(invite_col, y_1)
		if_outof_sushi()
		my_toast(id,"接受邀请")
		sleepRandomLag(3000)
		return custom_mark_combat(mark_case, 30000)
	else
		sleepRandomLag(2000)
		my_toast(id,'等待邀请')
		return accept_invite(mark_case)
	end
end
    
    
    
    
    -------------------------------------------yh标记设置--------------------------------------
function custom_mark_combat(mark_array, round_limit, combat_hero)
	local combat_hero = combat_hero or 0
	local round_limit = round_limit or 30000
	sysLog(round_limit)
	accept_quest()
	wait_for_state(准备)
	sysLog('换'..combat_hero)
	if_change_hero(combat_hero)
	ready()
	mSleep(1500)
	round = 1
	while round <= 2 do
		if_mark(mark_array[round])
		if_other_round(round_limit)
		round = round + 1
		mSleep(1500)
	end
	if_mark(mark_array[round])
	return end_combat(0)
end
    
    
function if_other_round(round_limit)
	local round_limit = round_limit or 30000
	sysLog(round_limit)
	local x, y = myFindColor(新回合)
	local initial_t = mTime()	
	local force_skip_t = mTime() - initial_t
	--my_toast(id,'检测到回目')
	while x == -1 do
		my_toast(id,'等待下一回合的标记')
		mSleep(100)
		x, y = myFindColor(新回合)
		force_skip_t = mTime() - initial_t
		--sysLog(force_skip_t)
		if force_skip_t >= round_limit then
			my_toast(id, '回合超时')
			break end
	end
end
    
    
    --标记二口女
function first_mark()
	sysLog('first_mark')
	accept_quest()
	local jue_x, jue_y = myFindColor(觉血条)
	local blueball_x, blueball_y = findColorInRegionFuzzy(0x9cffee, 95, 475, 518, 593, 545)
	if jue_x > -1 then
		my_toast(id, '检测二口女是否需要被标记')
		if blueball_x > -1 then
			local mark_x, mark_y = myFindColor(二口女标记)
			while mark_x == -1 do
				tap(529, 488)
				mSleep(300)
				mark_x, mark_y = myFindColor(二口女标记)
			end
			--my_toast(id,'检测到标记')
			my_toast(id, "已标记二口女")
			mSleep(300)
			return first_mark()
		else
			tap(1076, 397)
			accept_quest()
			local initial_t = mTime()	
			local force_skip_t = mTime() - initial_t
			x = -1
			while x == -1 do
				sysLog(force_skip_t)
				mark_cases:case(3)
				mSleep(200)
				x, y = myFindColor(战斗标记)
				force_skip_t = mTime() - initial_t
				if force_skip_t >= 5000 then
					my_toast(id, '标记超时, 直接下一轮标记')
					do return end
				end
			end
			--my_toast(id,'检测到标记')
			my_toast(id, "已标记中间！")
		end
	else
		my_toast(id, '镜头角度有误')
		for i = 1, 3, 1 do
			mSleep(1000)
			sysLog('尝试寻找觉血条第'..i..'次')
			jue_x, jue_y = myFindColor(觉血条)
			if jue_x > -1 then
				return first_mark()
			end
		end
		do return end
	end
end
    
		
function last_mark()
	local initial_t = mTime()
	sysLog('last_mark')
	keepScreen(true)
	local mark_x, mark_y = myFindColor(战斗标记)
	local boss_x, boss_y = myFindColor({0x7d817a,"4|25|0x536860,5|57|0x788375",95,1021,334,1124,393})
	keepScreen(false)
	local force_skip_t = mTime() - initial_t
	while mark_x == -1 do
		if boss_x > -1 then
			sysLog('尝试标记')
			tap(530, 560)
		else
			sysLog('镜头角度有误')
		end
		mSleep(300)
		keepScreen(true)
			mark_x, mark_y = myFindColor(战斗标记)
			boss_x, boss_y = myFindColor({0x7d817a,"4|25|0x536860,5|57|0x788375",95,1021,334,1124,393})
		keepScreen(false)
		force_skip_t = mTime() - initial_t
		if force_skip_t >= 5000 then
			my_toast(id, '左边标记超时, 直接下一轮标记')
			break end
	end
	mSleep(1000)
	
	
	my_toast(id, '等待左边死亡')
	keepScreen(true)
	local dead_x, dead_y = myFindColor(天狗死亡)
	local boss_x, boss_y = myFindColor({0x7d817a,"4|25|0x536860,5|57|0x788375",95,1021,334,1124,393})
	keepScreen(false)
	initial_t = mTime()
	repeat
		mSleep(200)
		keepScreen(true)
		dead_x, dead_y = myFindColor(天狗死亡)
		boss_x, boss_y = myFindColor({0x7d817a,"4|25|0x536860,5|57|0x788375",95,1021,334,1124,393})
		keepScreen(false)
	until
		(dead_x > -1 and boss_x > -1) or (mTime() - initial_t >= 10000)
	sysLog('左边已死亡')
	mSleep(500)
			--sysLog('if_mark'..tap_situation)
	initial_t = mTime()	
	keepScreen(true)
	mark_x, mark_y = myFindColor(战斗标记)
	boss_x, boss_y = myFindColor({0x7d817a,"4|25|0x536860,5|57|0x788375",95,1021,334,1124,393})
	local left_x, left_y = myFindColor(右边天狗)
	keepScreen(false)
	if mark_x ~= -1 then
		my_toast(id, '队友已标记')
		do return end
	end
	force_skip_t = mTime() - initial_t
	
	while mark_x == -1 do
		sysLog(force_skip_t)
		if left_x > -1 then 
			sysLog('尝试标记右边')
			tap(1580, 535)
		else
			if boss_x > -1 then
				sysLog('右边已死亡')
				do return end	
			end
			sysLog('镜头角度有误')
		end
		mSleep(300)
		keepScreen(true)
		mark_x, mark_y = myFindColor(战斗标记)
		left_x, left_y = myFindColor(右边天狗)
		boss_x, boss_y = myFindColor({0x7d817a,"4|25|0x536860,5|57|0x788375",95,1021,334,1124,393})
		keepScreen(false)
		force_skip_t = mTime() - initial_t
		if force_skip_t >= 5000 then
			my_toast(id, '标记超时, 直接下一轮标记')
			do return end
		end
	end
	my_toast(id,'为您标记好了')
	mSleep(1000)
		
end
		
		
		
		-------------------------------加入队伍模式---------------------------------------
function if_accept_invite_yh(mark_case, combat_result, total_fight_times)
	wait_for_state(组队)
	if combat_result == 'win' then
		my_toast(id, '等待15秒内邀请')
		local limit_seconds = 15000
		local qTime = mTime()
		while (mTime() - qTime) <= limit_seconds do
			mSleep(10)
			my_toast(id, '等待邀请: '..string.format("%.2d:%.2d", 0, (limit_seconds - mTime() + qTime)/1000))
			invite_x, invite_y = findColorInRegionFuzzy(0x52ae5d, 95, 215, 409, 229, 417)
			if invite_x ~= -1 then
				my_toast(id, '接受邀请')
				mSleep(1000)
				invite_x, invite_y = findColorInRegionFuzzy(0x52ae5d, 95, 215, 409, 229, 417)
				if invite_x ~= -1 then
					tap(invite_x, invite_y)
				end
				in_party('shiju', {0})
				combat_result = custom_mark_combat(mark_case, 30000)
				_G.fight_times = _G.fight_times + 1
				my_toast(id, '战斗次数 '.._G.fight_times..'/'..total_fight_times)
				if _G.fight_times < total_fight_times then
					return if_accept_invite_yh(mark_case, combat_result, total_fight_times)
				else
				end
			end
		end
		my_toast(id, '邀请超时, 自行加入')
	else
		my_toast(id, '战斗失败, 重新加入')
	end
end		


function refresh_yh()
	wait_for_state(组队刷新)
	tap(1200, 1300)
	wait_for_state(组队刷新)
	keepScreen(true)
	local x, y = findColorInRegionFuzzy(0xe2c36d, 95, 1615, 594, 1623, 607) --找色是否有队伍
	keepScreen(false)
	if x > -1 then
		join_party:case(1)
		sleepRandomLag(1000)
		accept_quest()
		keepScreen(true)
		local x, y = findColorInRegionFuzzy(0xf3b25e, 95, 1091, 1272, 1108, 1283)  --刷新黄色 如果未找到说明在队伍
		keepScreen(false)
		if x == -1 then
			toast("已加入队伍")
			in_party('shiju', {0})
			return custom_mark_combat(mark_case, 30000)
		else
			wait_for_state(组队刷新)
			return refresh_yh()
		end
	else
		return refresh_yh()
	end
end


function yuhun_join_once(yuhun_floor)
		enter_party()
		tap(400, 1116)
		wait_for_state(组队刷新)
		if yuhun_floor ~= 0 then
			choose_yuhun_floor(yuhun_floor)
		end
		wait_for_state(组队刷新)
		tap(1462, 639)
		wait_for_state(组队刷新)
		return refresh_yh()
end


function yuhun_join()
	while _G.fight_times < _G.yh_times do
		sysLog('战斗次数 '.._G.fight_times..'/'.._G.yh_times)
		my_toast(id, '战斗次数 '.._G.fight_times..'/'.._G.yh_times)
	  local combat_result = yuhun_join_once(_G.yh_floor)
		_G.fight_times = _G.fight_times + 1
		if_accept_invite_yh(mark_case, combat_result, _G.yh_times)
	end
end





    
    -------------------------------------------御魂汇总--------------------------------------
function main_yh(yh_ret, yh_results)
	_G.fight_times = 0
	if yh_ret==0 then	
		toast("您选择了取消，停止脚本运行")
		lua_exit()
	end
	_G.yh_hero = tonumber(yh_results['400']) + 1
	sysLog(_G.yh_hero)
	--------------------------------队长2人---------------------------------
	mark_1 = tonumber(yh_results['201']) + 2
	mark_2 = tonumber(yh_results['202']) + 2
	mark_3 = tonumber(yh_results['203']) + 2
	_G.yh_times = tonumber(yh_results['500'])
	_G.yh_floor = tonumber(yh_results['501'])
	if _G.yh_times == 0 then
		_G.yh_times = 99999999
	end
	if mark_2 == 5 then mark_2 = 6 end
	if mark_3 == 5 then mark_3 = 7 end
	mark_case = {mark_1, mark_2, mark_3}
	--printTable(mark_case)
	if yh_results["101"]== "0" then
		toast("开始魂10自动战斗，请进入组队界面后创建队伍，邀请基友"); 
		mSleep(2000)
		while true do 
			team_leader(mark_case, 2)
		end
		--------------------------------队长3人---------------------------------
	elseif yh_results["101"] == "1" then
		toast("开始魂10自动战斗，请进入组队界面后创建队伍，邀请基友"); 
		mSleep(2000)
		while true do 
			team_leader(mark_case, 3)
		end
		--------------------------------加入队伍--------------------------------
	elseif yh_results['101'] == '2' then	
		if yh_results['300'] == '0' then
			_G.if_tupo = true
			_G.tupo_sep = tonumber(yh_results['301'])
			tupo_ret,tupo_results = showUI("tupo.json")
			if tupo_ret==0 then	
				toast("突破设置取消，停止脚本运行")
				lua_exit()
			end
		end
		return create_yuhun(_G.fight_times, _G.yh_times, _G.yh_floor, 'public', mark_case)
		--------------------------------等待邀请---------------------------------
	elseif yh_results["101"] == "3" then
		toast("开始魂10自动战斗，请等待基友邀请"); 
		sleepRandomLag(2000)
		while true do 
			accept_invite(mark_case)
		end
	elseif yh_results["101"] == "4" then
		yuhun_join()
	elseif yh_results["101"] == "5" then
		recursive_task()
	elseif yh_results["101"] == "6" then
		solo_yh(mark_case)
	else
		dialog("你tm什么都没设置，玩儿我吧？")
		lua_exit()
	end
end

    
    
    
    
    
    
    
    
    
    
    
    
    -------------------------------------------业原火--------------------------------------

    
function enter_yeyuanhuo()
	local current_state = check_current_state()
	if current_state == 'yeyuanhuo' then
		my_toast(id, '进入业原火')
		tap(1457, 770)
		mSleep(500)
		return enter_yeyuanhuo()
	elseif current_state == 'yeyuanhuo_challenge' then
		my_toast(id, '选择业原火难度界面')
		return true
	else
		enter_tansuo()
		my_toast(id, '在探索界面')
		tap(334, 1448)
		mSleep(500)
		return enter_yeyuanhuo()
	end
end
    
    
    
function yeyuanhuo(times, difficulty)
	if times == 0 then
		lockDevice()
		mSleep(200)
		lua_exit()
	end
	--sysLog('yeyuanhuo')
	enter_yeyuanhuo()
	--确定进入探索
	accept_quest()
	my_toast(id, '开始挑战业原火')
	choose_yeyuanhuo:case(difficulty)
	mSleep(500)
	tap(1527, 982)
	mSleep(2000)
	results = custom_mark_combat({2,2,3}, 600000, _G.yyh_hero)
	if results == 'win' then
		times = times -1
	end
	return yeyuanhuo(times, difficulty)
end

		
function main_yeyuanhuo(yyh_ret, yyh_results)
	if yyh_ret==0 then	
		toast("您选择了取消，停止脚本运行")
		lua_exit()
	end
	_G.yyh_hero = tonumber(yyh_results['200'])+1
	local times = tonumber(yyh_results['100'])
	local difficulty = tonumber(yyh_results['101'])+1
	yeyuanhuo(times, difficulty)
end
    