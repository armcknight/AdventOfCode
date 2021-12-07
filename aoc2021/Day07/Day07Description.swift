//
//  Day07Description.swift
//  aoc2021
//
//  Created by Andrew McKnight on Dec 5, 2021.
//

/**
 --- Day 7: The Treachery of Whales ---

 A giant whale has decided your submarine is its next meal, and it's much faster than you are. There's nowhere to run!

 Suddenly, a swarm of crabs (each in its own tiny submarine - it's too deep for them otherwise) zooms in to rescue you! They seem to be preparing to blast a hole in the ocean floor; sensors indicate a massive underground cave system just beyond where they're aiming!

 The crab submarines all need to be aligned before they'll have enough power to blast a large enough hole for your submarine to get through. However, it doesn't look like they'll be aligned before the whale catches you! Maybe you can help?

 There's one major catch - crab submarines can only move horizontally.

 You quickly make a list of the horizontal position of each crab (your puzzle input). Crab submarines have limited fuel, so you need to find a way to make all of their horizontal positions match while requiring them to spend as little fuel as possible.

 For example, consider the following horizontal positions:

 16,1,2,0,4,2,7,1,2,14
 This means there's a crab with horizontal position 16, a crab with horizontal position 1, and so on.

 Each change of 1 step in horizontal position of a single crab costs 1 fuel. You could choose any horizontal position to align them all on, but the one that costs the least fuel is horizontal position 2:

 Move from 16 to 2: 14 fuel
 Move from 1 to 2: 1 fuel
 Move from 2 to 2: 0 fuel
 Move from 0 to 2: 2 fuel
 Move from 4 to 2: 2 fuel
 Move from 2 to 2: 0 fuel
 Move from 7 to 2: 5 fuel
 Move from 1 to 2: 1 fuel
 Move from 2 to 2: 0 fuel
 Move from 14 to 2: 12 fuel
 This costs a total of 37 fuel. This is the cheapest possible outcome; more expensive outcomes include aligning at position 1 (41 fuel), position 3 (39 fuel), or position 10 (71 fuel).

 Determine the horizontal position that the crabs can align to using the least fuel possible. How much fuel must they spend to align to that position?

 --- Part Two ---

 The crabs don't seem interested in your proposed solution. Perhaps you misunderstand crab engineering?

 As it turns out, crab submarine engines don't burn fuel at a constant rate. Instead, each change of 1 step in horizontal position costs 1 more unit of fuel than the last: the first step costs 1, the second step costs 2, the third step costs 3, and so on.

 As each crab moves, moving further becomes more expensive. This changes the best horizontal position to align them all on; in the example above, this becomes 5:

 Move from 16 to 5: 66 fuel
 Move from 1 to 5: 10 fuel
 Move from 2 to 5: 6 fuel
 Move from 0 to 5: 15 fuel
 Move from 4 to 5: 1 fuel
 Move from 2 to 5: 6 fuel
 Move from 7 to 5: 3 fuel
 Move from 1 to 5: 10 fuel
 Move from 2 to 5: 6 fuel
 Move from 14 to 5: 45 fuel
 This costs a total of 168 fuel. This is the new cheapest possible outcome; the old alignment position (2) now costs 206 fuel instead.

 Determine the horizontal position that the crabs can align to using the least fuel possible so they can make you an escape route! How much fuel must they spend to align to that position?
*/
public enum Day07: String {
    case sample = """
16,1,2,0,4,2,7,1,2,14
"""

    case input = """
1101,1,29,67,1102,0,1,65,1008,65,35,66,1005,66,28,1,67,65,20,4,0,1001,65,1,65,1106,0,8,99,35,67,101,99,105,32,110,39,101,115,116,32,112,97,115,32,117,110,101,32,105,110,116,99,111,100,101,32,112,114,111,103,114,97,109,10,424,1266,45,208,326,65,221,2,303,309,514,471,608,104,640,236,187,1074,1043,120,1226,7,364,85,863,476,453,13,416,28,304,1,542,401,1089,646,301,263,979,126,178,1046,169,174,1604,9,99,858,1610,470,1003,336,1009,295,312,291,226,317,398,642,532,55,834,459,69,662,22,241,1235,243,413,42,64,100,415,240,149,301,147,454,26,289,129,157,639,337,683,71,285,141,141,63,824,199,16,1601,418,1102,146,1012,1648,2,1445,113,103,570,421,1241,37,1007,544,40,251,57,388,522,417,211,650,186,88,21,848,1150,16,926,332,76,913,436,804,86,80,7,25,464,334,552,30,566,748,174,28,56,747,1697,551,996,864,57,165,1111,113,405,301,273,1458,1724,186,846,272,553,647,6,210,231,920,581,105,846,1158,258,617,231,157,99,240,577,726,5,357,1226,1175,74,926,310,269,199,447,8,180,1010,933,980,5,190,188,96,3,641,124,140,625,901,136,75,225,461,1219,465,166,18,533,393,528,252,841,466,308,235,530,417,155,812,61,712,484,315,443,352,397,619,297,767,1691,377,1197,1738,356,696,450,162,809,42,17,490,265,13,30,650,212,220,1520,231,949,1158,270,568,1038,687,8,15,476,958,565,543,1440,1700,1439,36,69,64,1347,885,78,78,972,184,36,106,106,984,324,968,264,131,655,508,110,1279,1690,105,608,1100,309,708,250,194,163,383,302,64,145,448,465,691,73,489,44,783,443,241,182,519,45,129,556,47,168,646,454,601,990,655,856,445,454,140,314,71,566,595,16,1504,100,306,556,960,42,638,594,761,164,1001,180,1135,124,157,433,326,1078,1234,403,920,559,65,151,307,1348,557,283,233,1196,100,145,84,494,1094,248,964,34,178,294,76,236,294,907,123,135,43,739,67,2,1040,511,470,565,1638,121,46,912,186,1281,1017,891,679,1128,207,347,194,1035,38,195,1080,74,157,1522,471,469,238,1207,965,72,865,687,254,769,876,222,453,29,250,188,182,897,799,213,305,509,109,463,625,11,36,1227,139,709,548,332,1376,334,538,496,112,1081,9,676,309,178,686,64,122,713,1126,864,1613,1913,443,829,258,205,678,255,617,685,347,229,1251,708,654,179,514,256,63,48,872,442,83,797,259,289,865,104,475,503,535,1210,290,55,451,208,460,128,257,306,369,966,1462,206,215,1645,333,16,1122,216,655,818,488,363,951,26,1040,103,351,253,317,942,989,1161,538,995,544,783,56,281,1711,199,71,100,66,1289,218,1854,658,34,630,111,232,763,530,1692,422,1599,288,661,575,286,15,31,801,1776,1068,871,659,269,559,39,1633,488,107,638,40,299,383,989,483,569,61,157,1204,1028,114,140,1560,54,121,77,611,260,695,1370,9,356,469,1126,203,27,79,309,246,467,1199,67,302,28,584,551,1273,373,61,1008,9,590,71,77,2,74,515,796,156,350,860,0,146,1091,97,550,135,119,1636,27,349,1327,182,1466,172,685,481,421,258,210,139,690,424,540,198,1010,687,87,22,85,499,127,74,155,631,1771,145,1025,362,776,137,422,579,100,1919,865,257,7,272,42,489,11,739,800,246,47,23,17,1320,1717,180,879,47,335,97,236,1376,23,1574,97,489,656,459,1215,116,299,312,18,502,11,82,0,309,7,616,56,303,386,1864,387,9,128,324,523,1055,92,1321,747,411,108,168,614,960,1418,1687,493,118,83,9,112,475,392,7,549,377,224,257,473,281,1065,156,578,179,1276,130,62,50,407,226,1096,1060,795,234,677,1127,672,520,501,474,825,118,320,1329,107,260,39,114,390,319,304,49,528,634,77,336,137,289,56,778,262,1440,91,33,83,199,13,1153,54,157,620,183,303,702,474,269,31,391,294,1388,15,104,461,251,132,1145,337,197,95,37,563,87,19,740,58,201,168,175,169,40,46,230,21,58,616,325,566,87,53,909,905,309,302,425,448,1615,641,1327,10,463,293,323,2,189,91,1236,410,808,1182,288,150,544,304,33,26,1214,335,430,1,751,79,145,1397,1727,38,741,977,229,74,273,578,53,233,272,3,98,885,735,678,130,518,298,337,228,270,32,800,51,1901,919,1689,113,556,355,710,6,1221,219,1731,318,1216,164,76,88,149,230,5,1000,1112,49,486,1139,21,850,597,71,1619,655,71,1309,1300,1904,189,344,434,53,1229,1176,17,165,613,66,71,866,208,225,112,1202,558,2,731,665,245,519,250
"""
}
