chapter_tap = switch {
  [1] = function () tap(1900, 339) end,
  [2] = function() tap(1900, 520 ) end,		
  [3] = function() tap(1900, 700) end,  
  [4] = function() tap(1900, 900)	end,	
  [17] = function() tap(1900, 556)	end, 
  [18] = function() tap(1900, 750) end,
  [19] = function() tap(1900, 950) end,
  [171] = function() tap(1900, 750)	end, 
  --[18] = function() tap(1900, 950) end
}

qucik_chapter = {
  [1] = {0xfee2db,"6|-15|0x181414,-20|2|0x413330,19|11|0x271d1c,-5|19|0x281e1e,-7|-7|0x8f8988,-13|-36|0xf9c7be,-6|-52|0xfde1da,41|2|0x332626,4|15|0x9e9d9e",90,963,666,1037,746},
  [2] = {0x2c3e50,"0|-10|0x030204,11|-19|0xf61f51,24|0|0xe5d5d0,14|48|0xda1742,68|11|0xc4ab81,-49|11|0x364245",90,921,772,1122,968},
	[3] = {0x912614,"-16|3|0xab250f,17|6|0xb83312,2|20|0x0b7279,-2|48|0xe6a57e,-12|-31|0x251319,33|46|0xa8331a,-32|44|0xa13d25,19|91|0x047980,-16|62|0x0e7084",92,1009,899,1058,946},
	[4] = {0xffeae2,"3|-8|0x25347f,-2|-26|0x67ac36,-7|-47|0xffeae2,-9|-22|0xf6f2f4,-19|-10|0x4a3b2a,-15|-18|0x66aa36",90,977,637,1049,715},
	[5] = {0xfae5da,"9|-1|0xa78d90,19|7|0x7d6564,8|15|0xeaded3,-8|9|0xfbe7db,-19|4|0xf2ede6",90,987,616,1045,673},
	[6] = {0x222228,"3|-6|0xd1ceb8,-8|-6|0x38363c,8|3|0x31428c,-20|5|0x6e3636,10|-8|0x897866",90,959,589,1045,642},
	[7] = {0xf8f4ee,"3|-16|0xf8f3ed,24|11|0xbfada6,7|22|0x620f0b,29|15|0x5f0f0b,-56|14|0xf1c49a",90,957,576,1093,651},
	[8] = {0xe9d4d1,"5|-1|0xa21e2a,10|1|0xebd7d4,7|11|0xc92b3a,-8|15|0xa91e31,-14|-8|0xd83737,-24|-9|0xe67488",90,973,600,1055,646},
	[9] = {0x9199e2,"3|-14|0x794253,6|-29|0xfcdfd5,27|-4|0x8773e3,1|0|0x7b76de,-28|14|0x9465cf",90,1001,619,1057,647},
	[10] = {0xfcf1d4,"3|-11|0xe43f44,14|-8|0x942b46,5|23|0x77635d,-22|25|0x453c4f,-37|30|0x5a4f54,18|30|0x5e5051",90,983,562,1061,626},
	[11] = {0xfde3d5,"11|3|0xfc3b34,17|6|0x414383,12|18|0x161a32,6|28|0xf43630,-11|13|0x23232e",90,976,601,1037,653},
  [12] = {0xe9c994,"-6|-11|0xfdf1b2,3|-13|0xfcf0b7,0|-7|0x112240,0|-33|0xf89829,-7|7|0x2b3745,7|15|0x5e8fbd",90,749,654,838,731},
	[13] = {0x222947,"-21|9|0xf9f1e9,-15|1|0xda4041,3|14|0x212846,15|-30|0xfbf4eb,5|27|0x282e4e",90,712,683,765,732},
	[14] = {0xf3d8c3,"6|5|0xf9e5db,-5|6|0xf9e5db,0|-19|0x231834,13|-18|0x3b6042,-17|-9|0xa80442,-8|21|0x990f2a",90,759,595,819,646},
	[15] = {0xcae4f2,"-7|-1|0xd24d5a,8|-2|0xd34c5d,1|8|0xc6585f,4|14|0x70719f,7|-19|0xf6c5cf,0|-17|0xf4f488",90,960,581,1053,652},
	[16] = {0x7b6487,"8|-6|0x8e8158,-7|-21|0x7b6487,-4|-47|0xfde9d0,-4|-57|0xfff7e2,-47|21|0x715c83,28|12|0x2c2a51",90,968,589,1032,654},
	[17] = {0x358095,"21|0|0x090e29,40|0|0x358499,17|-19|0x0e0f09,8|4|0x182045",95,980,654,1062,753},
	[18] = {0xfdfbf6,"36|-1|0x22242b,-90|-9|0x1c1d23,-66|12|0x101113,-59|16|0x48579c,6|25|0xc73351",90,1020,551,1100,603},
	[19] = {0x584e57,"-15|-4|0xd8d8de,14|-4|0xdcdce2,-2|-62|0xfee4cd,-62|-70|0xd9d0bf,-62|-126|0x74409c", 95, 953, 675, 987, 706},
	[20] = {0xfffff9,"11|-12|0x526776,-5|-21|0xb79874,8|-32|0x6e6697",95,1067,656,1127,720}
}

change_ss_tap = switch {
  [1] = function () 
    tap(1050, 1067)
    mSleep(200)
    tap(1050, 1067)
  end,
  [2] = function () 
    tap(1050, 1067)
    mSleep(200)
    tap(1050, 1067)
  end,	
  [3] = function () 
    tap(1050, 1067)
    mSleep(200)
    tap(1050, 1067)
  end,
  [4] = function () 
    tap(289, 726)
    mSleep(200)
    tap(289, 726)
  end,
  [5] = function () 
    tap(289, 726)
    mSleep(200)
    tap(289, 726)
  end,
}

change_hero = switch{
  [1] = function () 
		tap(928, 1163)
		wait_for_state(交替)
		tap(106, 1450)
		wait_for_state(更换阴阳师)
		tap(359, 618)
		wait_for_state(交替)
		tap(61, 47)
		mSleep(1000)
  end,
  [2] = function () 
		tap(928, 1163)
		wait_for_state(交替)
		tap(106, 1450)
		wait_for_state(更换阴阳师)
		tap(832, 693)
		wait_for_state(交替)
		tap(61, 47)
		mSleep(1000)
  end,	
  [3] = function () 
		tap(928, 1163)
		wait_for_state(交替)
		tap(106, 1450)
		wait_for_state(更换阴阳师)
		tap(1220, 700)
		wait_for_state(交替)
		tap(1685, 583)
		mSleep(1000)
  end,
  [4] = function () 
		tap(928, 1163)
		wait_for_state(交替)
		tap(106, 1450)
		wait_for_state(更换阴阳师)
		tap(370, 108)
		wait_for_state(交替)
		tap(61, 47)
		mSleep(1000)
  end
	}
----------------------------------------------------Step 1: 进入探索---------------------------------------------------
function enter_tansuo()
  local current_state = check_current_state()
  if current_state == 1 then
    local tansuo_x, tansuo_y = myFindColor(探索灯笼)
    sysLog(tansuo_x)
    sysLog(tansuo_y)
    if tansuo_x > -1 then
      sysLog('点击试试')
      tap(tansuo_x+15, tansuo_y+45)
      mSleep(3000)
      return enter_tansuo()--进入探索页面
    else
      my_toast(id, '没有找到探索，请手动进入探索')
      mSleep(2000)
      return enter_tansuo()
    end
  elseif current_state == 'machi' then
    local machi_x, machi_y = findMultiColorInRegionFuzzy(0xbeb6b3,"3|25|0xb9b5c3,1|40|0x141412,-1|228|0x979793", 95, 1540,460,1550,480)
    if machi_x > -1 then
      my_toast(id, '进入庭院')
      tap(1545, 575)
      mSleep(2000)
      my_swip(1800, 1250, 200, 1250, 50)
      return enter_tansuo()
    else
      my_toast(id, '没有找到主界面入口，麻烦手动进入')
      mSleep(2000)
      return enter_tansuo()
    end
  elseif current_state == 21 then
    my_toast(id, '正在战斗中！请完成战斗后进入探索界面开启脚本！')
  end_combat(0)
  mSleep(2000)
  return enter_tansuo()
elseif current_state == 22 then
  my_toast(id, '在探索副本！')
  tap(80, 100)												--退出探索本
  mSleep(1500)
  tap(1244, 842)
  return enter_tansuo()
elseif current_state == 3 then
  my_toast(id, '已经在探索界面了！')
else
  local red_cross_x, red_cross_y = myFindColor(右上红叉)
  if red_cross_x > -1 then
    tap(red_cross_x, red_cross_y)
    mSleep(1000)
    return enter_tansuo()
  else
    my_toast(id, '请手动进入探索界面！')
    mSleep(2000)
    return enter_tansuo()
  end
end
end

function reset_scroll()
  swip(1900, 250, 1900, 1000)
  mSleep(200)
  swip(1900, 250, 1900, 1000)
  mSleep(200)
  swip(1900, 250, 1900, 1000)
  mSleep(200)
  swip(1900, 250, 1900, 1000)
  mSleep(200)
end

function scroll(times)
  for i = 1,times, 1 do
    swip(1900, 900, 1930, 300)
    mSleep(800)
  end
  mSleep(500)
end


function choose_chapter(chapter)	
  reset_scroll()
  local x  = math.ceil(chapter/4)
  if chapter <=20 then
    sysLog(x-1)
    scroll(x-1)
    chapter_tap:case(chapter - 4*(x-1))
  else
    scroll(4)
    chapter_tap:case(chapter)
  end
end


function enter_dungeon(difficuty)
  accept_quest()
  local x, y = findMultiColorInRegionFuzzy(0xe8d4cf,"26|-2|0x723152,2|24|0x753743,0|-27|0x672f38,-31|2|0x763b3f", 95, 1675, 410, 1706, 437) --xx
  if x > -1 then
    if difficuty == 0 then
      tap(542, 547)
      mSleep(500)
    else
      tap(762, 558)
      mSleep(500)
    end
    tap(1538, 1045)
  else
    mSleep(500)
    return enter_dungeon(difficuty)
  end
end



function tansuo_to_dungeon(target_chapter, difficuty)
	local difficuty = difficuty or 1
	local chapter_x, chapter_y = -1, -1
  chapter_x, chapter_y = myFindColor(qucik_chapter[target_chapter])
	sysLog(chapter_x..chapter_y)
  if chapter_x > -1 then
    tap(chapter_x, chapter_y)
    mSleep(500)
  else
    choose_chapter(target_chapter)
  end
  enter_dungeon(difficuty)
end


----------------------------------------------------Step 2: 检测狗粮---------------------------------------------------
--检测是否是n卡
function if_ncard()
	local type_table = {[0] = {125, 922}, [1] = {286,958}, [2] = {422, 1089}, [3] = {470,1263}}  
	tap(112, 1273)
	mSleep(500)
	tap(type_table[_G.gouliang_type][1], type_table[_G.gouliang_type][2])
  mSleep(2000)
end


function if_change_hero(target_hero_num)
	sysLog('换'..target_hero_num..'号阴阳师')
	if target_hero_num == 0 or target_hero_num == 5 then
		do return end
	elseif target_hero_num == 1 then
		target_hero = 晴明
	elseif target_hero_num == 2 then
		target_hero = 神乐
	elseif target_hero_num == 3 then
		target_hero = 博雅
	else
		target_hero = 比丘尼
	end
	my_toast(id, '检测是否更换阴阳师')
	sysLog('检测是否更换阴阳师')
	local hero_x, hero_y = myFindColor(target_hero)
	if hero_x > -1 then
	else
		my_toast(id, '更换阴阳师')
		tap(1091, 1131)
		change_hero:case(target_hero_num)
		mSleep(1000)
	end
end






--检测是否需要更换， 从1-5号位开始
function if_change(slot, skip_lines)
  --sysLog('!!!!!!!!!'..skip_lines)
	if_change_hero(_G.ts_hero)
  local combat_table = {}
  local watch_table = {}
  keepScreen(true)
  for i = 1, 5, 1 do
    if i ~= _G.gouliang_captain then 
      accept_quest()
      local ifchange_x, ifchange_y = findMultiColorInRegionFuzzy(0xf9ac14,"7|-1|0xffad15,-1|7|0xf4bf0d,14|10|0xffd30a,14|16|0xffe605,-12|-7|0xf89819,-14|4|0xfebc11,-13|17|0xfbe504,-6|17|0xefd905,3|-6|0xff9f19", 90, slot[i][1], slot[i][2], slot[i][3], slot[i][4])
      if ifchange_x > -1 then
        my_toast(id, '需要更换狗粮')
        sysLog(ifchange_x..','..ifchange_y..'需要更换狗粮')
        if i <= 3 then
          table.insert(combat_table, i)
        else
          table.insert(watch_table, i)
        end
      end
    end
  end
  keepScreen(false)
  
  --出战位置更换
  if next(combat_table) ~= nil then
    change_ss_tap:case(1)
    mSleep(2000)
    if_ncard()
    my_toast(id, '跳过'..skip_lines..'行')
    skip_ss(skip_lines)
    for k,v in pairs(combat_table) do 
      sysLog('出战位 '..v) 
      change_ss(v)
      mSleep(2000)
    end
    tap(59, 56)
    mSleep(2000)
  end
  
  if next(watch_table) ~= nil then
    change_ss_tap:case(4)
    mSleep(2000)
    if_ncard()
    my_toast(id, '跳过'..skip_lines..'行')
    skip_ss(skip_lines)
    for k,v in pairs(watch_table) do 
      sysLog('观战位 '..v) 
      change_ss(v)
      mSleep(2000)
    end
    tap(59, 56)
    mSleep(2000)
  end
end



--跳过指定前几行
function skip_ss(lines)							
  for i = 1, lines, 1 do																							
		my_swip_2(1666, 1350, 537, 1350, 0, 50, 30)
    mSleep(1000)
  end
end

function get_gouliang_star(input_x)
	keepScreen(true)
	for i = 5,1,-1 do
    accept_quest()
    local x, y = findMultiColorInRegionFuzzy(0x3b332d,"0|-4|0x757474,4|-1|0x767575,0|4|0x7c7b7b", 90, input_x-22+23*i, 1473, input_x+1+23*i, 1502)
		--sysLog(input_x-22+23*i..',1466,'..input_x+1+23*i..',1485')
    if x == -1 then
      star = i+1
			keepScreen(false)
      return star
    end
  end
	keepScreen(false)
	return 8
end

function change_ss(slot_num)
  sysLog('change_ss')
	accept_quest()
  keepScreen(true)
  for i = 2, 7, 1 do
    local emty_x, emty_y = findMultiColorInRegionFuzzy(0xf7dfa3,"-1|-1|0xc4a578,-2|-2|0xddb687,-2|3|0xd1ab7e,-2|0|0xa07e59,-1|0|0xd3b684,-5|-5|0xae8c65,-4|6|0xb08a63,-6|-7|0xa68763,-8|-8|0xad8c65",80,gouliang_position[i][1], gouliang_position[i][2], gouliang_position[i][3], gouliang_position[i][4]);
    local full_x, full_y = findMultiColorInRegionFuzzy(0xffca0d,"-8|1|0xfdcc0b,8|-1|0xfbc30e", 95, gouliang_position[i][1], gouliang_position[i][2], gouliang_position[i][3], gouliang_position[i][4])  --满字
    if emty_x > -1  and full_x == -1 then
      accept_quest()
      local watch_x, watch_y = findMultiColorInRegionFuzzy(0xb4dfff,"13|2|0xbae1ff,32|4|0xb0ddff,22|21|0xb6e0ff",95, emty_x+61, emty_y+136, emty_x+139, emty_y+213)
      local in_combat_x, in_combat_y = findMultiColorInRegionFuzzy(0xffe3c0,"1|14|0xffdfbb,26|-1|0xffdab3,31|20|0xffdab3,40|33|0xffdfba",90,emty_x+61, emty_y+136, emty_x+139, emty_y+213)
      local black_x, black_y = findMultiColorInRegionFuzzy(0xffffff,"35|1|0xedefef,51|0|0xffffff,58|0|0x333130", 95,emty_x-62, emty_y-33, emty_x+121, emty_y+132)
      local red_x, red_y = findMultiColorInRegionFuzzy(0xf2eeee,"4|-21|0x23191b,19|-38|0xf36052,-13|36|0x3e4141,-1|82|0xe96b58",95,emty_x-62, emty_y-33, emty_x+121, emty_y+132)
      local blue_x, blue_y  = findMultiColorInRegionFuzzy(0xa5cae4,"1|92|0x8bb9dd,-31|99|0x7dadd6,40|101|0x7bacd5",95,emty_x-62, emty_y-33, emty_x+121, emty_y+132)
      local white_x, white_y = findMultiColorInRegionFuzzy(0x2a2424,"1|-16|0x504543,-26|63|0xf5f5f5,36|71|0xc89f56",95, emty_x-62, emty_y-33, emty_x+121, emty_y+132)
			
      if watch_x > -1 then
        sysLog('观战gl'..emty_x..','..emty_x..'watch_x:'..watch_x)
      elseif in_combat_x > -1 then
        sysLog('出战gl'..emty_x..','..emty_x..'combat_x:'..in_combat_x)
      elseif black_x > -1 and _G.gouliang_filter[1] then
        sysLog('black'..emty_x..','..emty_x..'combat_x:'..black_x)
      elseif red_x > -1 and _G.gouliang_filter[2] then
        sysLog('red'..emty_x..','..emty_x..'combat_x:'..red_x)
      elseif blue_x > -1 and _G.gouliang_filter[3] then
        sysLog('blue'..emty_x..','..emty_x..'combat_x:'..red_x)
			elseif white_x > -1 and _G.gouliang_filter[0] then
        sysLog('white'..emty_x..','..emty_x..'combat_x:'..red_x)
      elseif _G.gouliang_star_filter[get_gouliang_star(emty_x)-2] then
				sysLog('狗粮星级过滤')
			else
        sysLog('找到gl'..emty_x..'.'..emty_y)
				my_toast(id, '找到'..get_gouliang_star(emty_x)..'星狗粮')
        local new_x = emty_x+100
        local new_y = emty_y+100
        sysLog('new_x '..new_x..';new_y '..new_y)
        local new = pos:new(new_x, new_y)
        local move = {x=ss_position[slot_num][1], y=ss_position[slot_num][2]}
        local step = 28
        local sleep1,sleep2 = 500,20
        new:touchMoveTo(move,step,sleep1,sleep2)
        --swip(new_x, new_y, ss_position[slot_num][1], ss_position[slot_num][2])
        mSleep(2000)
        --tap(59, 56)
        --mSleep(2000)
        keepScreen(false)
        return true
      end
    else
      sysLog(i..'号位未找到')
    end
  end
  keepScreen(false)
  skip_ss(1)
  return change_ss(slot_num)
end




----------------------------------------------------Step 3: 开始刷怪---------------------------------------------------


function next_scene()
  sysLog('滑动进下一界面')
	if _G.target_chapter == 11 then
		my_swip(1977, 1346, 1300, 1346, 35)
	else
		my_swip(1977, 1346, 1400, 1346, 35)
	end
end


function search_for_exp(fight_count)
  sysLog('search_for_exp')
  local count = 0
  --my_toast(id, '寻找经验怪, 同屏找怪'.. _G.searchtime..'次')
  my_toast(id, '寻找经验怪, 同屏找怪3秒')
  local search_t = mTime()
  --while count < _G.searchtime do
  while mTime() - search_t <= 3000 do
    local qTime = mTime()
    accept_quest()
    keepScreen(true)
    local exp_x, exp_y = myFindColor(经验怪)
    --local exp_x, exp_y = findMultiColorInRegionFuzzy(0xaa724f,"-16|-43|0x8a191b,-36|-83|0x2d7888,127|-44|0xa66746,120|-96|0x8a1919,113|-125|0x2d7481", 90, 599, 368, 1613, 1206)
    keepScreen(false)
    if exp_x > -1 then
      --sysLog('11:'..fight_count)
      my_toast(id, '找到经验怪')
      --sysLog('x:'..exp_x..' y:'..exp_y)
      result = '找到经验怪'
      --toast(result .. "　time:" .. mTime() - qTime)
      accept_quest()
      local combat_x, combat_y = findMultiColorInRegionFuzzy(0xf8f9ff,"18|16|0x343b6b,-19|14|0xe2e4fc,4|40|0x3e2215,-4|-44|0xf1acb6", 90, exp_x-300, exp_y-350, exp_x+300, exp_y-50)
      if combat_x > -1 then 
        sysLog('找到战斗')
        tap(combat_x, combat_y)
        mSleep(1000)
        if_outof_sushi()
				combat_x, combat_y = myFindColor(战斗图标)
				if combat_x > -1 then
					my_toast(id, '进入战斗失败')
					check_current_state()
					return search_for_exp(fight_count)
				end
        --check_current_state()	
        if if_start_combat_intime() then
        else
          sysLog('战斗未开始, 跳出战斗循环')
          return search_for_exp(fight_count)
        end
        my_toast(id, '检测狗粮')
        accept_quest()
        local ready_x, ready_y = findMultiColorInRegionFuzzy(0xfffffa,"5|-39|0xfffff9,27|-34|0xfff3d1,27|-1|0xfffaeb,51|-17|0xfff2d0", 90, 1789, 1274, 1798, 1283)
				wait_for_state(准备)
        if_change(slot, tonumber(_G.skiplines))
        --sysLog('12:'..fight_count)
        start_combat(_G.mark_case)
        wait_for_state(副本里面)
        --sysLog('13:'..fight_count)
        local boss_bool = if_boss(fight_count)
        if boss_bool then
          fight_count = fight_count + 1
          sysLog('14:'..fight_count)
          return free_tansuo(fight_count)
        end
        return search_for_exp(fight_count)
      else 
        my_toast(id, '未找到战斗')
        return search_for_exp(fight_count)
      end
      --]]
    else
      result = '未找到'
      --toast(result .. " time:" .. mTime() - qTime)
    end
    count = count + 1
  end
end




----------------------------------------------------Step 4: 汇总---------------------------------------------------
function if_boss(fight_count)
  mSleep(2000)
  my_toast(id, '寻找boss中。。。')
  local boss_x, boss_y = findMultiColorInRegionFuzzy(0x8f1c1e,"32|27|0x8c4f24,29|-4|0xf8e5d6,13|-17|0x455280,19|8|0xede8e3", 90, 776,28,1284,1005)
  if boss_x > -1 then
    my_toast(id, '找到boss')
    if _G.if_fight_boss == 0 then
      tap(boss_x, boss_y)
      if_outof_sushi()
      accept_quest()
      my_toast(id, '检测狗粮')
      accept_quest()
      local ready_x, ready_y = findMultiColorInRegionFuzzy(0xfffffa,"5|-39|0xfffff9,27|-34|0xfff3d1,27|-1|0xfffaeb,51|-17|0xfff2d0", 90, 1789, 1274, 1798, 1283)
      while ready_x == -1 do
        mSleep(500)
        accept_quest()
        ready_x, ready_y = findMultiColorInRegionFuzzy(0xfffffa,"5|-39|0xfffff9,27|-34|0xfff3d1,27|-1|0xfffaeb,51|-17|0xfff2d0", 90, 1789, 1274, 1798, 1283)
      end
      if_change(slot, _G.skiplines)
      boss_result = start_combat(_G.mark_case)
      if boss_result == 'win' then
        mSleep(7000)
        sysLog('21:'..fight_count)
        pick_loot()
        sysLog('22:'..fight_count)
        return true
      else
        mSleep(2000)
        return if_boss(fight_count)
      end
		else
			enter_tansuo()
			return true
		end
	else
		my_toast(id, '未找到boss, 继续刷怪')
		--sysLog('23:'..fight_count)
		return false, fight_count
	end
end




function pick_loot()
  local loot_x, loot_y = findMultiColorInRegionFuzzy(0xb44620,"18|-12|0xfff4d4,-20|-13|0xfff4d4,-18|10|0xfff4d4,20|12|0xfff4d4", 90, 0, 0, 2047, 1535)
  if loot_x > -1 then
    my_toast(id, '找到小纸人...')
    tap(loot_x, loot_y)
    mSleep(1500)
    tap(1635, 1156)
    mSleep(2000)
    return pick_loot()
  else
    my_toast(id, '未找到小纸人...')
    wait_for_state(探索地图)
		open_treasury_box()
  end
end



function open_treasury_box()
	sysLog(_G.if_open_treasury_box)
	if _G.if_open_treasury_box == 0 then
		local treasury_box_x, treasury_box_y = myFindColor(地图宝箱)
		if treasury_box_x > -1 then
			tap(treasury_box_x, treasury_box_y)
			local bool_val = true
			while bool_val do
				accept_quest()
				local x, y = findColorInRegionFuzzy(0x85100f, 85, 1015, 627, 1020, 632)
				if x > -1 then
					my_toast(id,"找到达摩1")
					tap(1020, 850)
					mSleep(200)
					tap(1020, 850)
					mSleep(1000)
					x, y = findColorInRegionFuzzy(0x85100f, 85, 1015, 627, 1020, 632)
					while x > -1 do
					sysLog('还能找到达摩1')
					tap(1020, 850)
					mSleep(200)
					x, y = findColorInRegionFuzzy(0x85100f, 85, 1015, 627, 1020, 632)
					end
					bool_val = false
				else
					sleepRandomLag(100)
				end
			
			end
			bool_val = true
			while bool_val do
				accept_quest()
				local x, y = myFindColor(达摩2)
				if x > -1 then
					my_toast(id,"找到达摩2")
					tap(x, y)
					sleepRandomLag(1000) 
					x, y = myFindColor(达摩2)
				else
					sleepRandomLag(100)
				end
				while x > -1 do
				sysLog('还能找到达摩2')
				tap(x, y)
				sleepRandomLag(1000) 
				x, y = myFindColor(达摩2)
				end
				bool_val = false
			end
		end
	else
	end
end








-----------------------------------------------------自由探索-------------------------------------------------------------

function search_for_all(fight_count)
  sysLog('search_for_all')
  my_toast(id, '寻找怪物')
  local search_t = mTime()
  while mTime() - search_t <= 2000 do
    local qTime = mTime()
    accept_quest()
		local combat_x, combat_y = findMultiColorInRegionFuzzy(0xf8f9ff,"18|16|0x343b6b,-19|14|0xe2e4fc,4|40|0x3e2215,-4|-44|0xf1acb6", 90, 0, 0, 1535, 2047)
		if combat_x > -1 then 
			sysLog('找到战斗')
			tap(combat_x, combat_y)
			mSleep(1000)
			if_outof_sushi()
			combat_x, combat_y = myFindColor(战斗图标)
			if combat_x > -1 then
				my_toast(id, '进入战斗失败')
				check_current_state()
				return search_for_all(fight_count)
			end
			if if_start_combat_intime() then
			else
				sysLog('战斗未开始, 跳出战斗循环')
				return search_for_all(fight_count)
			end
			my_toast(id, '检测狗粮')
			accept_quest()
			if_change(slot, tonumber(_G.skiplines))
			start_combat(_G.mark_case)
			wait_for_state(副本里面)
			--sysLog('13:'..fight_count)
			local boss_bool = if_boss(fight_count)
			if boss_bool then
				fight_count = fight_count + 1
				sysLog('14:'..fight_count)
				return free_tansuo(fight_count)
			end
			return search_for_all(fight_count)
		else 
			my_toast(id, '未找到战斗')
		end
  end
end


function free_tansuo(fight_count)
  if _G.if_liaotupo then
    _G.time_pass = mTime() - _G.liaotupo_t
    main_liaotupo('combine', tonumber(tupo_results['200']))
  end
  
  my_toast(id, '当前战斗次数: '..fight_count.."/".._G.fighttime)
	mSleep(1000)
  sysLog('当前战斗次数: '..fight_count.."/".._G.fighttime)
  if fight_count >= _G.fighttime then
    sysLog('探索任务完成')
    my_exist(_G.exist_method)
  end
  
  enter_tansuo()
	tansuo_to_dungeon(_G.target_chapter, _G.difficuty)
  wait_for_state(副本里面)
  sysLog('检测锁定')
  my_toast(id, '检测是否锁定出战式神')
  local lockss_x, lockss_y = findColorInRegionFuzzy(0x4b5ee9, 90, 1571, 1386, 1642, 1460)  --检测是否锁定
  if lockss_x > -1 then
    sysLog('解锁')
    tap(lockss_x, lockss_y)
  end
  my_toast(id, '准备刷怪')
	
	sysLog(_G.search_method)
	if _G.search_method == 0 then 
	  search_for_all(fight_count)
		for find_time = 1, 4, 1 do
			my_toast(id, '找怪第'..find_time..'次')
			next_scene()  --4次
			search_for_all(fight_count)
		end
	else
		search_for_exp(fight_count)
		for find_time = 1, 4, 1 do
			my_toast(id, '找怪第'..find_time..'次')
			next_scene()  --4次
			search_for_exp(fight_count)
		end
	end
	my_toast(id, '一轮完成, 退出探索')
	state_transit(副本里面, 确认退出, 78, 103)
  state_transit(确认退出, 探索地图, 1244, 842)
  local this_fight_count = fight_count + 1
  
  if _G.if_tupo then
    if_tupo = this_fight_count - math.floor(this_fight_count/tupo_sep)*tupo_sep
    sysLog(if_tupo)
    my_toast(id, '当前探索次数'..this_fight_count..'; 突破间隔'..tupo_sep)
    if if_tupo == 0 then
      sysLog('已经刷完'..this_fight_count..'次, 开始结界突破')
      my_toast(id, '已经刷完'..this_fight_count..'次副本, 现在开始个人结界突破')
      main_gerentupo(tupo_results)
    end
  end
  return free_tansuo(this_fight_count)
end


function main_freets(zyts_ret, zyts_results)
  if zyts_ret==0 then	
    toast("您选择了取消，停止脚本运行")
    lua_exit()
  end
	_G.ts_hero = tonumber(zyts_results['1041']) + 1
  _G.fighttime = tonumber(zyts_results['99'])
  _G.skiplines = tonumber(zyts_results['100'])
	_G.difficuty = tonumber(zyts_results['101'])
  _G.tupo_sep = tonumber(zyts_results['102'])
  _G.gouliang_captain = tonumber(zyts_results['104'])
  _G.target_chapter = tonumber(zyts_results['105'])+1
  _G.if_fight_boss = tonumber(zyts_results['106'])
	_G.search_method = tonumber(zyts_results['107'])
	_G.if_open_treasury_box = tonumber(zyts_results['108'])
	_G.gouliang_type = tonumber(zyts_results['999'])

	
	_G.if_liaotupolist = {true, true, true}
	_G.liaotupo_t = 10
  _G.time_pass = mTime() - _G.liaotupo_t
	
  if zyts_results['98'] == '0' then
		tupo_ret,tupo_results = showUI("tupo.json")
    if tupo_ret==0 then	
      toast("突破未设置, 请从探索页面选择取消突破")
      lua_exit()
    end
		if tupo_results['10'] == '0' then
			_G.if_tupo = true
			_G.if_liaotupo = false
		elseif tupo_results['10'] == '1' then
			_G.if_tupo = false
			_G.if_liaotupo = true
		elseif tupo_results['10'] == '0@1' then
			_G.if_tupo = true
			_G.if_liaotupo = true
		else
			_G.if_tupo = false
			_G.if_liaotupo = false
		end
	else
    _G.if_tupo = false
    _G.if_liaotupo = false
  end
	
  sysLogLst(tostring(_G.if_tupo), tostring(_G.if_liaotupo))
  
  if _G.fighttime == 0 then
    _G.fighttime = 999999
  end

-- 达摩过滤--
	_G.gouliang_filter = {[0] = false, [1] = false, [2] = false, [3] = false}
	filter_index = str_split(zyts_results['1000'])	
	if filter_index ~= nil then
		for k,v in pairs(filter_index) do
			toast(v)
			_G.gouliang_filter[v] = true
		end
	end
	
	-- 狗粮过滤--
	_G.gouliang_star_filter = {[0] = false, [1] = false, [2] = false, [3] = false, [4] = false}
	star_filter_index = str_split(zyts_results['1001'])	
	if star_filter_index ~= nil then
		for k,v in pairs(star_filter_index) do
			toast(v)
			_G.gouliang_star_filter[v] = true
		end
	end
	_G.mark_case = tonumber(zyts_results['1042']) + 10
	sysLog(_G.mark_case)
	free_tansuo(0)
end

















------------------------------------------老探索-------------------------------------------

