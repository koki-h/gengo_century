# 西暦年を渡すと元年からその年までの経過年数が100で割り切れる元号を返す。
class Gengo
  # 元号は https://www.benricho.org/nenrei/sei-gen.all.html のデータを使用
  GENGO_LIST =[
    {:start=>645, :name_kanji=>"大化", :name_kana=>"たいか", :ns_dyna=>nil},
    {:start=>650, :name_kanji=>"白雉", :name_kana=>"はくち・びゃくち", :ns_dyna=>nil},
    {:start=>686, :name_kanji=>"朱鳥", :name_kana=>"しゅちょう・すちょう・あかみとり", :ns_dyna=>nil},
    {:start=>701, :name_kanji=>"大宝", :name_kana=>"たいほう・だいほう", :ns_dyna=>nil},
    {:start=>704, :name_kanji=>"慶雲", :name_kana=>"きょううん・けいうん", :ns_dyna=>nil},
    {:start=>708, :name_kanji=>"和銅", :name_kana=>"わどう", :ns_dyna=>nil},
    {:start=>715, :name_kanji=>"霊亀", :name_kana=>"れいき", :ns_dyna=>nil},
    {:start=>717, :name_kanji=>"養老", :name_kana=>"ようろう", :ns_dyna=>nil},
    {:start=>724, :name_kanji=>"神亀", :name_kana=>"じんき・しんき", :ns_dyna=>nil},
    {:start=>729, :name_kanji=>"天平", :name_kana=>"てんぴょう・てんびょう", :ns_dyna=>nil},
    {:start=>749, :name_kanji=>"天平感宝", :name_kana=>"てんぴょうかんぽう・てんびょうかんぽう", :ns_dyna=>nil},
    {:start=>749, :name_kanji=>"天平勝宝", :name_kana=>"てんぴょうしょうほう・てんびょうしょうほう", :ns_dyna=>nil},
    {:start=>757, :name_kanji=>"天平宝字", :name_kana=>"てんぴょうほうじ・てんびょうほうじ", :ns_dyna=>nil},
    {:start=>765, :name_kanji=>"天平神護", :name_kana=>"てんぴょうじんご・てんびょうじんご", :ns_dyna=>nil},
    {:start=>767, :name_kanji=>"神護景雲", :name_kana=>"じんごけいうん", :ns_dyna=>nil},
    {:start=>770, :name_kanji=>"宝亀", :name_kana=>"ほうき", :ns_dyna=>nil},
    {:start=>781, :name_kanji=>"天応", :name_kana=>"てんおう・てんのう", :ns_dyna=>nil},
    {:start=>782, :name_kanji=>"延暦", :name_kana=>"えんりゃく", :ns_dyna=>nil},
    {:start=>806, :name_kanji=>"大同", :name_kana=>"だいどう・たいどう", :ns_dyna=>nil},
    {:start=>810, :name_kanji=>"弘仁", :name_kana=>"こうにん", :ns_dyna=>nil},
    {:start=>824, :name_kanji=>"天長", :name_kana=>"てんちょう", :ns_dyna=>nil},
    {:start=>834, :name_kanji=>"承和", :name_kana=>"じょうわ・しょうわ", :ns_dyna=>nil},
    {:start=>848, :name_kanji=>"嘉祥", :name_kana=>"かしょう・かじょう", :ns_dyna=>nil},
    {:start=>851, :name_kanji=>"仁寿", :name_kana=>"にんじゅ", :ns_dyna=>nil},
    {:start=>854, :name_kanji=>"斉衡", :name_kana=>"さいこう", :ns_dyna=>nil},
    {:start=>857, :name_kanji=>"天安", :name_kana=>"てんあん・てんなん", :ns_dyna=>nil},
    {:start=>859, :name_kanji=>"貞観", :name_kana=>"じょうがん・じょうかん", :ns_dyna=>nil},
    {:start=>877, :name_kanji=>"元慶", :name_kana=>"がんぎょう・かんきょう・げんけい", :ns_dyna=>nil},
    {:start=>885, :name_kanji=>"仁和", :name_kana=>"にんな・にんわ", :ns_dyna=>nil},
    {:start=>889, :name_kanji=>"寛平", :name_kana=>"かんぴょう・かんぺい・かんへい", :ns_dyna=>nil},
    {:start=>898, :name_kanji=>"昌泰", :name_kana=>"しょうたい", :ns_dyna=>nil},
    {:start=>901, :name_kanji=>"延喜", :name_kana=>"えんぎ・えんき", :ns_dyna=>nil},
    {:start=>923, :name_kanji=>"延長", :name_kana=>"えんちょう", :ns_dyna=>nil},
    {:start=>931, :name_kanji=>"承平", :name_kana=>"じょうへい・しょうへい", :ns_dyna=>nil},
    {:start=>938, :name_kanji=>"天慶", :name_kana=>"てんぎょう・てんきょう・てんけい", :ns_dyna=>nil},
    {:start=>947, :name_kanji=>"天暦", :name_kana=>"てんりゃく", :ns_dyna=>nil},
    {:start=>957, :name_kanji=>"天徳", :name_kana=>"てんとく", :ns_dyna=>nil},
    {:start=>961, :name_kanji=>"応和", :name_kana=>"おうわ", :ns_dyna=>nil},
    {:start=>964, :name_kanji=>"康保", :name_kana=>"こうほう・こうほ", :ns_dyna=>nil},
    {:start=>968, :name_kanji=>"安和", :name_kana=>"あんな・あんわ", :ns_dyna=>nil},
    {:start=>970, :name_kanji=>"天禄", :name_kana=>"てんろく", :ns_dyna=>nil},
    {:start=>974, :name_kanji=>"天延", :name_kana=>"てんえん", :ns_dyna=>nil},
    {:start=>976, :name_kanji=>"貞元", :name_kana=>"じょうげん", :ns_dyna=>nil},
    {:start=>978, :name_kanji=>"天元", :name_kana=>"てんげん", :ns_dyna=>nil},
    {:start=>983, :name_kanji=>"永観", :name_kana=>"えいかん", :ns_dyna=>nil},
    {:start=>985, :name_kanji=>"寛和", :name_kana=>"かんな・かんわ", :ns_dyna=>nil},
    {:start=>987, :name_kanji=>"永延", :name_kana=>"えいえん", :ns_dyna=>nil},
    {:start=>989, :name_kanji=>"永祚", :name_kana=>"えいそ", :ns_dyna=>nil},
    {:start=>990, :name_kanji=>"正暦", :name_kana=>"しょうりゃく", :ns_dyna=>nil},
    {:start=>995, :name_kanji=>"長徳", :name_kana=>"ちょうとく", :ns_dyna=>nil},
    {:start=>999, :name_kanji=>"長保", :name_kana=>"ちょうほう・ちょうほ", :ns_dyna=>nil},
    {:start=>1004, :name_kanji=>"寛弘", :name_kana=>"かんこう", :ns_dyna=>nil},
    {:start=>1013, :name_kanji=>"長和", :name_kana=>"ちょうわ", :ns_dyna=>nil},
    {:start=>1017, :name_kanji=>"寛仁", :name_kana=>"かんにん", :ns_dyna=>nil},
    {:start=>1021, :name_kanji=>"治安", :name_kana=>"じあん・ちあん", :ns_dyna=>nil},
    {:start=>1024, :name_kanji=>"万寿", :name_kana=>"まんじゅ", :ns_dyna=>nil},
    {:start=>1028, :name_kanji=>"長元", :name_kana=>"ちょうげん", :ns_dyna=>nil},
    {:start=>1037, :name_kanji=>"長暦", :name_kana=>"ちょうりゃく", :ns_dyna=>nil},
    {:start=>1040, :name_kanji=>"長久", :name_kana=>"ちょうきゅう", :ns_dyna=>nil},
    {:start=>1044, :name_kanji=>"寛徳", :name_kana=>"かんとく", :ns_dyna=>nil},
    {:start=>1046, :name_kanji=>"永承", :name_kana=>"えいしょう・えいじょう", :ns_dyna=>nil},
    {:start=>1053, :name_kanji=>"天喜", :name_kana=>"てんぎ・てんき", :ns_dyna=>nil},
    {:start=>1058, :name_kanji=>"康平", :name_kana=>"こうへい", :ns_dyna=>nil},
    {:start=>1065, :name_kanji=>"治暦", :name_kana=>"じりゃく・ちりゃく", :ns_dyna=>nil},
    {:start=>1069, :name_kanji=>"延久", :name_kana=>"えんきゅう", :ns_dyna=>nil},
    {:start=>1074, :name_kanji=>"承保", :name_kana=>"じょうほう・しょうほう・じょうほ・しょうほ", :ns_dyna=>nil},
    {:start=>1077, :name_kanji=>"承暦", :name_kana=>"じょうりゃく・しょうりゃく", :ns_dyna=>nil},
    {:start=>1081, :name_kanji=>"永保", :name_kana=>"えいほう・えいほ", :ns_dyna=>nil},
    {:start=>1084, :name_kanji=>"応徳", :name_kana=>"おうとく", :ns_dyna=>nil},
    {:start=>1087, :name_kanji=>"寛治", :name_kana=>"かんじ", :ns_dyna=>nil},
    {:start=>1095, :name_kanji=>"嘉保", :name_kana=>"かほう", :ns_dyna=>nil},
    {:start=>1097, :name_kanji=>"永長", :name_kana=>"えいちょう", :ns_dyna=>nil},
    {:start=>1097, :name_kanji=>"承徳", :name_kana=>"じょうとく・しょうとく", :ns_dyna=>nil},
    {:start=>1099, :name_kanji=>"康和", :name_kana=>"こうわ", :ns_dyna=>nil},
    {:start=>1104, :name_kanji=>"長治", :name_kana=>"ちょうじ", :ns_dyna=>nil},
    {:start=>1106, :name_kanji=>"嘉承", :name_kana=>"かしょう・かじょう", :ns_dyna=>nil},
    {:start=>1108, :name_kanji=>"天仁", :name_kana=>"てんにん", :ns_dyna=>nil},
    {:start=>1110, :name_kanji=>"天永", :name_kana=>"てんえい", :ns_dyna=>nil},
    {:start=>1113, :name_kanji=>"永久", :name_kana=>"えいきゅう", :ns_dyna=>nil},
    {:start=>1118, :name_kanji=>"元永", :name_kana=>"げんえい", :ns_dyna=>nil},
    {:start=>1120, :name_kanji=>"保安", :name_kana=>"ほうあん・ほあん", :ns_dyna=>nil},
    {:start=>1124, :name_kanji=>"天治", :name_kana=>"てんじ", :ns_dyna=>nil},
    {:start=>1126, :name_kanji=>"大治", :name_kana=>"だいじ・たいじ", :ns_dyna=>nil},
    {:start=>1131, :name_kanji=>"天承", :name_kana=>"てんしょう・てんじょう", :ns_dyna=>nil},
    {:start=>1132, :name_kanji=>"長承", :name_kana=>"ちょうしょう・ちょうじょう", :ns_dyna=>nil},
    {:start=>1135, :name_kanji=>"保延", :name_kana=>"ほうえん・ほえん", :ns_dyna=>nil},
    {:start=>1141, :name_kanji=>"永治", :name_kana=>"えいじ", :ns_dyna=>nil},
    {:start=>1142, :name_kanji=>"康治", :name_kana=>"こうじ", :ns_dyna=>nil},
    {:start=>1144, :name_kanji=>"天養", :name_kana=>"てんよう", :ns_dyna=>nil},
    {:start=>1145, :name_kanji=>"久安", :name_kana=>"きゅうあん", :ns_dyna=>nil},
    {:start=>1151, :name_kanji=>"仁平", :name_kana=>"にんぺい・にんぴょう", :ns_dyna=>nil},
    {:start=>1154, :name_kanji=>"久寿", :name_kana=>"きゅうじゅ", :ns_dyna=>nil},
    {:start=>1156, :name_kanji=>"保元", :name_kana=>"ほうげん・ほげん", :ns_dyna=>nil},
    {:start=>1159, :name_kanji=>"平治", :name_kana=>"へいじ", :ns_dyna=>nil},
    {:start=>1160, :name_kanji=>"永暦", :name_kana=>"えいりゃく", :ns_dyna=>nil},
    {:start=>1161, :name_kanji=>"応保", :name_kana=>"おうほう・おうほ", :ns_dyna=>nil},
    {:start=>1163, :name_kanji=>"長寛", :name_kana=>"ちょうかん", :ns_dyna=>nil},
    {:start=>1165, :name_kanji=>"永万", :name_kana=>"えいまん", :ns_dyna=>nil},
    {:start=>1166, :name_kanji=>"仁安", :name_kana=>"にんあん・にんなん", :ns_dyna=>nil},
    {:start=>1169, :name_kanji=>"嘉応", :name_kana=>"かおう", :ns_dyna=>nil},
    {:start=>1171, :name_kanji=>"承安", :name_kana=>"じょうあん・しょうあん", :ns_dyna=>nil},
    {:start=>1175, :name_kanji=>"安元", :name_kana=>"あんげん", :ns_dyna=>nil},
    {:start=>1177, :name_kanji=>"治承", :name_kana=>"じしょう・ちしょう", :ns_dyna=>nil},
    {:start=>1181, :name_kanji=>"養和", :name_kana=>"ようわ", :ns_dyna=>nil},
    {:start=>1182, :name_kanji=>"寿永", :name_kana=>"じゅえい", :ns_dyna=>nil},
    {:start=>1184, :name_kanji=>"元暦", :name_kana=>"げんりゃく", :ns_dyna=>nil},
    {:start=>1185, :name_kanji=>"文治", :name_kana=>"ぶんじ", :ns_dyna=>nil},
    {:start=>1190, :name_kanji=>"建久", :name_kana=>"けんきゅう", :ns_dyna=>nil},
    {:start=>1199, :name_kanji=>"正治", :name_kana=>"しょうじ", :ns_dyna=>nil},
    {:start=>1201, :name_kanji=>"建仁", :name_kana=>"けんにん", :ns_dyna=>nil},
    {:start=>1204, :name_kanji=>"元久", :name_kana=>"げんきゅう", :ns_dyna=>nil},
    {:start=>1206, :name_kanji=>"建永", :name_kana=>"けんえい", :ns_dyna=>nil},
    {:start=>1207, :name_kanji=>"承元", :name_kana=>"じょうげん", :ns_dyna=>nil},
    {:start=>1211, :name_kanji=>"建暦", :name_kana=>"けんりゃく", :ns_dyna=>nil},
    {:start=>1214, :name_kanji=>"建保", :name_kana=>"けんぽう・けんぽ・けんほう", :ns_dyna=>nil},
    {:start=>1219, :name_kanji=>"承久", :name_kana=>"じょうきゅう・しょうきゅう", :ns_dyna=>nil},
    {:start=>1222, :name_kanji=>"貞応", :name_kana=>"じょうおう・ていおう", :ns_dyna=>nil},
    {:start=>1224, :name_kanji=>"元仁", :name_kana=>"げんにん", :ns_dyna=>nil},
    {:start=>1225, :name_kanji=>"嘉禄", :name_kana=>"かろく", :ns_dyna=>nil},
    {:start=>1228, :name_kanji=>"安貞", :name_kana=>"あんてい", :ns_dyna=>nil},
    {:start=>1229, :name_kanji=>"寛喜", :name_kana=>"かんぎ・かんき", :ns_dyna=>nil},
    {:start=>1232, :name_kanji=>"貞永", :name_kana=>"じょうえい・ていえい", :ns_dyna=>nil},
    {:start=>1233, :name_kanji=>"天福", :name_kana=>"てんぷく・てんふく", :ns_dyna=>nil},
    {:start=>1234, :name_kanji=>"文暦", :name_kana=>"ぶんりゃく・もんれき", :ns_dyna=>nil},
    {:start=>1235, :name_kanji=>"嘉禎", :name_kana=>"かてい", :ns_dyna=>nil},
    {:start=>1238, :name_kanji=>"暦仁", :name_kana=>"りゃくにん", :ns_dyna=>nil},
    {:start=>1239, :name_kanji=>"延応", :name_kana=>"えんおう・えんのう", :ns_dyna=>nil},
    {:start=>1240, :name_kanji=>"仁治", :name_kana=>"にんじ", :ns_dyna=>nil},
    {:start=>1243, :name_kanji=>"寛元", :name_kana=>"かんげん", :ns_dyna=>nil},
    {:start=>1247, :name_kanji=>"宝治", :name_kana=>"ほうじ", :ns_dyna=>nil},
    {:start=>1249, :name_kanji=>"建長", :name_kana=>"けんちょう", :ns_dyna=>nil},
    {:start=>1256, :name_kanji=>"康元", :name_kana=>"こうげん", :ns_dyna=>nil},
    {:start=>1257, :name_kanji=>"正嘉", :name_kana=>"しょうか", :ns_dyna=>nil},
    {:start=>1259, :name_kanji=>"正元", :name_kana=>"しょうげん", :ns_dyna=>nil},
    {:start=>1260, :name_kanji=>"文応", :name_kana=>"ぶんおう", :ns_dyna=>nil},
    {:start=>1261, :name_kanji=>"弘長", :name_kana=>"こうちょう", :ns_dyna=>nil},
    {:start=>1264, :name_kanji=>"文永", :name_kana=>"ぶんえい", :ns_dyna=>nil},
    {:start=>1275, :name_kanji=>"建治", :name_kana=>"けんじ", :ns_dyna=>nil},
    {:start=>1278, :name_kanji=>"弘安", :name_kana=>"こうあん", :ns_dyna=>nil},
    {:start=>1288, :name_kanji=>"正応", :name_kana=>"しょうおう", :ns_dyna=>nil},
    {:start=>1293, :name_kanji=>"永仁", :name_kana=>"えいにん", :ns_dyna=>nil},
    {:start=>1299, :name_kanji=>"正安", :name_kana=>"しょうあん", :ns_dyna=>nil},
    {:start=>1302, :name_kanji=>"乾元", :name_kana=>"けんげん", :ns_dyna=>nil},
    {:start=>1303, :name_kanji=>"嘉元", :name_kana=>"かげん", :ns_dyna=>nil},
    {:start=>1307, :name_kanji=>"徳治", :name_kana=>"とくじ", :ns_dyna=>nil},
    {:start=>1308, :name_kanji=>"延慶", :name_kana=>"えんぎょう・えんきょう・えんけい", :ns_dyna=>nil},
    {:start=>1311, :name_kanji=>"応長", :name_kana=>"おうちょう", :ns_dyna=>nil},
    {:start=>1312, :name_kanji=>"正和", :name_kana=>"しょうわ", :ns_dyna=>nil},
    {:start=>1317, :name_kanji=>"文保", :name_kana=>"ぶんぽう・ぶんぽ・ぶんほう", :ns_dyna=>nil},
    {:start=>1319, :name_kanji=>"元応", :name_kana=>"げんおう", :ns_dyna=>nil},
    {:start=>1321, :name_kanji=>"元亨", :name_kana=>"げんこう", :ns_dyna=>nil},
    {:start=>1324, :name_kanji=>"正中", :name_kana=>"しょうちゅう", :ns_dyna=>nil},
    {:start=>1326, :name_kanji=>"嘉暦", :name_kana=>"かりゃく", :ns_dyna=>nil},
    {:start=>1329, :name_kanji=>"元徳", :name_kana=>"げんとく", :ns_dyna=>nil},
    {:start=>1331, :name_kanji=>"元弘", :name_kana=>"げんこう", :ns_dyna=>nil},
    {:start=>1332, :name_kanji=>"正慶", :name_kana=>"しょうけい・しょうきょう", :ns_dyna=>nil},
    {:start=>1334, :name_kanji=>"建武", :name_kana=>"けんむ", :ns_dyna=>"南朝"},
    {:start=>1334, :name_kanji=>"建武", :name_kana=>"けんむ", :ns_dyna=>"北朝"},
    {:start=>1336, :name_kanji=>"延元", :name_kana=>"えんげん", :ns_dyna=>"南朝"},
    {:start=>1338, :name_kanji=>"暦応", :name_kana=>"りゃくおう・れきおう", :ns_dyna=>"北朝"},
    {:start=>1340, :name_kanji=>"興国", :name_kana=>"こうこく", :ns_dyna=>"南朝"},
    {:start=>1342, :name_kanji=>"康永", :name_kana=>"こうえい", :ns_dyna=>"北朝"},
    {:start=>1345, :name_kanji=>"貞和", :name_kana=>"じょうわ・ていわ", :ns_dyna=>"北朝"},
    {:start=>1347, :name_kanji=>"正平", :name_kana=>"しょうへい", :ns_dyna=>"南朝"},
    {:start=>1350, :name_kanji=>"観応", :name_kana=>"かんおう・かんのう", :ns_dyna=>"北朝"},
    {:start=>1352, :name_kanji=>"文和", :name_kana=>"ぶんな・ぶんわ", :ns_dyna=>"北朝"},
    {:start=>1356, :name_kanji=>"延文", :name_kana=>"えんぶん", :ns_dyna=>"北朝"},
    {:start=>1361, :name_kanji=>"康安", :name_kana=>"こうあん", :ns_dyna=>"北朝"},
    {:start=>1362, :name_kanji=>"貞治", :name_kana=>"じょうじ・ていじ", :ns_dyna=>"北朝"},
    {:start=>1368, :name_kanji=>"応安", :name_kana=>"おうあん", :ns_dyna=>"北朝"},
    {:start=>1370, :name_kanji=>"建徳", :name_kana=>"けんとく", :ns_dyna=>"南朝"},
    {:start=>1372, :name_kanji=>"文中", :name_kana=>"ぶんちゅう", :ns_dyna=>"南朝"},
    {:start=>1375, :name_kanji=>"天授", :name_kana=>"てんじゅ", :ns_dyna=>"南朝"},
    {:start=>1375, :name_kanji=>"永和", :name_kana=>"えいわ", :ns_dyna=>"北朝"},
    {:start=>1379, :name_kanji=>"康暦", :name_kana=>"こうりゃく", :ns_dyna=>"北朝"},
    {:start=>1381, :name_kanji=>"弘和", :name_kana=>"こうわ", :ns_dyna=>"南朝"},
    {:start=>1381, :name_kanji=>"永徳", :name_kana=>"えいとく", :ns_dyna=>"北朝"},
    {:start=>1384, :name_kanji=>"元中", :name_kana=>"げんちゅう", :ns_dyna=>"南朝"},
    {:start=>1384, :name_kanji=>"至徳", :name_kana=>"しとく", :ns_dyna=>"北朝"},
    {:start=>1387, :name_kanji=>"嘉慶", :name_kana=>"かきょう・かけい", :ns_dyna=>"北朝"},
    {:start=>1389, :name_kanji=>"康応", :name_kana=>"こうおう", :ns_dyna=>"北朝"},
    {:start=>1390, :name_kanji=>"明徳", :name_kana=>"めいとく", :ns_dyna=>"北朝"},
    {:start=>1394, :name_kanji=>"応永", :name_kana=>"おうえい", :ns_dyna=>nil},
    {:start=>1428, :name_kanji=>"正長", :name_kana=>"しょうちょう", :ns_dyna=>nil},
    {:start=>1429, :name_kanji=>"永享", :name_kana=>"えいきょう", :ns_dyna=>nil},
    {:start=>1441, :name_kanji=>"嘉吉", :name_kana=>"かきつ・かきち", :ns_dyna=>nil},
    {:start=>1444, :name_kanji=>"文安", :name_kana=>"ぶんあん", :ns_dyna=>nil},
    {:start=>1449, :name_kanji=>"宝徳", :name_kana=>"ほうとく", :ns_dyna=>nil},
    {:start=>1452, :name_kanji=>"享徳", :name_kana=>"きょうとく", :ns_dyna=>nil},
    {:start=>1455, :name_kanji=>"康正", :name_kana=>"こうしょう", :ns_dyna=>nil},
    {:start=>1457, :name_kanji=>"長禄", :name_kana=>"ちょうろく", :ns_dyna=>nil},
    {:start=>1461, :name_kanji=>"寛正", :name_kana=>"かんしょう", :ns_dyna=>nil},
    {:start=>1466, :name_kanji=>"文正", :name_kana=>"ぶんしょう", :ns_dyna=>nil},
    {:start=>1467, :name_kanji=>"応仁", :name_kana=>"おうにん", :ns_dyna=>nil},
    {:start=>1469, :name_kanji=>"文明", :name_kana=>"ぶんめい", :ns_dyna=>nil},
    {:start=>1487, :name_kanji=>"長享", :name_kana=>"ちょうきょう", :ns_dyna=>nil},
    {:start=>1489, :name_kanji=>"延徳", :name_kana=>"えんとく", :ns_dyna=>nil},
    {:start=>1492, :name_kanji=>"明応", :name_kana=>"めいおう", :ns_dyna=>nil},
    {:start=>1501, :name_kanji=>"文亀", :name_kana=>"ぶんき", :ns_dyna=>nil},
    {:start=>1504, :name_kanji=>"永正", :name_kana=>"えいしょう", :ns_dyna=>nil},
    {:start=>1521, :name_kanji=>"大永", :name_kana=>"たいえい・だいえい", :ns_dyna=>nil},
    {:start=>1528, :name_kanji=>"享禄", :name_kana=>"きょうろく", :ns_dyna=>nil},
    {:start=>1532, :name_kanji=>"天文", :name_kana=>"てんぶん・てんもん", :ns_dyna=>nil},
    {:start=>1555, :name_kanji=>"弘治", :name_kana=>"こうじ", :ns_dyna=>nil},
    {:start=>1558, :name_kanji=>"永禄", :name_kana=>"えいろく", :ns_dyna=>nil},
    {:start=>1570, :name_kanji=>"元亀", :name_kana=>"げんき", :ns_dyna=>nil},
    {:start=>1573, :name_kanji=>"天正", :name_kana=>"てんしょう", :ns_dyna=>nil},
    {:start=>1593, :name_kanji=>"文禄", :name_kana=>"ぶんろく", :ns_dyna=>nil},
    {:start=>1596, :name_kanji=>"慶長", :name_kana=>"けいちょう・きょうちょう", :ns_dyna=>nil},
    {:start=>1615, :name_kanji=>"元和", :name_kana=>"げんな", :ns_dyna=>nil},
    {:start=>1624, :name_kanji=>"寛永", :name_kana=>"かんえい", :ns_dyna=>nil},
    {:start=>1645, :name_kanji=>"正保", :name_kana=>"しょうほう・しょうほ", :ns_dyna=>nil},
    {:start=>1648, :name_kanji=>"慶安", :name_kana=>"けいあん・きょうあん", :ns_dyna=>nil},
    {:start=>1652, :name_kanji=>"承応", :name_kana=>"じょうおう", :ns_dyna=>nil},
    {:start=>1655, :name_kanji=>"明暦", :name_kana=>"めいれき・めいりゃく", :ns_dyna=>nil},
    {:start=>1658, :name_kanji=>"万治", :name_kana=>"まんじ", :ns_dyna=>nil},
    {:start=>1661, :name_kanji=>"寛文", :name_kana=>"かんぶん", :ns_dyna=>nil},
    {:start=>1673, :name_kanji=>"延宝", :name_kana=>"えんぽう・えんほう", :ns_dyna=>nil},
    {:start=>1681, :name_kanji=>"天和", :name_kana=>"てんな・てんわ", :ns_dyna=>nil},
    {:start=>1684, :name_kanji=>"貞享", :name_kana=>"じょうきょう", :ns_dyna=>nil},
    {:start=>1688, :name_kanji=>"元禄", :name_kana=>"げんろく", :ns_dyna=>nil},
    {:start=>1704, :name_kanji=>"宝永", :name_kana=>"ほうえい", :ns_dyna=>nil},
    {:start=>1711, :name_kanji=>"正徳", :name_kana=>"しょうとく", :ns_dyna=>nil},
    {:start=>1716, :name_kanji=>"享保", :name_kana=>"きょうほう・きょうほ", :ns_dyna=>nil},
    {:start=>1736, :name_kanji=>"元文", :name_kana=>"げんぶん", :ns_dyna=>nil},
    {:start=>1741, :name_kanji=>"寛保", :name_kana=>"かんぽう・かんぽ・かんほう", :ns_dyna=>nil},
    {:start=>1744, :name_kanji=>"延享", :name_kana=>"えんきょう", :ns_dyna=>nil},
    {:start=>1748, :name_kanji=>"寛延", :name_kana=>"かんえん", :ns_dyna=>nil},
    {:start=>1751, :name_kanji=>"宝暦", :name_kana=>"ほうれき・ほうりゃく", :ns_dyna=>nil},
    {:start=>1764, :name_kanji=>"明和", :name_kana=>"めいわ", :ns_dyna=>nil},
    {:start=>1772, :name_kanji=>"安永", :name_kana=>"あんえい", :ns_dyna=>nil},
    {:start=>1781, :name_kanji=>"天明", :name_kana=>"てんめい", :ns_dyna=>nil},
    {:start=>1789, :name_kanji=>"寛政", :name_kana=>"かんせい", :ns_dyna=>nil},
    {:start=>1801, :name_kanji=>"享和", :name_kana=>"きょうわ", :ns_dyna=>nil},
    {:start=>1804, :name_kanji=>"文化", :name_kana=>"ぶんか", :ns_dyna=>nil},
    {:start=>1818, :name_kanji=>"文政", :name_kana=>"ぶんせい", :ns_dyna=>nil},
    {:start=>1831, :name_kanji=>"天保", :name_kana=>"てんぽう・てんほう", :ns_dyna=>nil},
    {:start=>1845, :name_kanji=>"弘化", :name_kana=>"こうか", :ns_dyna=>nil},
    {:start=>1848, :name_kanji=>"嘉永", :name_kana=>"かえい", :ns_dyna=>nil},
    {:start=>1855, :name_kanji=>"安政", :name_kana=>"あんせい", :ns_dyna=>nil},
    {:start=>1860, :name_kanji=>"万延", :name_kana=>"まんえん", :ns_dyna=>nil},
    {:start=>1861, :name_kanji=>"文久", :name_kana=>"ぶんきゅう", :ns_dyna=>nil},
    {:start=>1864, :name_kanji=>"元治", :name_kana=>"げんじ", :ns_dyna=>nil},
    {:start=>1865, :name_kanji=>"慶応", :name_kana=>"けいおう", :ns_dyna=>nil},
    {:start=>1868, :name_kanji=>"明治", :name_kana=>"めいじ", :ns_dyna=>nil},
    {:start=>1912, :name_kanji=>"大正", :name_kana=>"たいしょう", :ns_dyna=>nil},
    {:start=>1926, :name_kanji=>"昭和", :name_kana=>"しょうわ", :ns_dyna=>nil},
    {:start=>1989, :name_kanji=>"平成", :name_kana=>"へいせい", :ns_dyna=>nil},
    {:start=>2019, :name_kanji=>"令和", :name_kana=>"れいわ", :ns_dyna=>nil},
  ].freeze

  def self.was_started_before_some_centuries_from(year)
    GENGO_LIST.select do |gengo|
      ((gengo[:start] - year ) % 100) == 0
    end
  end
end

this_year = ARGV[0].to_i
century_gengos =  Gengo.was_started_before_some_centuries_from(this_year)
century_gengos.each do |g|
  passed_year = this_year - g[:start]
  puts "今年(#{this_year}年)は#{g[:name_kanji]}#{passed_year}年です!"
end


