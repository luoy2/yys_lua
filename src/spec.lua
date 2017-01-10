------------------------------------------------color table -------------------------------------------------
-------------------------主界面--------------------------------------
探索灯笼 = {0x150f0d,"0|13|0x19110e,-1|30|0x1f160f,8|3|0xffe9a6,13|-7|0x150e0e,34|-7|0x160f0e,22|0|0xffedb1,17|0|0x17100e,23|-1|0xffecb2,28|2|0x17110d",90,241,137,906,744}
组队 = {0x8f5ea0,"-45|-4|0xbdb5a4,-38|45|0xf8f3e0,59|17|0x603d3a", 85, 434,1413, 438, 1417} --主界面的组队按钮
悬赏  = {0xefe2b9,"-2|14|0xe9d59a,-1|36|0xdbc26d,40|6|0xeddca7,51|39|0xd14c47,22|29|0xe5cd7b,31|39|0xb63c3a,33|62|0xe9d6b8,10|-32|0x1d1517,22|-8|0x7b76d4",90,1664,551,2042,930}
-----------------------------------------------------------------------------------------------
-- 是否处于组队界面
组队界面 = {0x8d7245,"-10|75|0x7d1b1e,4|65|0xe6cc96,1012|656|0xf3b25e,1573|682|0xf3b25e,1772|-119|0x783a47,1765|1|0x8d7245,1765|67|0xedd9a1,1517|641|0x2c2821,-28|-134|0xe3c66b",90,46,371,233,771}
-- 组队界面妖气封印黑字
妖气封印1 = {0x312d29,"0|6|0x37332d,-1|11|0x332f2a,-1|18|0x272420,20|8|0x2c2924,19|-2|0x2f2b26,12|17|0x534c44,40|11|0x4d4740,72|9|0x3f3a34,33|22|0xe8d6c1",90,208,483,601,1319}
妖气封印 = {0xf4efdc,"-2|11|0xf6f1de,11|15|0xd2ccba,17|5|0x420a0a,30|-12|0xf7f2df,46|-2|0xf7f2df,48|13|0xf0ebd8,36|12|0x470b0b,55|7|0x5a0909,-19|4|0xf8f3e0",90,631,459,873,538}
-- 组队界面的刷新按钮
组队刷新 = {0xf3b25e,"-45|-33|0x953a2e,-45|45|0x983d2e,216|44|0x983d2e,218|-31|0x983c2e,162|7|0xf3b25e,61|-10|0x272420,56|-9|0xf3b25e,49|-8|0x413628,56|-4|0x483b2a",90,1064,1242,1369,1364}
组队开始 = {0xf3b25e,"-1101|0|0xdf6851",90,1420,1105,1714,1208}
组队等待 = {0xc7bdb4,"-1088|-14|0xdf6851",90,1425,1099,1706,1209}


------------------------------------------------------------------------------------------------------------------------------------------------------------
顶点退出 = {0x240d57,"10|63|0x1d1240,61|67|0x1c183b,70|26|0x24316f,53|27|0x313c7e,31|12|0xf0f5fb,38|47|0xdeeaf8,20|30|0xf0f5fb",90,21,25,162,164}
右上红叉 = {0x6b333c,"-21|19|0x74363a,4|36|0x753642,21|16|0x763255,-1|17|0xe8d4cf",90,1354,28,2045,666}
聊天红叉 = {0xe9d7d1,"-22|-5|0x75393d,37|0|0x682b42,6|-25|0x69353e,6|27|0x70313c",90,786,0,926,145}
达摩2 = {0x111110,"-29|-5|0xbb471a,20|-9|0xbb471a,-11|-22|0xf8f0e6",90,972,998,1082,1073}
送心 = {0xeb8649,"-37|4|0xf18a5d,-39|-10|0xfaf5ca,-43|20|0xfaf2e5,-27|20|0xfdfbf0",80,620,397,811,1084}
收心 = {0xf5c95c,"-35|6|0xffba00,-40|-10|0xfff6ad,-21|18|0xf6ffdd,-12|-25|0xa65a3e",80,620,397,811,1084}

业原火 = {0xf2faf9,"-2|-31|0x110c10,34|19|0x116654,-62|27|0xb93729",90,1360,691,1498,821}
业原火挑战 = {0xf3b25e,"-289|-273|0xf2faf9,-274|-306|0xf9cc51,-294|-303|0x130e12,-238|-250|0x259c82,-125|-242|0x1a171f",90,1136,515,1601,1037}


不动风车 = {0x425086,"39|12|0x4e5f92,52|38|0x51669a,13|85|0x42342d,-21|55|0x3e2a21",90,1821,522,1959,643}

------------------------------------------------主界面功能区-------------------------------------------------
sub_function = switch{
	['collection'] = function() tap(189, 1395) mSleep(1000) end,
	['party'] = function() tap(400, 1395) mSleep(1000) end,
	['guild'] = function() tap(633, 1395) mSleep(1000) end,
	['shop'] = function() tap(888, 1395) mSleep(1000) end,
	['quest'] = function() tap(1091, 1395) mSleep(1000) end,
	['friend'] = function() tap(1328, 1395) mSleep(1000) end,
	['spell'] = function() tap(1560, 1395) mSleep(1000) end,
	['ss'] = function() tap(1762, 1395) mSleep(1000) end
	}


------------------------------------------------妖气封印-------------------------------------------------
yqfy_ocr_table = {{849,574,1050,629}, {849,740,1050,792}, {851,898,1041,954}, {852,1059,1049,1116}}
海坊主 = {0x3c3933,"1|5|0x302d28,0|13|0x4d4a43,7|9|0xf8f3e0,17|-3|0x35322d,13|1|0xf7f2df,20|8|0xf8f3e0,16|18|0xf8f3e0,16|20|0xf8f3e0,20|25|0x272420",90}
经验 = {0x69655c,"-5|10|0x2d2a26,3|9|0x44413a,-6|14|0xf8f3e0,7|20|0xede8d6,20|4|0x625f57,17|18|0x423f39,22|22|0xf8f3e0,46|0|0x47443e,48|16|0x393631",90}
二口女 = {0x46433d,"-1|6|0xf2e9d4,-1|10|0xdfcdb3,-1|18|0x47443e,34|9|0x47443e,43|10|0xdcb983,55|5|0x272420,73|-1|0xdfcdb3,86|-4|0x4b4841,89|19|0x2a2723",90}
小黑 = {0x504d46,"-4|11|0x2a2723,-6|19|0xf8f3e0,2|20|0xf8f3e0,-3|23|0x2f2c27,8|9|0xf0ebd9,13|8|0x35322d,16|8|0xe2ddcb,9|14|0xe3decd,13|13|0x4a4740",90}
金币 = {0x2c2925,"-5|3|0x2e2a26,-11|4|0x393630,-8|7|0xf4efdc,1|7|0xf8f3e0,-4|12|0x2c2925,-8|16|0xf8f3e0,1|17|0xf4ebd3,-4|23|0x322f2a,-4|34|0x36332e",90}
椒图 = {0x3e3b35,"-3|-2|0xede8d6,3|-4|0xdfdac9,4|3|0xf4efdc,-3|11|0xddd9c8,0|9|0x433f39,0|15|0x272420,0|-10|0x36332e,6|-7|0x646058,45|11|0x4d4943",90}
骨女 = {0x3e3b35,"3|1|0xf8f3e0,4|1|0xf8f3e0,6|1|0xf5f0dd,8|1|0x36332e,12|2|0xe4e0ce,14|4|0x656159,14|7|0xd2cdbd,13|9|0x69665d,14|11|0xd0cbbb",90}
哥哥 = {0x4b4841,"4|2|0xf8f3e0,8|-2|0x514d46,-1|14|0x35322d,2|18|0xd6d1c1,4|18|0x413e38,17|5|0x2f2c27,19|5|0xe7e2d1,22|5|0x545049,18|20|0xf7f2df",90}
饿鬼 = {0x36332e,"2|4|0xf1ecd9,6|2|0x292622,5|9|0xf6f1de,1|9|0x535049,5|14|0xf3eedb,1|20|0x37342e,13|8|0x2a2723,8|19|0xf0ebd9,13|23|0x292622",90}
------------------------------------------------突破-------------------------------------------------



all_enemy = {}
all_enemy[1] 	= {393, 480}  --+63
all_enemy[2] 	= {944, 480}
all_enemy[3] 	= {1495,480}
all_enemy[4]	= {393,695}
all_enemy[5]	= {944,695}
all_enemy[6]	= {1495,695}
all_enemy[7]	= {393,910}
all_enemy[8]	= {944,910}
all_enemy[9]	= {1495,910}

------------------------------------------------狗粮-------------------------------------------------

slot = {}
slot[1] = {1301,650,1734,900}
slot[2] = {890,650,1300,900}
slot[3] = {400,650,889,900}
slot[4] = {83,512,363,944}
slot[5] = {294,318,570,578}
slot[6] = {274,577,443,879}

--[[
--白蛋
--赤舌
--盗墓
--灯笼
--寄生
--唐纸
--提灯
--鬼赤
--鬼黄
--鬼绿
--鬼青
--涂壁
--帚神
--]]


ss_position = {}
ss_position[1] = {334, 739}
ss_position[2] = {1020, 739}
ss_position[3] = {1685, 739}
ss_position[4] = {477, 660}
ss_position[5] = {1360, 660}



gouliang_position = {}
gouliang_position[1] = {265,1200,464,1260}
gouliang_position[2] = {465,1200,669,1260}
gouliang_position[3] = {670,1200,871,1260}
gouliang_position[4] = {872,1200,1073,1260}
gouliang_position[5] = {1074,1200,1278,1260}
gouliang_position[6] = {1279,1200,1477,1260}
gouliang_position[7] = {1478,1200,1663,1260}


------------------------------------------------业原火难度-------------------------------------------------
choose_yeyuanhuo = switch{
[1] = function() tap(660, 480) end,
[2] = function() tap(660, 638) end,
[3] = function() tap(660, 786) end
}


------------------------------------------------悬赏-------------------------------------------------
xuanshang_t_table = {{488,887,595,938}, {988,889,1060,934}, {1455,886,1554,937}}
xuanshang_ss_table = {{346,414,745,797}, {828,413,1230,798}, {1309,413,1711,799}}
mystery_table = {{"兵俑", "第三章", "兵勇12*1"},
{"丑时之女", "第十章", "丑女1*1 丑女2*2 御魂5层*1 御魂7层*1"},
{"大天狗", "第十五章", "提灯3*1 御魂4层*1 御魂10层*2"},
{"独眼小僧", "第十一章", "武士之灵2*3 独眼小僧12*2"},
{"骨女", "妖气封印", "骨女*3"},
{"鬼使白", "御魂4层", "*1"},
{"鬼使黑", "妖气封印", "鬼使黑*3"},
{"海坊主", "妖气封印", "海坊主*3"},
{"河童", "第七章", "河童12*1"},
{"蝴蝶精", "第六章", "蝴蝶精12*1或者御魂8层*1"},
{"椒图", "妖气封印", "椒图*3"},
{"傀儡师", "第十章", "丑时之女12*1, 傀儡师12*1"},
{"鲤鱼精", "第七章", "鲤鱼精1*3 鲤鱼精2*1 河童1*1 提灯小僧3*2"},
{"镰鼬", "御魂5层", "*1"},
{"孟婆", "御魂5层", "*1"},
{"青蛙瓷器", "御魂3层", "*1"},
{"犬神", "御魂4层", "*1"},
{"三尾狐", "第十八章", "三尾狐123*2 记得难度选简单"},
{"山童", "第十六章", "饿鬼123*2"},
{"食梦貘", "御魂4层", "*2"},
{"桃花妖", "御魂3层", "*1"},
{"天邪鬼赤", "第十三章", "饿鬼123*3"},
{"天邪鬼黄", "妖气封印", "海坊主*3"},
{"天邪鬼青", "妖气封印", "二口女*3 跳跳哥哥*3"},
{"跳跳哥哥", "妖气封印", "跳跳哥哥*3"},
{"童男", "第十二章", "童男12*1或御魂4层*1"},
{"童女", "第三章", "天邪鬼黄2*3 赤舌2*2 兵俑1*2(简单难度,困难只有1个)"},
{"涂壁", "第十四章", "涂壁12*6"},
{"巫蛊师", "御魂6层", "*1"},
{"吸血姬", "御魂2层", "*1"},
{"鸦天狗", "第十二章", "海坊主2*2 童男12*2 "},
{"阎魔", "御魂6层", "*1"},
{"妖狐", "御魂2层", "*1"},
{"莹草", "御魂2层, 御魂9层, 御魂10层", "*1; 业原火有好多"},
{"雨女", "御魂6层", "*1"},
{"座敷童子", "斗鸡,结界突破, 第十章", "傀儡师2*2, 觉2*2"}}





















