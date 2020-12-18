//
//  Day9Input.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

public let day9SampleInput = """
35
20
15
25
47
40
62
55
65
95
102
117
150
182
127
219
299
277
309
576
"""

public let day9Input = """
4
15
11
10
33
20
42
34
49
45
29
43
26
12
19
17
28
47
46
2
18
39
50
3
23
5
14
7
52
9
60
16
20
61
97
79
8
10
11
22
13
12
15
65
17
19
28
21
18
24
23
33
25
41
34
26
35
29
36
20
27
38
40
39
43
32
80
37
45
58
42
49
53
44
73
46
52
47
55
100
56
57
59
60
64
66
69
88
130
77
127
79
169
86
89
90
103
106
99
98
93
187
102
184
113
163
116
148
181
141
152
146
193
176
156
199
279
200
175
182
209
191
192
195
206
297
215
218
229
265
257
262
287
368
293
302
321
331
371
338
392
367
439
542
863
397
457
387
401
421
433
472
698
486
519
583
788
685
614
595
940
652
669
705
725
754
764
784
1307
798
1035
844
1185
887
854
905
958
1005
1100
1102
1833
1209
1489
1449
1247
1430
2101
1459
1469
2432
1518
1949
2267
1642
2313
1698
1731
1741
1759
1954
2791
1963
2105
2202
3373
3383
4842
2677
5805
2977
3128
3101
2928
2987
3160
3216
3690
3340
3401
8933
12623
5160
10647
3713
7030
5033
5478
5092
5130
5605
5654
6137
5905
5915
6056
6029
6376
9457
6147
6500
6556
6741
7053
7114
11820
8746
8805
10570
8843
10125
11132
10222
10697
11569
15399
11559
11934
11944
12085
12176
12405
12523
12647
12703
13056
13297
17873
14167
17239
20364
26082
19937
18968
19065
23308
25579
20919
22266
23735
24019
25108
24120
24029
24261
24581
24928
25350
25703
37637
37810
37603
31406
35086
36304
38033
40856
38905
39887
39984
49608
47764
55141
46001
47754
48139
48290
86659
48610
48842
49509
50278
66559
60789
66492
67710
69009
69439
114246
74337
85797
84906
78792
188583
87748
93755
93765
94140
94291
95893
124615
134407
97452
98119
98351
135306
229446
145695
135126
134202
185200
138448
168092
153129
218906
163698
166540
189648
181503
181513
281001
187905
338329
301846
395986
195571
195803
196470
232321
233657
319669
269328
273574
304988
272650
291577
302146
316827
486491
330238
363016
348053
369408
391374
413834
383476
560905
427892
392041
392273
428124
562559
428791
465978
502985
541978
542902
546224
849454
593723
1065544
904994
988797
678291
739427
1167319
717461
1277346
783647
806107
775517
819933
820165
970102
1022514
1012202
894769
1644421
1044963
1049209
1084880
1311184
1263685
2275887
1272014
1395752
1456888
1784390
1453808
2466010
1501108
2131349
2356147
1753749
1626040
1745619
2083850
2426990
1864871
2648554
1906971
3861762
2094172
4510840
3017633
2720573
2896860
4221018
3238198
5665188
2849560
3652590
3079848
2954916
4814745
7117878
3618620
3379789
3610490
4513425
4803831
3771842
3959043
5675489
4001143
6095315
6789475
4943732
5570133
5617433
8572349
6515480
6502150
5929408
8575673
5804476
6034764
6334705
6565406
10848130
6990279
6998409
7151631
7382332
7730885
7772985
9867157
7960186
8944875
9571276
10513865
12794755
10561165
11187566
11546841
11733884
11839240
11964172
16348658
12139181
13025043
13947738
12900111
14763264
21099369
14721164
14924616
14533963
15113217
15503870
20758842
16905061
20754941
18516151
20085141
21075030
23803412
21748731
22734407
24758927
23873065
23978421
35759450
25039292
25164224
25925154
29297227
27663375
30037833
31626225
29647180
29458579
31439024
55572334
46363640
35421212
36990202
47773699
41160171
59335060
42823761
48631992
44483138
46607472
59289600
47851486
70342061
54622803
89431233
85030913
53588529
56960602
57121954
96325262
60897603
59105759
64879791
66860236
87767643
72411414
78244973
89011657
112923589
91455753
87306899
90675247
94458958
91090610
105713231
137282719
108211332
110549131
110710483
112694288
114082556
114486132
116066361
116227713
149781006
120003362
123985550
131740027
139271650
150656387
159718313
165551872
176318556
177982146
178397509
181765857
202670290
185549568
224631687
269022746
269784368
218760463
287029039
445341302
226776844
228568688
243988912
232294074
236231075
251743389
255725577
426300689
304823522
315590206
531017951
367315425
341870428
403029196
388219858
506015443
400526320
404310031
474486040
547884280
464799763
875012360
454991538
614996702
455345532
459070918
460862762
507468966
701030838
487974464
556566911
709185853
646693950
876194322
1042901266
730090286
742396748
863891958
804836351
859301569
859597238
859655563
911778997
1734609598
1320460000
910337070
914062456
914416450
916208294
919933680
947045382
1265752764
995443430
1044541375
1134668414
1203260861
1355879803
1376784236
1618591070
1962834946
1472487034
1547233099
1664137920
1664433589
1718898807
2332084272
1769992633
1822116067
1861107838
1824399526
2337929275
1828478906
1830624744
1836141974
2922159668
2081713796
2179209789
1721308972
2247802236
2490548217
2924569833
2974470873
2849271270
3019720133
3136624954
3492912495
3211371019
3328571509
3383332396
4857933926
3491301605
3543425039
3551933716
3545708498
4015351763
4329516032
3549787878
5412707885
5003873464
5896630541
6686412832
3900518761
4741029105
5097073506
5339819487
5899040706
5985896224
5868991403
9531604722
6347995973
6594703415
6539942528
6711903905
6874634001
7034726644
7037010103
9450974422
7095496376
11052361866
16325608423
7450306639
8290816983
8641547866
14162210544
10495222176
10248514734
8997592267
14094665773
13576952631
11208810890
15327827086
11854887627
12216987376
13443492349
12887938501
14130223020
13251846433
13586537906
13909360645
16447898906
16546470798
16932364849
19667294015
25793940007
15741123622
16091854505
17288409250
17639140133
19246107001
19492814443
20206403157
25106734060
23063698517
25339033910
30676693818
24071875003
24742826128
36599658864
26139784934
26474476407
27716760926
32189022528
55419519946
29650484267
36115192921
32673488471
40352107767
55444424274
31832978127
36534516251
51681836971
37494812407
36885247134
38738921444
49178609063
46346188091
47135573520
47806524645
58663498935
88313983202
63481747572
50882611062
52614261341
62589669328
54191237333
86864725804
111288272217
70571899571
62323972738
64506466598
84691771779
86063856197
98028025062
84020820654
85085109535
110852654689
146344793392
101391713732
85874494964
93481761611
125805720310
94942098165
98689135707
103496872403
105073848395
106805498674
201747596839
165898180330
200287260285
126830439336
132895872309
135078366169
149198238377
147015744517
231036565171
170959604499
169105930189
182048845716
178566871146
183774245242
180816593129
179356256575
276028677713
184563630671
188423859776
193631233872
198438970568
211879347069
210302371077
231904287731
282094110686
354322040106
292728619666
304184296358
261908805505
319641996840
315894959298
445683050747
326372001092
340065534688
347672801335
348462186764
360615716862
357923127721
360172849704
507188594221
727777161433
612370616506
372987490447
382055093648
392070204440
673818087019
422181718146
442206658808
674110946539
586278407044
902173366342
601974340193
707965163738
707591856252
635536956138
642266960390
749993332161
666437535780
687738336023
696134988099
706385314485
1034552334652
800129786529
733160340151
1276085286732
755042584095
774125298088
1188252747237
804236811794
814251922586
1118316706245
1221815363182
1028485065852
1228545367434
1237511296331
1301974491918
1244241300583
1614381709115
1277803916528
1308704496170
1330005296413
1394123650508
1354175871803
1383873324122
1402520302584
1439545654636
1488202924246
2337189562022
2198360462302
2063747080265
1529167882183
2472492578048
1618488734380
1832721877646
2574246596996
2146801772097
2692577820292
2257030433286
2466056663765
2552945796753
3727528344485
2724128946921
2756696174387
2927193230550
3141426373816
4257198526963
2748299522311
4031082339948
2872076248368
2842065957220
2927748578882
3017370806429
3147656616563
3361889759829
3451210612026
3675969654280
7398624900779
7274569333392
4298778541411
4403832205383
4612858435862
5398456807102
4723087097051
5190185610686
5277074743674
9335945532913
5590365479531
5889725896127
5714142205588
5620375770679
5676048101193
5765670328740
6379260566258
5769814536102
5859436763649
9974826642604
6165027422992
6823626270843
10849835512805
8866155264966
8079801859663
10293558101510
8702610746794
10382672971964
15969606202703
10437229302639
14143230008640
11334517976267
10866233711879
10867440223205
18373359961173
11210741250210
11296423871872
16057605073318
11386046099419
11441718429933
11535484864842
19733595488171
11934841959094
15031182687958
16798452913447
14867638169786
14903428130506
21303463014518
17568766011760
18947242082868
22827764529352
19085283718758
20819902274603
21733653174511
22507165122082
21733673935084
22078181473415
22252279811298
23376560389027
22596787349629
22652459680143
22682469971291
33626371085078
22921530964261
31175313918104
32472194142266
28733294872541
31701881043953
29771066300292
31666091083233
32436404181546
33850670213374
40165553361389
45279257320920
50649123126821
39905185993361
40818936893269
42553555449114
44240818296593
43811855408499
43985953746382
44330461284713
44934749782589
62877194962057
73301582806964
56503129893517
55154664113557
51654825836802
73755856206735
58504361172833
62243260442558
"""
