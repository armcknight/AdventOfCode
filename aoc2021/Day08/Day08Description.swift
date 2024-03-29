//
//  Day08Description.swift
//  aoc2021
//
//  Created by Andrew McKnight on Dec 5, 2021.
//

/**
 --- Day 8: Seven Segment Search ---

 You barely reach the safety of the cave when the whale smashes into the cave mouth, collapsing it. Sensors indicate another exit to this cave at a much greater depth, so you have no choice but to press on.

 As your submarine slowly makes its way through the cave system, you notice that the four-digit seven-segment displays in your submarine are malfunctioning; they must have been damaged during the escape. You'll be in a lot of trouble without them, so you'd better figure out what's wrong.

 Each digit of a seven-segment display is rendered by turning on or off any of seven segments named a through g:
```
   0:      1:      2:      3:      4:
  aaaa    ....    aaaa    aaaa    ....
 b    c  .    c  .    c  .    c  b    c
 b    c  .    c  .    c  .    c  b    c
  ....    ....    dddd    dddd    dddd
 e    f  .    f  e    .  .    f  .    f
 e    f  .    f  e    .  .    f  .    f
  gggg    ....    gggg    gggg    ....

   5:      6:      7:      8:      9:
  aaaa    aaaa    aaaa    aaaa    aaaa
 b    .  b    .  .    c  b    c  b    c
 b    .  b    .  .    c  b    c  b    c
  dddd    dddd    ....    dddd    dddd
 .    f  e    f  .    f  e    f  .    f
 .    f  e    f  .    f  e    f  .    f
  gggg    gggg    ....    gggg    gggg
 ```
 So, to render a 1, only segments c and f would be turned on; the rest would be off. To render a 7, only segments a, c, and f would be turned on.

 The problem is that the signals which control the segments have been mixed up on each display. The submarine is still trying to display numbers by producing output on signal wires a through g, but those wires are connected to segments randomly. Worse, the wire/segment connections are mixed up separately for each four-digit display! (All of the digits within a display use the same connections, though.)

 So, you might know that only signal wires b and g are turned on, but that doesn't mean segments b and g are turned on: the only digit that uses two segments is 1, so it must mean segments c and f are meant to be on. With just that information, you still can't tell which wire (b/g) goes to which segment (c/f). For that, you'll need to collect more information.

 For each display, you watch the changing signals for a while, make a note of all ten unique signal patterns you see, and then write down a single four digit output value (your puzzle input). Using the signal patterns, you should be able to work out which pattern corresponds to which digit.

 For example, here is what you might see in a single entry in your notes:

 acedgfb cdfbe gcdfa fbcad dab cefabd cdfgeb eafb cagedb ab |
 cdfeb fcadb cdfeb cdbaf
 (The entry is wrapped here to two lines so it fits; in your notes, it will all be on a single line.)

 Each entry consists of ten unique signal patterns, a | delimiter, and finally the four digit output value. Within an entry, the same wire/segment connections are used (but you don't know what the connections actually are). The unique signal patterns correspond to the ten different ways the submarine tries to render a digit using the current wire/segment connections. Because 7 is the only digit that uses three segments, dab in the above example means that to render a 7, signal lines d, a, and b are on. Because 4 is the only digit that uses four segments, eafb means that to render a 4, signal lines e, a, f, and b are on.

 Using this information, you should be able to work out which combination of signal wires corresponds to each of the ten digits. Then, you can decode the four digit output value. Unfortunately, in the above example, all of the digits in the output value (cdfeb fcadb cdfeb cdbaf) use five segments and are more difficult to deduce.

 For now, focus on the easy digits. Consider this larger example:

 be cfbegad cbdgef fgaecd cgeb fdcge agebfd fecdb fabcd edb |
 fdgacbe cefdb cefbgd gcbe
 edbfga begcd cbg gc gcadebf fbgde acbgfd abcde gfcbed gfec |
 fcgedb cgb dgebacf gc
 fgaebd cg bdaec gdafb agbcfd gdcbef bgcad gfac gcb cdgabef |
 cg cg fdcagb cbg
 fbegcd cbd adcefb dageb afcb bc aefdc ecdab fgdeca fcdbega |
 efabcd cedba gadfec cb
 aecbfdg fbg gf bafeg dbefa fcge gcbea fcaegb dgceab fcbdga |
 gecf egdcabf bgf bfgea
 fgeab ca afcebg bdacfeg cfaedg gcfdb baec bfadeg bafgc acf |
 gebdcfa ecba ca fadegcb
 dbcfg fgd bdegcaf fgec aegbdf ecdfab fbedc dacgb gdcebf gf |
 cefg dcbef fcge gbcadfe
 bdfegc cbegaf gecbf dfcage bdacg ed bedf ced adcbefg gebcd |
 ed bcgafe cdgba cbgef
 egadfb cdbfeg cegd fecab cgb gbdefca cg fgcdab egfdb bfceg |
 gbdfcae bgc cg cgb
 gcafb gcf dcaebfg ecagb gf abcdeg gaef cafbge fdbac fegbdc |
 fgae cfgab fg bagce
 Because the digits 1, 4, 7, and 8 each use a unique number of segments, you should be able to tell which combinations of signals correspond to those digits. Counting only digits in the output values (the part after | on each line), in the above example, there are 26 instances of digits that use a unique number of segments (highlighted above).

 In the output values, how many times do digits 1, 4, 7, or 8 appear?

 --- Part Two ---

 Through a little deduction, you should now be able to determine the remaining digits. Consider again the first example above:

 acedgfb cdfbe gcdfa fbcad dab cefabd cdfgeb eafb cagedb ab |
 cdfeb fcadb cdfeb cdbaf
 After some careful analysis, the mapping between signal wires and segments only make sense in the following configuration:
```
  dddd
 e    a
 e    a
  ffff
 g    b
 g    b
  cccc
 ```
 So, the unique signal patterns would correspond to the following digits:

 acedgfb: 8
 cdfbe: 5
 gcdfa: 2
 fbcad: 3
 dab: 7
 cefabd: 9
 cdfgeb: 6
 eafb: 4
 cagedb: 0
 ab: 1
 Then, the four digits of the output value can be decoded:

 cdfeb: 5
 fcadb: 3
 cdfeb: 5
 cdbaf: 3
 Therefore, the output value for this entry is 5353.

 Following this same process for each entry in the second, larger example above, the output value of each entry can be determined:

 fdgacbe cefdb cefbgd gcbe: 8394
 fcgedb cgb dgebacf gc: 9781
 cg cg fdcagb cbg: 1197
 efabcd cedba gadfec cb: 9361
 gecf egdcabf bgf bfgea: 4873
 gebdcfa ecba ca fadegcb: 8418
 cefg dcbef fcge gbcadfe: 4548
 ed bcgafe cdgba cbgef: 1625
 gbdfcae bgc cg cgb: 8717
 fgae cfgab fg bagce: 4315
 Adding all of the output values in this larger example produces 61229.

 For each entry, determine all of the wire/segment connections and decode the four-digit output values. What do you get if you add up all of the output values?
*/
public enum Day08: String {
    case sample = """
acedgfb cdfbe gcdfa fbcad dab cefabd cdfgeb eafb cagedb ab | cdfeb fcadb cdfeb cdbaf
"""

    case biggerSample = """
be cfbegad cbdgef fgaecd cgeb fdcge agebfd fecdb fabcd edb | fdgacbe cefdb cefbgd gcbe
edbfga begcd cbg gc gcadebf fbgde acbgfd abcde gfcbed gfec | fcgedb cgb dgebacf gc
fgaebd cg bdaec gdafb agbcfd gdcbef bgcad gfac gcb cdgabef | cg cg fdcagb cbg
fbegcd cbd adcefb dageb afcb bc aefdc ecdab fgdeca fcdbega | efabcd cedba gadfec cb
aecbfdg fbg gf bafeg dbefa fcge gcbea fcaegb dgceab fcbdga | gecf egdcabf bgf bfgea
fgeab ca afcebg bdacfeg cfaedg gcfdb baec bfadeg bafgc acf | gebdcfa ecba ca fadegcb
dbcfg fgd bdegcaf fgec aegbdf ecdfab fbedc dacgb gdcebf gf | cefg dcbef fcge gbcadfe
bdfegc cbegaf gecbf dfcage bdacg ed bedf ced adcbefg gebcd | ed bcgafe cdgba cbgef
egadfb cdbfeg cegd fecab cgb gbdefca cg fgcdab egfdb bfceg | gbdfcae bgc cg cgb
gcafb gcf dcaebfg ecagb gf abcdeg gaef cafbge fdbac fegbdc | fgae cfgab fg bagce
"""

    case input = """
fdaebc egc gc bgefc ecbagd becfa fagc afgbec gdcbfae bgdef | cgfa gcebad ebcadfg cefgbad
dbafgec ce cgefdb abged aedc bec deafgb cbage edgbac gfacb | abcfg edca febdcg ecb
cad dgec fbdea bfgcad efabgc gacedf cfgae cd cdefa dbceagf | adefb aebfd aecbfg cedfa
ebaf fa abfcd cbfde egbfcad gdbac cabfed gedcfb gafedc adf | fgdbcae dabfc aedcbf af
decfag ca bdfag afc edca fdbceg dfgac cabfge gcdef cbfgdea | bafceg dagfc bacfdge fdgab
gcedf bdgafe gbadec bgc cfab bc gcfdb dbfag facbegd fagbcd | dbfcgea dgfbca dgbfc gabdec
gbdac cfagbe egbfcd efgbd aebgdf cgdbf fc cedf eafdbcg fcb | gfedbc fbcedg beadfg acbdg
debgf dbgaec bafgd gedcfb aebf adfegb dgfca gdbacef ba bad | befgd dfcgeb dgabf gaefbd
cdgafe dbag dbceag dbcea gbcfe dgc dg cabfed cdegb gceadbf | dg gdbcea decfba agcdfe
ecba cdeafg ca aecfbg fac fegcdba cdbgf adfegb agfbe abcgf | fac ecba ebafg fac
egacf bafce afg gfdeca cdfegb ga baedgf dcefg gcda dcgbafe | cfaeg feacg fdacebg fcaeb
bec fecgd adcbgfe fdcba cfabde dgebac cfbde be abef dfgbac | fdbec gdbcea bdefc dgbace
cae baedf cebdfag dcebg cadbe gcbdef gbceda ac gcebfa cagd | gdac dabef eabfgc agefbdc
acbfdg bf acgbfde efgdac bgaecf agfce adgbe ecfb bfg gfbae | gbf cefb fcgdba gbafce
dbacef cbfg egadf ecfgd gc ecdbfga debfc gec begcfd gcabde | fdeag cabged cgebfd fedcg
fgbc aefdb cdbfgae gfdec fbedc dcbgef dgeabc bec bc gcdafe | dgfec dacbfeg fgcde bc
gacbe cgdaeb dgeb aegcf abe ecgfbad acbdg acfbed be dgacbf | gfeac gfdecab ebfcad dbgfac
cag fedacg bacdeg cdgbe gfdab ceba ac bgedfca efbgdc gacdb | cga aebc cadbeg ca
cfeda fbcdag gacebfd gedfac gf gaf acefg gdfe egcba cedafb | ebacg fcdgae cgbfaed aecfbgd
beacg cd baegcd fgbeca egfdac debac fdaeb gdbc edc fgebdca | bcgea dc fecbdag cebda
fedbac afbde acedf cd cafebdg dce bdac cedgbf eagfc fedgba | afdebg cefda dc bdac
fbeac efbdag dfceab dbgacfe bd cgebfa dbf afgcd abcdf ebdc | fgeadb efcba dbgfae gafdbce
gbfdeac fg gfedc gfe gdebc fdcea eacdgb fdbg fcdbge agcfbe | dfcegba egf efg fg
bg bdgaf bgf fbcdgae afdcg fdecba afgdbe dbeg bfead ecgfab | dbefag aefgcb bg dbagf
ecfagdb becdf dabegc dbagfc cdf aefd df fbeacd abecd cfgeb | fedcba acgebd df gcbfe
dab egafbd abedfc bace gbefcda fdaec gfbdc cfbad ba gafdce | agfdce ab ab aecfd
cabgef bfced ceadf dcaeg fgad abfcged fae beacgd fa edgfac | fbecd degac af cadeg
adgfc dbgeac dgafb gca cedafg cadbef cg cgfe acgbfed cdefa | cdafg ecfg caefd dcfae
dfgb bg cdgefb afbegc dbcfea cbagefd ecbfd edcgb cdgea bge | efdcab dfeabc dgcea efbcga
cbfeg defc adgbc df adefbg cgfedb fdg bfgdace ceabfg dbcgf | dbcfg gafecb fcbeg dgefab
cf gaecdfb gbeadc gefbc cabfde fabcge beacg gfca debgf fec | ecbdfga fc ecgba afecgb
dbaeg dfb bcfa aecdgf cbdeaf gdefcb abefd fdcageb fecda bf | edcgfa cafdeb bagde fbca
gedfc efbd gbdfce efcbg fbgdace cbgae cgfeda fcb fb acbfgd | fgecb gbcfe fcb edfagc
cadbgf cade edgfc ecbgf edfgca fegda fagbdce dfc gfdabe cd | aced afged fbeagd cd
gcd ebfgd gfaebd gaedfc cd gfbca bcfdge gfbcd dcgefba cebd | bgfed fegabd bgfca gdfbce
dbaecf gfadeb gf gfbacd bagef gbf dfge becga daebf cbagfed | gf dgfcab gbf fgbdac
cedb egadcf acdbef ecf baefc fdacb fcbgda fgeba ce eagfcdb | decb fce ce afbce
ca cdgef acd gcdaf dcebfa gdacef adfbg ebfgcd cafegdb cega | dfgba cagdfe afbdg ecdbaf
gafcdb gfadeb agcd gcebf fgd bcdfa bdgecfa ecdafb dg fcbdg | dg cabfd dgf cgdbf
fegdacb dcafge gcd eabcdg fdeg gd bfdaec cgbaf adcgf adfec | gd aecdgf ceadf fgaedc
gbd gacd cefbga dbcgef dg badfgc fdeba aedgcbf afgbd cafbg | cgdbef bdfag cadbgf dcag
fcgde gbdc cb gbfea faegbdc ebc dbecgf bcefad dgecfa gcfbe | cfged bfcge cfgeb ecfgb
cafedgb cdbeaf degc dbgefa abgfc ec bfgde bgefcd egfcb cfe | debfca egdbf fcbade egdc
bfcdge dfecag abdfecg age afgc adfbe ag bedcga edcfg gefda | cdgebf gacfdeb efgda ga
cged cfgbad bgaefd deabcfg bdgea beacf gaedbc acd dc ecbda | befadg dfacgb cd eabfc
gcbea adb cafed bfdega dgcb db gdebca ebcda bgceaf fdbgeac | bd cgdb egfdab bd
beafcdg edbfcg efc aegbcf defabg ce fceag eafgb adgfc ceab | gfeac eabfg fce fabegdc
cefgb caefb gef dbgcaef fcdgea cadfgb edgb dbegcf ge bgfcd | gfe bfecdag fgbdc bcgedaf
geabd ace cadfb fagdcbe bgfcad cdfe dcfeba ce gbface cadbe | afbgce bdcea fdacb afdbc
cbedf cef decabg gedcfb fbdcgae gedf dcebg fdacb ecafgb fe | fegcdb fbecdg gdeabcf bafcd
bcgea aef geacf fgcde debagcf bfgdec fdaegc fa dafg adfbce | dgaf af cgafe caedfb
begfca aecfdgb da cdabge bcafde gaecb cfdge dac gbad ecagd | fagebc gacbe da afecgb
fdeg cbdagfe gd fgbade cbfeda fabcg afgbd acbged aedfb adg | adcbeg bdeaf fdaegb fcagb
cfaegd fabg af fbagcde egfbdc dgbaef dgbfe abedf dfa adceb | fbga bedgf dbcegfa dgbfe
egfab cdegbfa cbdeaf cfdeag gaecb cdabe cdgb egc gc bagecd | cfbead gfceda fadgecb dcbafe
acbfdge efad fca dgace ecfgb fa edgabc gefca adbcfg dgefac | afed dcgfae afc fac
cgedfa ec cdfebga beadf dgbcae ace ebgc bedca abgfdc dcgab | gadbc dcgfab ce feabd
facdgb faebdcg febcd gdb caebfd begf gb decga bgecd edbfgc | cdgeb dbecg dcgfbae dabcfe
geb dcfega ebacdg dbfcg egdca afbdge caeb egdcb ebfcdag be | gdcae bdgafe cagde eb
acbegf agb acgf beacd ebdfga bcfged caebg egbfc fadcbge ag | bga gab bag ecbad
bfdeg cbgdfe aefbgd gc dgec gecfb cabef deacfbg fgcdab fgc | fcg fedabg bfaec fegbc
ebdacf fbc fdcbag efdc acebgdf cf aebcg faebd ceafb dbegfa | cegab egbdfa fcbedga edcf
acfbd df dfgbeca ecfbgd fdb gacfb fecadb abdec eadf edacbg | fdb fbcead fgbedc gafcb
ba edgcb cabgde gabe fdeac ebcad fecbdga gdbcfe bgafdc bda | abedc abd baced fgdbec
ae gecdfb egbdc afcdb agbe gacdfe gaedbc dae cfgaedb bcade | cbafd eagbdfc ecgafd dbacf
bag fdabe bceg gfeabc ebgaf fcdgae bg cfgea bdfcage fbdcga | baedf fgbcda baegfc dabcfeg
cb febgd fbc cbed cgdfa fcgdeb cdbfg bceafdg efadbg cabfge | begafdc dagfc acdfg dcbe
dfbecg abg fbgadce egacb bcfeg deabc ga fcgbad gebafc fgea | bagec ag egaf cdgefb
cbdagf dcbegfa ecbdf ebgdf feg fgdbea gadfb gdfeca beag ge | feg gbdfa agfdec gbdeaf
abecgd agcf fdbcgae abfgcd egfdb fa bcdag adgfb fbaedc afd | af dabgc gacf adf
begda abcdg gefb bgdefa dbe ceagdf eb fdecagb gdfae ebfcda | gbef fcebda dgeab be
dagecfb gaebdf acdfg dca ecdabf geca gafed gdfbc ac dfegac | befcda dfcgb dfgae deagfb
ceb acdfbe adecfbg eacdgb fdbec efdcg fabe dafcb eb abdcfg | fbdac ebfa beaf fedcagb
cbadg cdagef efdgcb efabcgd aecf gbadef dec aedcg ce egdaf | degfa efgad dgabc ce
dace cfgaeb dafceb cfgaebd cba gcfedb fdecb dcfab bdagf ca | aedc abdfc ca bfdga
egd gdfb edgacb fecabd cfaeg gd egadf edgfab dafcbeg dfeba | dg dfbg egd adgbce
dgaebf geca fdgbc gda gadfc ag fgbadce aebcfd cdfea gdaefc | defcbag adcgf ga aegdbf
ef fegc cbaedf feb fbcgd bedga dfgbec facbedg agcfbd gdbfe | bfgcd bfdcae edfgb fe
edbfc eda gbecfd dfbgea ebdfac fcega ad cbad aegcfbd fedca | ebfgdc gafbde gfbdce gfadcbe
fd caebfd fdgc dfe baedfcg cgfbde dbage gbdfe bcfaeg gcefb | faebgc defcba aegcbdf ebdcfg
dbcea bfaedg cdagef ab cabg edfcb abe adcbfeg gdeabc dcgea | gcaed adebc cadeb cbga
fdbacge gbfda febca ead fcbdga ebgd ed afedb fbeagd edafgc | gacedf bfecdga fdbea edafgc
egfabc cgabf egaf cedgba bga dfgceb ga befcg fdbca fgdcaeb | bgcaf cbgfa ag ag
efgbdc cg adbfc dbgface bdfagc acdefb agbef cfg gcad bfagc | bcdfge dagc cdga dcabf
dgcafbe gfdeb fcaed dagc cgf gc dfegca gefcd ebafdc bafegc | efadc fgc acdg adcef
gdbeac dc bcad cdgeb fcdeag ecafdgb bgeda fbceg dcg febgad | cd dabc faegcd dceabg
dcegb fadce fdgaecb cdaeb bae decafg cbfa gfbeda efadbc ba | cedfab egdbc cbgde dcaef
gcdf defacgb abfed bafgce cagbed ecdfb bcgef ebfgcd dc dec | defcb gecfb befcd dc
adgcef bdfage dbcefa bcgef cbaegfd bgda fgdae ebafg ab bae | eabfdg feadgb egbfc fgbea
eafdc cebga fcaeg fadg gef agdcbfe gf dcabef cfdbeg efdcga | efg afdbec cfeda ecfag
gfeadb fegba gfbd agcbe edcafg egdfbac fg fdeba agf fadebc | efbad fdbg abefg gfdb
agde dgfcbea da acfeb cbdgfa bedfcg aecdb dba cedabg gbcde | aebfc fcabegd edgbc fagcbde
dgbefc dg bagdec cbage dge befda dcfgabe gbceaf begda cgad | efbgcd dgcbea baefd bedcfg
fbdc gdfeb df gfbcae dgeba fdbgcae dcbgfe fecgad cbfge gfd | gbade cagbef gabecfd cdafeg
dae begcad gfadec faegbc fecga ed cdabf egfd dfaec bgfaedc | dcbfa agefc egdcba acefgdb
abcef facdeb bd fadb aegbfcd fbecag dgfecb egadc cdb aebcd | becagf deabgcf abfce cbdae
gbefc aedbcf gcfbda eagd dec dgeacb begdc dacgfbe ed bcadg | cgdbfae dcagb badgec agbfcd
gefba dga cfbgd cbagedf fgbaec dabe ad gcdefa fgabd gebadf | efgabc gceafb bgcdf ad
cbfe adfeb bf afgecbd abfcde fdb ecgdab debac gbafdc gdfae | gdeaf becagd egadf dabef
fceadgb edfa cegafb afc fa afbedc bdaec begdac bcgfd dfcba | afbdc aedf af egbdac
cfgdabe fadgb bed dabeg ed ecda agfebc dgefbc degabc ecgab | cead gdcbea cgeadbf agcdbe
gc deafgc abcdf cgfba dagebf ebgc befag befcag agc fdegbac | agfcb efgab bgefa fbcag
adegcf age gefdb geafb egacfb faebdgc cbafg ea eabc bgdafc | cfgaed ea abgfdce ae
cfgbda dbf deafg ecbgf db dcagbfe gcbefa fgedb cebd cedgfb | aecgbf acdgfb fgedbc gfade
gbc fdgcab dbcaf cfbade febagc adbg gfcbd cdgfe fbedcga bg | gb bg gedcf cbg
gbdeacf dcf bcdaf ecad fadbg ebgdfc cabef acgefb cd edabfc | cdae gbcdafe dcf fbadc
afbd adcbfe da agfbec adc efdca fgdec abdecfg ceagdb cfbae | gafbced dfab becaf ecfba
dfbcg fabd cagfed egdcfb fa afc agebc fbagdec cgabf bfdcga | afc af gdbfc cgeab
dcbfg fcbeda ed dfegb gaebdf deb bgaef bedafgc aegcfb dgea | cgdbf dfcbg ed gade
ca beagc fgbdec gac egabd dcgbaef efbcg fbagcd eacf bgecaf | acg cga egbad adgbe
cabdfe gfebd af afce bdfgca ebdfa baf edgbca cdbae edgfbca | facbgd fgdeb ebdfg cfagbed
cadge gbaecf acfebd fdace fd fcabe bedf cegfabd cdfbga afd | afd egdac fecdab befd
bafegd efd aegdcb aecdfb efgb acfdg feadg cfdagbe gebad fe | efagd efd feadg ebgda
gbdfae geadbfc cabedf cgbe dce ec agcde gfdca adebg agdceb | ce aebdgc bdfcae fdgac
ba gfceab cedafbg aegdbc dbga eacdg cefbd eab eabdc gacdfe | dceba adbg cdeagf dbace
cfg cg bgafce bfdeca egacfd bagefdc agdfb cebg aebfc bgacf | afbgecd abcfdeg facbg agfcb
dg agdebc fcead gebfa cagefd cfagedb cebfad gde adfge fgdc | fegcdab eacbgd dgfbeac eacgdb
cafbg fbedgc egb beafd afbedc edag fgbaed fcdgabe gebaf eg | abfde gefabdc egb eadfb
fcb fcag afbedg gbadf fc fdebcg ceabd edgacfb dcbaf badfgc | fedagb gafcdbe dbgfa fcdgba
cge ebdafcg cfbg deabg cg ceabfd bcegfa deafcg abgec abefc | gcfadeb gec bagefc cabgef
gdbefc cae gafc ac ebcfg gabdcfe aecbf efbgac becdag fbdea | afdbe acbfegd cdgfbe efadbcg
cfgbd decgb fc fcb ebdgfa fdagb cagf dgfcbea dbafce bafgcd | ebgadf fdabg afdgbc cabfged
adfecg gbeaf cgdeb gdbeaf cgfbeda agceb bcfa ca eac faebcg | ecgab deafgb gbeaf cgabe
bd ecfbd cdbefa agbfcd bdf fgecd aebd fbace facgbe cbfgead | cafebdg bd db bfd
gbdef agcefd ebafdc acbg age degba cbeda ga gdceab bacfegd | cbadfe bgdea abdce ga
bafecg cg gdfbae cfg bcge cbagfd egfba acgbdfe adfec faecg | cfbeag cfg bacefg efbag
fade degbac gfcdb gedfab fa cafedbg fdagb bgdea gbfeac bfa | aegbdf bfadg gdeab dgfba
gbdc dfbca gafcbd agc ebfcdag dagcf gc cabfde faecgb adgfe | cfgaeb cdfeba acg dgcb
egcb cg cdgfbea defagc gedfb dcegbf edgabf fbcgd gcd fabcd | cg dfcgb gfdace edbgfca
cfgd gebda df fgbda afecbg feadcb adf gcbdfa decfgab cbagf | begad dgcf fbgac bdega
af fdbga dfebg bacdg fgabced cbgdfa fag bdagce abfcge afdc | dgebac dabgf dfbeg adfc
edabgf gbdcefa gafbe bedcag bag egdfa dfcage fbgce ba dbaf | geafbd bdacfeg bgecf abg
egfac ca cfbgda bgecf defabg fdgaec dcagfeb efagd agc dcae | adce cdea ceafg ecgfb
gfa bfeacg bgdea fadbc fg bdfceag eacgdb fged bgadf edfgba | gbdfae fg eadcgb bafdg
decabg cgae eda gedcfb fbegda badec gfadecb ae cfbad ecbgd | acbgde cefdgb gecdfb cafdb
gabef baefcg gfdeba agc gfbac bgfaecd efgc gc acgdeb cfbda | gcabfe gc cabfd gc
baecfd adgfce fbd agdfbce bdec bd faegb defba cdfgba dcefa | abcfdg dbf db efdbac
gfcbad ecadfg baefd dfcbge eadfc gfecd ac gbfdace adc aceg | dcefa fdegc ceafd ac
bedcfag dgbca gbfdca gfad bgfeac fcbdg ag gbdcfe agb eacbd | gab cabgef ag gbedcf
gcaefdb faged deg bgaef gcbdea befd cgabef cfgda bafdeg ed | fbgea fcgda ged gebfa
abcfed gfade edgca bagf fegbd bfcdeg fa gbdaef fad cdfgeab | ebgdf af bfag adf
cgdbfa bgde gebaf adgfe cedagf abefc edbagf dbcafge gb fgb | gfacdb afgeb feabdg gebfa
bde badgec db bfagde abcegf adcb edgbc ebacg egdcf fgcdbea | bd bagce edbfag ecdgba
afe ebgaf baecfd bagfc acfdgeb gfec fe bacefg gcdfba aedbg | dageb gebda ef eaf
debcga gac eacgf dcfeg ecfdag afebg ac dbcegfa debgfc cadf | bacgfed fcdeg bcefgad defgc
bfdcea cdf bfcde cbad gbefd cd fcedag beafgc gcdfeba aefbc | fcd decbf cbfdae dbca
ab eba adgef bgdae cbga bcdge acbdge gdcbeaf ebfdac bdgfec | cgab acdgeb cabg gbdae
egc acebgf aefcg ec dcgfa fecb dfabegc gcbdae dgfeba gebaf | dcgbae ce egbdacf gec
geacfd adgef bd fgcdeba agfdb egbd defabg bad cfbaed bafgc | fdbga bged fadegbc gacdbef
bea be badceg eabfcd gecbadf agbdc ebgad dfcgba gbce edgfa | degbca gabdc ecbgad gceb
fbdcge fgbaced fcegab ea acgdef afged aeg defgc dagfb aedc | fgdce adfbg fbeagc agfde
dgcefa bgdfc ecgb eagfbd bdafc dbg fbcegd fcged bg bcfgeda | gecdaf dgb bg fdbgc
dagbfe dfec bdfae bcfad faebdgc bcfga bcgaed cfadbe cbd cd | ebfdga gfcba cfde gbdfea
cbe bc cbdfea aegcb bfdceag geacdf efgcab bedag fcaeg bcgf | geabd cgabfe fcbage cbdefa
bgfeca degfcb gdeafc gafcb aefb dgcebaf cfb bdcga cegfa bf | cgbda cfgea abgdc gdbfec
gdbaf gbadcf eafbd agde cgfebd efacb afdcgeb bfdgae ebd de | dbe fgbad aefgbd bgedfc
ecaf fdeacg aebgfdc fc agedf cfdge cdf decgb befgad cfdgba | fdecgba dfc dfc cdf
efc fcdeg gfbe adgcf dbfcae abdegcf fdbgce cgbed adegcb fe | fce ef edbgc cadbeg
fcdbeg befdcga afdec fcedb acfdbg bd gdbe caebgf cebgf dbf | fdcgeab ceafgb dfb efdbcg
abgefdc gcadbe cabgdf ebafgc fbacg ebg efab eb gdefc efbgc | ceabgd fgced eagfbc fbecg
fbgad cdag eacdbf becfagd cdfgb gcefb cdf agbdfc dc fgaedb | dc fdc dc fcd
eb edbg cabedg agdecfb ecagfd eabcdf acebg gfcab egdca ceb | agfbc gbfac aegdcf egdabc
fa gcadbf gcead egcdaf ebagcd fegda dgfbe afd aecf badfegc | faedg afdecg gacedf fa
gfcae cefda fabged fcgbae cagd cedfb fad cgdfae da gdfacbe | fda gadfce gdeafb bfegca
fbdcag eb fagde daecgb bed adgeb dbfcae gdfbcae bgcda cbge | defga abedg eadfcgb bgdfac
ag beadf bgafdc deag bga befgc gbdafe fabced ecgfdab eafgb | aebfg dage ag ag
begad efgbd bagfced fegcbd gdcbaf ecgf bcefda fdg fg fcdbe | fegc edfbg gdf gf
efcba abfg caedfg dabec af gadcfeb acf fbcge fbecgd egfbac | gecbfd gbfa gebfc gdfeac
abgdc cgdefb gefadb fedacbg fedbg fbdga adf af cafgde aefb | agefdb afdcebg dcfeag fda
agcef cebagd ebdgf fdgcbe cb cebgf feabdcg gcb cdbf dgfeab | bdecfag aefcg dbgcfe ebagcfd
deg dcfea gdcef gacebd eg fdacbg fbge efbacgd fbcdg fecgbd | feacd efacd eg beagcfd
adfb ebd adcbe befgca fcaedgb aefcb cagde egbfcd db bafced | bcafe abefcdg cdabef efbac
cea ea ebcgad ebfa geafbc acgbfd fabgc gecbdaf ceafg cgedf | gacfe acbefg bcfdage eac
acgbf ea cabgdf egab acbgef gefca aef adcebf ecdfbga egcdf | afdcgb eadfcb fgcbad adbfec
gceabd afegc dcafebg bcgfa gecbdf fe dacgef fade efg egadc | fgcdea aefd gebcad acfeg
bf bedf gbdca fbedag fagde caefgbd fab bgadf deafgc eacbfg | fb eabfdg ecgafd fab
adgce defbg gbcf cf cdfabe bcgfed ebgfdac gfaebd cfgde ecf | abdcfge bedgf cgfde fagedb
fgac bgadec acfbeg dbgefac edfcb ebagc fa degfba eaf cefab | bcfae efdbagc bcfde fegacdb
acbdef cgaedf gca ebagf daefc ceadfbg cged cegfa bgafcd cg | decg cfdega acbdefg dbeacf
aegdf adfbgce cfbdg edgfc gdfbae ec ecdgfa aecg ced cebafd | agfedc dec abdcfe fabdgce
fecdgb bcd begad adcfbg gfbca cd dbacg fcda egbdfac fcabge | dbcegf bgafc dc dgeab
efcab egfacb bfcaed afbg cebfg fgdacbe bg eacgdb geb fgced | faecbg gb fabced beadfc
cdgebaf cfegb dgcfbe ebcgaf fdegca dbegf bdfag edbc egd de | fgcbe ed dfaceg cdgefa
egfdcb fcba gfdea agcebd fbdcg adb gdbaf fbcadg cfgdaeb ab | fcab edfag ab bgcdef
gfa bfgda degacfb gedfbc efdgb ag dfbca dfabeg gade fabgec | cbdegf ga gead egfbad
efgcda gdeaf begfc gbaefcd gdefc dc gcfbad adec aebdfg cfd | faedg dbcafg eadgbf agbfdc
cfbgd de egcfab dbea fedcga egfbd dbfage fagbe def gcabefd | fgcaed efgbac fbeagd dfe
efadg dbgae fcdbae fd fagceb bfgecad fad feagc adefgc dfcg | fad abgde gfaed aegdf
cagbf bfd fdgcea bd bgadfe adbfce dbcefag fadce ecdb cadfb | gdefab abcdf dcfabe bdf
cbfda fbgc ebacdg fdeagbc bg adbfg gfacdb egadf dgb adbcfe | gb fgdea gbd bdacf
fdbg egbfc eafcgb db edcag ecgbd fegcdb dcaebf cdb dfgbace | gcdeb cbd bfgd egdfabc
afgbc cgdf gbcdfae gbfcea fd dbf gadefb dfcba fcgbad eadbc | fd df fbgeca dfb
acef egfcbd fe dgbfa caegdb gcdefba faged aegcd gfe gfaecd | dafcge acef afgdb bgdace
ab fegca ceagb agedfc bedgc gefbad agb abfc ecbdfag aefbcg | egbdc bgaefd agcedf agbec
gfca cfaegd eafdc gf cbedaf dfg cdbge begafd egdfc debacfg | egdfab decfg gf fg
eagc gdceb abfdcg ag agb edcgbf edfba gbdefca ecbdag begda | gfdcab dabcgf bga cgeabd
bce dabcf fcbdge degbacf bfeg dgfce degcba fgaecd efbcd eb | bgef fdgecb be be
gafbdc ebfdcg ba gbcadef adegc befa gdebf fdbeag geabd agb | gba fgdeb feab fadebg
dgbec cdfega cfebad bdcae gc edgcafb bgca gec gedcab dfgbe | agbced cgba fabgdce fgaedc
agedc cf cdeagf agcf cbefda fdcge cdgaeb bedgf dcf gbcaefd | gdefb fc egcad abecgd
"""
}
