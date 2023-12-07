//
//  Day07Description.swift
//  aoc2023
//
//  Created by Andrew McKnight on Dec 6, 2023.
//

/**
## --- Day 7: Camel Cards ---

Your all-expenses-paid trip turns out to be a one-way, five-minute ride
in an <a href="https://en.wikipedia.org/wiki/Airship"
target="_blank">airship</a>. (At least it's a
<span title="Please only read this sentence while listening to 'The Airship Blackjack' from the Final Fantasy 6 soundtrack.">*cool*
airship</span>!) It drops you off at the edge of a vast desert and
descends back to Island Island.

"Did you bring the parts?"

You turn around to see an Elf completely covered in white clothing,
wearing goggles, and riding a large
<a href="https://en.wikipedia.org/wiki/Dromedary"
target="_blank">camel</a>.

"Did you bring the parts?" she asks again, louder this time. You aren't
sure what parts she's looking for; you're here to figure out why the
sand stopped.

"The parts! For the sand, yes! Come with me; I will show you." She
beckons you onto the camel.

After riding a bit across the sands of Desert Island, you can see what
look like very large rocks covering half of the horizon. The Elf
explains that the rocks are all along the part of Desert Island that is
directly above Island Island, making it hard to even get there.
Normally, they use big machines to move the rocks and filter the sand,
but the machines have broken down because Desert Island recently stopped
receiving the *parts* they need to fix the machines.

You've already assumed it'll be your job to figure out why the parts
stopped when she asks if you can help. You agree automatically.

Because the journey will take a few days, she offers to teach you the
game of *Camel Cards*. Camel Cards is sort of similar to
<a href="https://en.wikipedia.org/wiki/List_of_poker_hands"
target="_blank">poker</a> except it's designed to be easier to play
while riding a camel.

In Camel Cards, you get a list of *hands*, and your goal is to order
them based on the *strength* of each hand. A hand consists of *five
cards* labeled one of `A`, `K`, `Q`, `J`, `T`, `9`, `8`, `7`, `6`, `5`,
`4`, `3`, or `2`. The relative strength of each card follows this order,
where `A` is the highest and `2` is the lowest.

Every hand is exactly one *type*. From strongest to weakest, they are:

-   *Five of a kind*, where all five cards have the same label: `AAAAA`
-   *Four of a kind*, where four cards have the same label and one card
has a different label: `AA8AA`
-   *Full house*, where three cards have the same label, and the
remaining two cards share a different label: `23332`
-   *Three of a kind*, where three cards have the same label, and the
remaining two cards are each different from any other card in the
hand: `TTT98`
-   *Two pair*, where two cards share one label, two other cards share a
second label, and the remaining card has a third label: `23432`
-   *One pair*, where two cards share one label, and the other three
cards have a different label from the pair and each other: `A23A4`
-   *High card*, where all cards' labels are distinct: `23456`

Hands are primarily ordered based on type; for example, every *full
house* is stronger than any *three of a kind*.

If two hands have the same type, a second ordering rule takes effect.
Start by comparing the *first card in each hand*. If these cards are
different, the hand with the stronger first card is considered stronger.
If the first card in each hand have the *same label*, however, then move
on to considering the *second card in each hand*. If they differ, the
hand with the higher second card wins; otherwise, continue with the
third card in each hand, then the fourth, then the fifth.

So, `33332` and `2AAAA` are both *four of a kind* hands, but `33332` is
stronger because its first card is stronger. Similarly, `77888` and
`77788` are both a *full house*, but `77888` is stronger because its
third card is stronger (and both hands have the same first and second
card).

To play Camel Cards, you are given a list of hands and their
corresponding *bid* (your puzzle input). For example:

32T3K 765
T55J5 684
KK677 28
KTJJT 220
QQQJA 483

This example shows five hands; each hand is followed by its *bid*
amount. Each hand wins an amount equal to its bid multiplied by its
*rank*, where the weakest hand gets rank 1, the second-weakest hand gets
rank 2, and so on up to the strongest hand. Because there are five hands
in this example, the strongest hand will have rank 5 and its bid will be
multiplied by 5.

So, the first step is to put the hands in order of strength:

-   `32T3K` is the only *one pair* and the other hands are all a
stronger type, so it gets rank *1*.
-   `KK677` and `KTJJT` are both *two pair*. Their first cards both have
the same label, but the second card of `KK677` is stronger (`K` vs
`T`), so `KTJJT` gets rank *2* and `KK677` gets rank *3*.
-   `T55J5` and `QQQJA` are both *three of a kind*. `QQQJA` has a
stronger first card, so it gets rank *5* and `T55J5` gets rank *4*.

Now, you can determine the total winnings of this set of hands by adding
up the result of multiplying each hand's bid with its rank (`765` \* 1 +
`220` \* 2 + `28` \* 3 + `684` \* 4 + `483` \* 5). So the *total
winnings* in this example are *`6440`*.

Find the rank of every hand in your set. *What are the total winnings?*
 
 --- Part Two ---

 To make things a little more interesting, the Elf introduces one additional rule. Now, J cards are jokers - wildcards that can act like whatever card would make the hand the strongest type possible.

 To balance this, J cards are now the weakest individual cards, weaker even than 2. The other cards stay in the same order: A, K, Q, T, 9, 8, 7, 6, 5, 4, 3, 2, J.

 J cards can pretend to be whatever card is best for the purpose of determining hand type; for example, QJJQ2 is now considered four of a kind. However, for the purpose of breaking ties between two hands of the same type, J is always treated as J, not the card it's pretending to be: JKKK2 is weaker than QQQQ2 because J is weaker than Q.

 Now, the above example goes very differently:

 32T3K 765
 T55J5 684
 KK677 28
 KTJJT 220
 QQQJA 483
 32T3K is still the only one pair; it doesn't contain any jokers, so its strength doesn't increase.
 KK677 is now the only two pair, making it the second-weakest hand.
 T55J5, KTJJT, and QQQJA are now all four of a kind! T55J5 gets rank 3, QQQJA gets rank 4, and KTJJT gets rank 5.
 With the new joker rule, the total winnings in this example are 5905.

 Using the new joker rule, find the rank of every hand in your set. What are the new total winnings?


*/
public enum Day07: String {
case sample = #"""
32T3K 765
T55J5 684
KK677 28
KTJJT 220
QQQJA 483
"""#

case input = #"""
A833A 309
Q33J3 205
55KK5 590
K4457 924
Q3QT3 11
QJK32 349
96659 162
955A9 851
33888 311
57JJ7 721
67A7A 978
T44T4 557
46446 802
72757 471
23J5J 148
44944 660
T89JJ 938
55J55 141
58858 555
2Q22J 542
4734Q 454
22522 249
Q2486 814
KK3KK 577
6J6KA 250
9A4JJ 168
72AQ7 308
TJ486 320
97397 121
48334 748
2J5J2 964
4836J 588
Q6565 943
JAJAJ 562
KK3KA 620
99229 395
T9T99 684
22838 638
7QQQ3 149
6K58A 783
Q3T45 675
7TQ78 214
A2AA5 549
98944 375
Q3QAA 999
A8JAT 456
TT9T9 196
42T92 732
K7JKK 262
Q5QT5 169
K22K2 318
72777 519
33Q3Q 641
Q355Q 69
6T5JK 419
Q5Q3Q 264
44229 848
87778 695
223K8 181
QQQ8Q 711
2QQQ8 548
637AT 109
77AAA 969
4AAQ4 532
Q4K4K 826
Q2TA7 513
9J55K 772
J4AA7 996
4J252 954
99669 336
99T89 176
A99J9 771
588A5 483
Q3A3Q 373
22344 201
J6K8Q 329
445T4 865
T25K6 106
JQ8Q3 78
88482 877
JQKQJ 976
922TA 495
38666 867
65T69 370
JT4QA 409
39T33 744
7QQ77 177
KJ785 668
36J58 935
5376K 671
62222 188
63333 231
TKK82 658
88877 322
3JJ7J 984
93333 408
J39T6 669
5QQ88 956
K8A4Q 659
44J77 38
QQ969 93
T28AK 706
KTKTK 810
Q5QQQ 585
86688 623
JJQ23 651
J2227 863
5TT99 337
458KK 350
8534K 693
864A8 405
77Q38 269
28682 332
2Q28K 361
4J86Q 540
T3K95 614
QQ2QQ 844
5KAJJ 707
TT7TT 110
86JK6 431
KA89J 754
23A62 266
J2QK6 433
444A6 813
TKQQQ 716
KKTT7 758
46J74 380
K4A4A 958
37777 159
2T43Q 45
K8888 7
32237 164
552Q4 246
343K8 624
KKTTT 832
A8ATT 514
KKTKK 166
KTKAJ 220
7J927 904
899QQ 531
682AJ 765
TJKKJ 579
87524 98
AAT9T 809
KJQKK 57
T3K48 288
86T68 77
8J798 191
5J866 132
4K44K 424
AJQQQ 533
JA884 411
T6668 445
77646 155
Q23A3 27
K642A 16
T3JT4 494
67AJ4 281
88388 782
Q7394 517
23K47 759
88A8A 629
98386 791
2Q644 232
JK833 600
4K43A 455
Q664J 17
7777A 135
QKTT3 718
54TJ4 479
7Q5JJ 209
A2AQA 267
QQ4Q4 857
T658J 414
72727 538
K2458 22
93599 703
322T2 340
42222 722
A84A8 610
9TJTA 738
AK484 953
KKJK2 64
395KQ 1
T5J55 49
249K8 612
35353 618
65268 225
K8884 34
94T44 805
66226 543
5KK7K 116
599J9 998
6K96J 418
6T26Q 795
99833 881
TAT66 251
9J46Q 786
4736K 59
67Q25 374
65K5K 734
5456J 87
7QJ3T 319
7JQ9J 62
A4JA6 460
7KQ8T 888
QA3JT 974
T88J7 480
K9Q34 292
JJ32A 222
TAJ7K 68
564KJ 158
66996 13
J444T 401
33TQ5 934
8778A 280
K956A 223
96TJ6 130
27267 644
J39Q5 544
A5ATT 670
44994 567
555TT 968
2T522 563
666J9 298
574T8 811
2K24Q 301
T2Q2Q 153
8988K 696
62622 784
444K4 962
AJA42 980
A2A72 951
K8K8K 61
J55AJ 363
9T78J 355
86A74 723
TT478 138
4AQ9T 522
TTQJT 515
63J2A 647
JA5Q5 986
9J969 529
Q5AA9 428
2K6Q8 793
5Q6JQ 330
Q89AA 105
2J233 430
7A75A 192
89595 334
4Q4Q4 126
34744 931
6966A 699
44QTT 73
J9568 735
24484 278
55955 422
Q5K22 20
445K3 945
K8228 449
36AKT 616
63Q63 909
3J822 134
333J9 871
86999 545
Q5553 564
JA3T5 781
KKK55 665
69353 581
9A425 952
2Q83T 963
K989K 345
T4444 595
TAK5A 827
A5AK5 539
99KTT 736
QQ3K7 742
5Q8JQ 833
57AQ4 880
352Q4 640
655A3 536
4QJ24 331
QTQQT 930
8A8T7 14
AA538 252
AK72Q 42
88QQQ 866
KJ95J 849
28282 31
77979 524
697A4 438
2JJ22 932
68365 76
94J34 929
4A44A 685
A63Q7 287
9J99J 303
AKKKK 70
5T5TT 979
T77T7 55
A9AA9 676
T8888 608
T5TJJ 944
TTT4J 389
QJ63Q 895
T5KQ8 745
584K4 896
26223 677
TT97T 32
4K942 652
TJ888 525
22T2T 97
AT382 749
J898Q 26
A28AA 137
99525 779
2AAAA 19
A3QQQ 885
687J8 637
Q44QT 102
KTTQT 949
K6AKA 712
A233T 633
QAQQQ 556
KA2J2 534
88884 385
6376J 576
922QQ 324
K653J 728
JJ56J 948
78777 719
7KAQ5 724
6T6AK 589
3452K 452
77Q69 740
55585 936
KKKAA 473
54554 440
2QKQ2 108
J6655 399
8A244 828
KAK3A 273
TQ623 427
9536K 630
8585Q 916
5KK68 234
8986Q 905
K2229 285
A7JQ9 925
83T38 987
K478Q 917
KQ436 263
T4T4T 507
496TJ 571
6644K 485
Q9AAQ 617
737T7 458
4KK76 358
4QAT3 655
44Q34 957
T346T 920
44442 566
T7742 967
78888 290
A6K32 926
8778Q 244
QT888 501
2TJ2A 92
79554 767
4T8J3 907
52665 798
58888 875
66668 919
T25TT 461
A6A6A 125
6QKA6 635
8949J 462
83335 690
T3A89 625
333AA 167
QKKKK 747
6JK22 889
Q77AA 995
2999K 484
27TQ8 5
KKQK5 599
6T666 9
J4667 829
677A7 35
AA48A 56
QAJT9 606
A8A8A 342
53755 982
T6T6J 465
94998 33
Q3379 113
68J68 151
J49AA 709
22922 755
6666A 476
J259T 927
7TJTT 207
JQKQQ 299
7696K 882
26578 10
TJTTJ 609
47J56 258
888J8 101
JKK73 855
9Q58A 366
K7KKK 906
595J3 180
47886 580
96333 915
TQT25 85
JKJJ7 636
2J822 663
39427 694
JAA7A 528
72899 193
54KK5 621
Q66TQ 37
64766 837
J29TJ 147
59628 777
7T772 657
7Q773 673
5JKK9 816
T8A2T 65
999KK 413
23333 475
969J2 787
6QK6Q 284
QJ927 154
J89J8 451
K94QJ 505
J6666 239
22K2A 426
464Q6 268
63582 511
65568 238
82827 139
79236 830
77757 415
2K272 717
QQ277 739
8355T 378
J77JJ 30
39399 928
9AT9T 392
3A878 762
Q255Q 259
393J9 74
T9346 356
2A7A5 807
7856A 186
53J2Q 25
66968 757
9K97K 605
28K55 270
29922 412
67324 643
9J994 883
37329 295
TA3J3 601
66626 900
TKQJ7 678
49898 746
8QQQ3 508
64466 942
74774 79
73A63 994
22228 492
AA5AA 565
95395 891
35K38 763
36566 774
K44K9 18
Q5624 41
QTQ6Q 204
885KK 115
83A64 653
25522 770
74T48 248
649KQ 702
6J9A6 661
Q846Q 441
33636 310
AQ746 371
QQ22Q 91
33799 71
Q2922 773
7377J 856
22779 913
66TT7 634
Q3343 99
39866 434
5A555 439
3AJA3 687
K56AA 323
366J6 1000
Q635A 561
QJTQJ 446
2TTTT 265
A2637 503
8AT6K 382
3A2AA 170
97999 604
A444J 950
7KK55 582
6743A 376
55JK5 150
J77J2 686
9484J 212
QQJQJ 131
KQKQK 845
84A84 946
8KT98 868
T5575 541
7777J 404
29Q92 788
KAAAA 731
222K2 3
6KT75 474
53462 46
88T8T 679
T378Q 156
JQK2Q 546
QQJ88 257
A65KT 410
4J7A3 884
J4455 850
7JA73 221
22AA9 959
7929T 317
TJTT8 58
J3892 550
Q3648 36
598K2 277
J9999 400
55779 302
A9Q92 697
3TT6Q 107
65556 835
2QJAK 124
TQ2TQ 960
384T4 294
2Q2JK 874
5T78K 129
J6T66 364
AAJQQ 666
66QJQ 547
A33KQ 119
2K72A 468
98889 834
92399 381
6TTT6 642
99959 146
AAAA3 145
89979 842
955QQ 206
3434K 216
9J9TT 729
T7Q85 862
69963 86
Q2626 554
KKJKT 339
55T56 235
7877J 469
A2A26 315
2693A 800
3694A 523
T9299 914
AAJ55 2
AAKK9 481
97J8Q 593
74444 683
AATTT 603
423Q2 769
4T777 592
J7Q77 260
KK393 190
KKT72 890
J5353 836
6QAQQ 794
A295J 700
33TTT 353
J4444 444
J3353 178
Q9685 80
3339K 490
77JAT 215
3857Q 520
76K4T 360
59A55 103
J3A63 819
4Q43Q 48
5KJK5 226
9A5J5 843
T29Q8 753
T3343 918
A2797 383
3J786 521
K4J99 63
55545 143
J9TK2 737
67777 437
AAJ68 379
9AJAA 88
4J557 975
JQ64J 806
KTK6T 760
6KK66 362
76Q39 698
QQ668 841
332A6 423
8J88Q 498
Q2QT5 24
883J8 940
A3QJ9 688
J2442 575
82885 820
48543 743
5J5J5 785
9JQ7Q 403
A9Q47 352
9T2JT 489
T232T 53
TQQTT 518
333J3 672
TTQ77 256
32Q3J 300
TQA6T 293
854J9 348
KKK6T 682
KT97K 708
7777K 254
26269 902
JT757 596
KK8KK 572
99969 163
23277 733
8A3QK 812
79947 869
34433 39
A333J 463
82J28 710
29A49 486
T82J9 291
6J86J 472
Q6QQQ 133
57A73 861
657T9 797
9363K 988
33334 351
8JAAA 626
T96TT 725
8J9K8 459
AQT54 972
3465T 377
QT3QT 622
69JQ6 328
Q8888 274
K9999 112
63954 496
KJTK7 648
37A85 142
264A7 341
94469 859
2TT77 464
237AQ 157
K2T54 229
K3K92 457
44433 922
9799J 705
6QQ62 656
KKK22 432
8473A 627
AK76K 255
7A882 111
A5T5K 6
QQ64Q 40
75577 488
5588J 632
44T29 892
3A39A 587
T2666 530
J766K 887
92629 893
9A624 611
728JQ 236
JK8K8 527
787K2 436
Q3592 649
QQQJQ 831
36663 815
2AQ2A 628
TQ94K 991
75275 304
63833 470
AA22A 955
K63K6 397
TTT75 443
4KK4J 96
KJ3K3 977
3232T 912
899J8 467
93366 326
7692Q 516
J6JJ6 247
4Q835 50
44JQ4 72
88Q74 854
89998 321
39233 242
2Q222 104
436AJ 639
JJ8JJ 359
9739A 689
AQAAA 824
4J44J 245
JAJAA 407
7JQQ6 664
K33K3 387
JTTTT 305
QQ33Q 778
AA88Q 338
J2222 187
QQQ72 165
25T52 450
5JJKQ 390
8K9J6 160
J868K 804
K3T75 368
T666T 52
A7A72 714
T743K 417
9636K 560
Q2QJ2 796
44K4J 357
AAKJK 597
AATTA 28
24244 992
4J686 421
TTTK3 90
3KQJ3 482
98QTA 184
QJ7Q2 789
67228 453
Q7555 899
A284J 713
75555 613
29TA7 347
997J7 727
88578 840
TT4J4 198
98628 619
4TT2Q 646
KJ582 551
827T9 583
25J22 233
2Q729 591
8J6JT 21
8T468 203
44888 898
Q6666 372
75K7J 393
7A727 821
5KT69 447
A4ATA 971
QT4QT 586
333K8 199
AQA33 44
8Q8QK 878
5AA55 312
QAKAA 228
72543 487
7T775 680
4AA4A 578
33KAK 645
47377 200
5K4Q9 43
J4324 175
56TKK 343
958AK 230
2A2A2 171
6ATTA 279
22884 316
6KKKJ 60
QAK45 365
KT89A 271
723A3 509
3558J 908
J77J9 448
JQQQT 965
8Q8Q8 243
54J55 500
K5445 261
2QJ39 15
3T7Q4 240
55565 283
AA33A 195
TK6Q9 801
A4A8K 83
6T36J 983
Q4JQK 123
868KK 325
7T426 127
333JJ 997
K333Q 681
42AJJ 873
A88J9 552
9Q969 202
Q3232 941
QQ3QQ 117
8T9TJ 602
46666 276
AJJ96 398
669TT 208
KK66K 189
TTTTQ 384
4KA6T 526
6A93Q 901
QQ788 870
KT67K 989
K7A3J 825
75477 94
67366 327
4AA74 860
J2AQJ 100
Q6767 838
22223 227
KTK95 307
774AA 388
77KJ7 425
55TJT 985
AAA5K 466
484J8 750
49QK8 853
52454 211
59KK5 817
3Q64T 615
A4452 420
TAJK4 852
83362 872
K9599 174
T45Q8 306
KTKK5 140
9922J 808
AAATA 704
A6A66 569
9TJT5 335
J5925 650
89763 823
J2TJQ 84
A67TQ 990
4T9QJ 876
KK6KA 568
99925 691
A82J9 775
897J4 730
727TJ 75
3383J 726
677K5 879
97345 947
Q7QQJ 23
76767 173
J6676 289
T555Q 558
636J3 47
JQQKK 715
2TT37 344
QA5Q6 429
6QQK5 993
8555J 241
77J88 29
7K7KA 4
55577 182
A2TJ4 846
99399 790
AQQQ4 766
Q838Q 631
56TT6 478
7QQ97 910
95595 333
35TQA 81
T397K 217
JQ92Q 152
88J8J 297
KK726 839
939J9 570
4456Q 911
A66J6 213
67666 51
8KTK6 396
54387 939
55353 981
4KKKK 144
JJAA7 654
2A2J2 314
3T87T 218
KA772 701
AAA26 598
969J6 970
96694 402
777T7 136
K7K4K 961
9TJ3K 386
8J828 973
J8AK3 161
79777 122
9573K 674
922A2 442
5Q5QQ 858
AT895 369
44477 559
7AT9J 354
J79J9 966
ATAA8 120
5655J 584
J777J 67
45544 282
4T49T 756
29998 197
KJ2AK 493
JJJJJ 219
9A99A 720
T777K 921
73766 799
J7KAA 394
893K7 253
2J72Q 847
JATTT 391
Q9999 179
8K4J4 780
555K9 477
T6789 886
5T555 512
6T4TT 818
JJKKK 937
J8669 504
3A883 346
33733 313
JJ992 185
94349 54
2T5T7 286
KA9K9 497
KKKJK 183
3Q63J 224
K7J84 128
75J3J 923
K8584 803
Q9QAQ 491
2J88J 275
Q96JJ 12
K3T7J 741
48285 172
QA36Q 502
AAAAJ 594
99929 864
57A75 194
AK562 510
A33TA 406
22A22 416
J888A 89
92888 296
J66JK 667
72JAQ 573
Q44JQ 894
2TQA5 535
23242 751
QJ83A 897
66282 272
56T28 752
JT3J8 692
J3JJ3 66
33939 822
8A883 764
88QJ3 237
9QJ5Q 768
888A8 933
A53K4 506
525J5 499
9999T 761
KAATJ 118
76J67 95
KQJ43 792
QA873 435
K5665 8
26A5A 662
94445 776
TJJ62 82
77747 553
65T2J 607
KKKK6 574
KQJ53 367
57866 537
Q94A9 210
J448A 903
6J66J 114
"""#
}
