//
//  Day21Description.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 4, 2022.
//

/**
## --- Day 21: Allergen Assessment ---

You reach the train's last stop and the closest you can get to your
vacation island without getting wet. There aren't even any boats here,
but nothing can stop you now: you build a raft. You just need a few
days' worth of food for your journey.

You don't speak the local language, so you can't read any ingredients
lists. However, sometimes, allergens are listed in a language you *do*
understand. You should be able to use this information to determine
which ingredient contains which allergen and <span
title="I actually considered doing this once. I do not recommend it.">work
out which foods are safe</span> to take with you on your trip.

You start by compiling a list of foods (your puzzle input), one food per
line. Each line includes that food's *ingredients list* followed by some
or all of the allergens the food contains.

Each allergen is found in exactly one ingredient. Each ingredient
contains zero or one allergen. *Allergens aren't always marked*; when
they're listed (as in `(contains nuts, shellfish)` after an ingredients
list), the ingredient that contains each listed allergen will be
*somewhere in the corresponding ingredients list*. However, even if an
allergen isn't listed, the ingredient that contains that allergen could
still be present: maybe they forgot to label it, or maybe it was labeled
in a language you don't know.

For example, consider the following list of foods:

mxmxvkd kfcds sqjhc nhms (contains dairy, fish)
trh fvjkl sbzzf mxmxvkd (contains dairy)
sqjhc fvjkl (contains soy)
sqjhc mxmxvkd sbzzf (contains fish)

The first food in the list has four ingredients (written in a language
you don't understand): `mxmxvkd`, `kfcds`, `sqjhc`, and `nhms`. While
the food might contain other allergens, a few allergens the food
definitely contains are listed afterward: `dairy` and `fish`.

The first step is to determine which ingredients *can't possibly*
contain any of the allergens in any food in your list. In the above
example, none of the ingredients `kfcds`, `nhms`, `sbzzf`, or `trh` can
contain an allergen. Counting the number of times any of these
ingredients appear in any ingredients list produces *`5`*: they all
appear once each except `sbzzf`, which appears twice.

Determine which ingredients cannot possibly contain any of the allergens
in your list. *How many times do any of those ingredients appear?*

*/
public enum Day21: String {
case sample = """
mxmxvkd kfcds sqjhc nhms (contains dairy, fish)
trh fvjkl sbzzf mxmxvkd (contains dairy)
sqjhc fvjkl (contains soy)
sqjhc mxmxvkd sbzzf (contains fish)
"""

case input = """
ncqsz xjkfsv mxvpm srbsb tfxz dmq jdvpbd pqhqk nhp hmzmpb jkhmz mkhptq mkpd dxxppcp mqqf mvtrgzv dznq glcjl nljbcd xmdk jfrmhn kjkhnh vrcbg fkhp nnvjn gprzt bxx snjxz snph mvqrd dklgl zzt cjl ktrk fgm gmhrm znfh vfcxtx mfht mvxmrl jxx vvpdgp ktkqkk gdfht tlgrhdh tj kqv ntqckl dgfppc jcks sjzpvnr tsnkknk rkzx rfmds gqlgv pbvmt jlgf fjxgflq qpchg qnsq zrrdcb nflcpz rxr ddkk gxxzpxb dprlv bzgcx ppppc gzhj nft tnxvt qdlpbt cstj pjshhf lplf nrkfql vlfbd znjztb gxmptfk pmcmpk qqpfq vggmnpdz hmtznj (contains eggs)
tgt nqhkv xbccds vgrdpf zsmvjh pbvmt mgbc gqlgv pmvfzk fgm kqv hnrjrb kzvzdk nft mfht jlgf htdmzp kfdqkgm gxxzpxb dzvj nqrj jfrmhn zzt pncmv rcm gzhj nhp rrqv ps krrfcv vkzxc snph vlfbd qpchg nnpbt fljn xmdk lcdcd tsnkknk mrdr dngvn blhjpn hgb hmtznj mkhptq dpn ngk cstj tlgrhdh dld rbt bxx kpsj qdlpbt ghhgl kfmvn pnzpr ktkqkk gmhrm mprqh gcs xjkfsv dklgl znsgzjm nnvjn gkhbpd (contains wheat)
bxx qpchg vfcxtx tsnkknk lhfffc pnfhkd hgb dgfppc lzkj nljbcd kjkhnh ckrrj vfpdc pnzpr cskrz mkhptq vjggt smnvks znjztb mvxmrl htdmzp nnvjn zzt tj nflcpz bnzk xgvxhsf pntlbv bxtln clq ghhgl xmdk zsmvjh gprzt mrdr vxq dzvj ps qdlpbt pmvfzk tlgrhdh ncqsz fgm gqlgv gcs znsgzjm gttkvg mvtrgzv sjzpvnr mgbc ddkk vkzxc rkzx bsfbj xkmvksh pqhqk glcjl nnpbt cpjtmx kqv hzt dgrfj zhxvl lmx mzcmnhl snjxz qpqbcqs ssqf kfmvn qqpfq ldstvt gxmptfk znfh mprqh nhp jxx jfrmhn hbnnx vvpdgp vrcbg tpjmxd lplf sqpgzf (contains wheat)
ltznm mbq hhflg nqhkv xmdk ktkqkk tsnkknk znfh tgt vfcxtx gttkvg nft jxx zzt pmvfzk fgm ppppc kfdqkgm ggfcbj gkhbpd qmbklgz cstj mrdr dklgl tpjmxd nqrj zrrdcb lplf nljbcd kqv pnfhkd znjztb rxr vsvbjx pmcmpk vfpdc lcdcd mprqh ntqckl dxxppcp clq mkpd glcjl tlgrhdh tnxvt cfgb ps klxdnlk (contains wheat)
ckrrj qdlpbt rxr kflk dgfppc ddkk clq pmvfzk htdmzp cjl cfgb pqhqk ktkqkk zgxj tksdnjlg rfmds pgjsbf nljbcd vgrdpf ltznm lmx lxfth smnvks jxx dprlv vvjm cpjtmx tsnkknk kqv ggtxh mvqrd tfxz mvxmrl jcks pncmv sqpgzf zzt xjkfsv drkmkss dxxppcp dld dklgl qmbklgz lcdcd vfcxtx (contains sesame, eggs, peanuts)
hzt zzt mln lqphl vgrdpf ncqsz pjshhf bxx qpchg xsckzs mvxmrl ddkk xmdk pmcmpk dgfppc clq vkr tlgrhdh nft dzvj mvtrgzv vkzxc gkhbpd kjkhnh hgb mgbc mrdr dznq jfrmhn pqhqk xkmvksh vgvthk dxdfjd hbnnx kqv dprlv pbvmt snjxz dklgl gqlgv hbpn mgxqh pnzpr ntqckl dld xjkfsv ckrrj jxx lzkj dmq rxbfkh hqgqs krrfcv dpn pmvfzk htdmzp ktkqkk mprqh kxpjsfz smnvks bsrbkh fkhp jcks jmk cstj tgt mkpd ppppc zrrdcb hfkjj tj qdlpbt vvpdgp lqsxnmm fjxgflq ggtxh kpsj (contains fish, dairy)
nnvjn kqv cjl xvvm pnzpr hmddp kjkhnh vjggt tsnkknk ckrrj lqsxnmm hzt ddkk pnlsl jxx vvpdgp vxq npqdm rkzx vfpdc vkzxc ccxg znjztb xsszjk tj vvjm qpqbcqs kxpjsfz xjkfsv dxdfjd mqqf blhjpn jkhmz mgxqh dld gmhrm qmbklgz fgm hgb ssqf hhflg nft pntlbv ggfcbj vgrdpf gdfht rfmds nqrj vrcbg xsckzs xbccds dngvn snjxz zzt cfgb dklgl krrfcv vnczq qdlpbt drkmkss klxdnlk dqj pmvfzk lcdcd bxtln vggmnpdz (contains nuts, dairy)
jmk pmcmpk gxxzpxb mgxqh srbsb bsfbj gprzt rxr mln mvtrgzv mxvpm cfgb snjxz gdfht snph dgrfj dklgl dngvn pncmv jlgf rrqv bxtln nhp hdlqj jxx vfcxtx lmx nkv kfmvn gkhbpd jcks nft hbnnx dqj mqqf fgm pgjsbf mprqh hmtznj tksdnjlg bzgcx qqpfq jdvpbd rkzx pbvmt pjshhf tfxz bxx tnxvt tsnkknk dprlv ltznm fljn ktrz vsvbjx jfrmhn vvpdgp cstj bdjlqq pmvfzk gmhrm hqgqs tlgrhdh lqphl smnvks zzt klxdnlk gxmptfk nflcpz lhfffc ktrk vgvthk drkmkss sjzpvnr mrdr qdlpbt qpchg dld nqrj pqhqk gzhj lcdcd hhflg bsrbkh hbpn (contains eggs, peanuts)
cstj ktrz pncmv nnpbt dgrfj mprqh gzhj kflk smnvks vgvthk mvxmrl hgb znsgzjm tlgrhdh bxtln drkmkss tj pnfhkd qdlpbt mxvpm rfmds mvqrd rxbfkh dxxppcp tksdnjlg dklgl xbccds lqphl jdvpbd vnczq qpqbcqs gxmptfk zsmvjh jfrmhn cskrz hdlqj mrdr ccxg tfxz vfcxtx pbvmt mgbc lqsxnmm ldstvt jlgf vggmnpdz mkpd nljbcd pqhqk hhflg xgvxhsf pjshhf ppppc kfdqkgm sgltzg zgxj pmvfzk tsnkknk bzgcx lzkj nkv kxpjsfz gqlgv zzt kpsj dznq fjxgflq kqv vjggt qqpfq (contains peanuts, shellfish)
dngvn bsfbj fgm sjzpvnr bnzk mqqf lqphl xsszjk ncqsz smnvks tsnkknk vggmnpdz npqdm qpchg kfdqkgm fkhp sgltzg rxbfkh dgfppc dklgl hmzmpb bdjlqq lzkj rcm jkhmz vsvbjx tlgrhdh lmx vxq drkmkss pmcmpk hmddp vlfbd gcchzx jrl dxdfjd zzt jxx vrcbg jlgf pmvfzk pnfhkd nhp mkpd mgxqh qqpfq vfpdc xkmvksh kzvzdk hbnnx ckrrj nnvjn nljbcd pjshhf bzgcx mgbc pnlsl ppppc jcks xbccds ldstvt kflk zgxj mfht nkv sqpgzf hnrjrb hgb hqgqs vjvk cpjtmx kqv zsmvjh xmdk cskrz clq (contains wheat, fish)
nflcpz jkhmz hmddp kfdqkgm ppppc jxx ckrrj rfmds jmk tlgrhdh ktrz pmvfzk gmhrm cskrz pnfhkd vjggt snph vnczq zzt mgxqh mvqrd tsnkknk kqv dld lxfth klxdnlk gqlgv mln glcjl kxpjsfz mvtrgzv hmzmpb cfgb jrl vxq nqrj mvxmrl qdlpbt xmdk gcs pncmv vggmnpdz crblbc dxdfjd xgvxhsf nnpbt gprzt tpmrhn vfpdc vkr ktrk vrcbg cjl (contains wheat, eggs)
qdlpbt tnxvt jfrmhn kfdqkgm hbnnx vxq ppppc drkmkss zzt rfmds tlgrhdh mln vjvk rkzx bxx bzgcx mxvpm gcchzx vrcbg znsgzjm smnvks nqrj tgt mvxmrl mkpd dqj gdfht mvtrgzv glcjl jkhmz xjkfsv gttkvg znfh bnzk nnpbt vfpdc pncmv cjl xsszjk jcks qnsq nft fjxgflq ktrz sqpgzf lzkj zsmvjh fljn hhflg hbpn mkhptq pmvfzk qpchg zgxj lxfth rxr tpmrhn ktkqkk krrfcv crblbc pgjsbf vvjm hnrjrb xsckzs vjggt cpjtmx dklgl pmcmpk qpqbcqs dgrfj xkmvksh tsnkknk zhxvl lqsxnmm kqv mprqh bxtln htdmzp (contains sesame, nuts)
vkr jlgf jkhmz nqrj ckrrj kqv gkhbpd pntlbv tfxz srbsb mxvpm pmvfzk cpjtmx znfh nnvjn qpqbcqs hzt ktkqkk mln ggfcbj gxmptfk snjxz jxx fjxgflq qdlpbt nnpbt gzhj xkmvksh zhxvl ddkk mprqh xsszjk vgrdpf ntqckl lcdcd nqhkv hmzmpb tj nkv lqsxnmm tlgrhdh tsnkknk hmtznj bdjlqq snph zzt hbnnx dpn vrcbg fgm (contains shellfish)
zzt hbpn mvxmrl rfmds rxr lzkj tnxvt blhjpn xgvxhsf pmvfzk pnlsl ppppc jkhmz vsvbjx dxdfjd zsmvjh mzcmnhl qmbklgz kqv tsnkknk hfkjj sqpgzf kflk clq gkhbpd gttkvg jxx xsszjk tlgrhdh dld ntqckl mqqf nkv jmk gprzt ktrk kpsj vnczq vrcbg qdlpbt zgxj dqj xmdk hmddp ldstvt nrkfql pjshhf jrl kxpjsfz ltznm qqpfq dgfppc jfrmhn bsrbkh zhxvl rkzx rrqv mxvpm gdfht pgjsbf ggfcbj gzhj (contains fish, wheat, shellfish)
jlgf kflk xgvxhsf gzhj xkmvksh drkmkss vvpdgp cskrz cstj pnzpr kfmvn clq vjvk qdlpbt kqv ngk hbpn pgjsbf zrrdcb zgxj hhflg jxx ldstvt mln bnzk mkpd xjkfsv pqhqk hbnnx pmcmpk xsszjk hzt jdvpbd lcdcd dklgl tfxz gqlgv gmhrm ggfcbj nqhkv ggtxh dld tpjmxd pntlbv ktrz zhxvl rkzx vkr dgrfj pmvfzk nhp bzgcx kjkhnh xsckzs xmdk tksdnjlg tsnkknk mgxqh hmddp dqj zzt rcm tnxvt gprzt ntqckl krrfcv fgm nnpbt vnczq fkhp vfcxtx (contains fish)
glcjl vfcxtx xmdk vfpdc bsfbj hbnnx zzt ngk mvxmrl vkzxc rcm tlgrhdh vsvbjx qpchg bxx jmk ltznm fljn hqgqs lhfffc hbpn crblbc gttkvg nrkfql srbsb qmbklgz rbt kfmvn fkhp mprqh qnsq snjxz vjvk dngvn pmvfzk mvtrgzv jxx znsgzjm tpmrhn nnvjn ncqsz cpjtmx tsnkknk vgrdpf ckrrj hmzmpb xkmvksh dpn gcchzx lmx lzkj kqv rxr jkhmz jdvpbd kxpjsfz hzt vkr mxvpm npqdm hnrjrb tgt sjzpvnr pnlsl mvqrd ccxg smnvks mkpd bdjlqq pncmv kfdqkgm ppppc hfkjj znjztb jfrmhn nljbcd drcxd dklgl xbccds ktkqkk ggfcbj (contains sesame, peanuts)
nrkfql dqj hbpn vjvk ncqsz sqpgzf mqqf tpmrhn tlgrhdh jfrmhn lcdcd clq kzvzdk fgm npqdm jdvpbd ggtxh bzgcx vvpdgp znsgzjm smnvks znjztb pmvfzk mvtrgzv jkhmz ppppc crblbc pnzpr hfkjj gzhj xgvxhsf glcjl zzt jrl dmq qnsq hqgqs ddkk vsvbjx vkzxc qdlpbt kqv vfcxtx bdjlqq krrfcv ktkqkk bsfbj vkr mxvpm zhxvl rcm gprzt nkv fjxgflq htdmzp dznq cstj cskrz xjkfsv tsnkknk lhfffc pgjsbf bnzk dzvj hbnnx dklgl hnrjrb gcs srbsb nnpbt qpqbcqs xkmvksh mzcmnhl kfdqkgm nqhkv qqpfq jcks qpchg ktrk (contains shellfish, wheat)
zsmvjh znfh hmddp ckrrj lqsxnmm ccxg ltznm hmzmpb vxq pncmv kqv xgvxhsf xsszjk kfmvn zzt dqj xbccds dklgl vkzxc hnrjrb hbpn fljn mgbc vfcxtx jxx dgfppc sgltzg kpsj xjkfsv mprqh mrdr npqdm tnxvt rxbfkh hdlqj nljbcd rfmds jlgf tgt mvxmrl vggmnpdz vsvbjx lxfth kjkhnh dgrfj mgxqh gmhrm pmvfzk tj hgb rkzx tksdnjlg tlgrhdh zgxj jkhmz vvjm gcchzx rbt lhfffc vfpdc dpn tsnkknk (contains eggs, wheat, peanuts)
zsmvjh dxxppcp kpsj ggtxh hqgqs nljbcd qdlpbt mgxqh tpmrhn fgm mln sqpgzf znfh kzvzdk hbnnx glcjl gttkvg dxdfjd kflk dklgl pbvmt nnpbt zzt pmvfzk fkhp drcxd vjvk nkv vrcbg rcm cjl kfdqkgm ncqsz ngk vgrdpf mrdr gxmptfk snph hmddp ktkqkk ldstvt tsnkknk mxvpm dgrfj kqv tj vkr rbt klxdnlk jxx tpjmxd nhp jmk hbpn (contains fish, peanuts)
pncmv jxx mqqf tsnkknk ntqckl ldstvt xgvxhsf pgjsbf nljbcd dxdfjd ggfcbj tnxvt cfgb gzhj mln dznq nnvjn hbpn bxx tfxz hbnnx dprlv clq ktrk bnzk jdvpbd gcs ssqf nflcpz vrcbg vjggt smnvks vkr hhflg xsckzs rrqv rkzx jmk hnrjrb pqhqk rcm vxq kflk lmx hmddp zhxvl fljn pmvfzk jrl jcks mzcmnhl mprqh ggtxh mvxmrl tksdnjlg hmzmpb dpn mgbc hdlqj bdjlqq kjkhnh gttkvg drkmkss dklgl gprzt kqv vggmnpdz znsgzjm mfht sgltzg tlgrhdh vsvbjx cjl zgxj fkhp kxpjsfz sjzpvnr tpjmxd vgrdpf zzt ncqsz qqpfq gkhbpd qnsq zsmvjh lqsxnmm vvpdgp (contains wheat)
krrfcv mvtrgzv bnzk qpchg vsvbjx nnpbt jmk zzt pbvmt mgxqh mzcmnhl dzvj hmzmpb vrcbg gxxzpxb nqrj vlfbd rrqv zrrdcb ncqsz xmdk vgvthk bxtln lzkj ktrz mxvpm dmq jdvpbd vjggt mqqf vfcxtx mprqh nhp rcm jxx hbpn tksdnjlg sjzpvnr tsnkknk snph jlgf kzvzdk rbt kpsj hmtznj vkr xvvm tlgrhdh ngk pmvfzk kflk pntlbv rxr znsgzjm gdfht blhjpn ggtxh xsszjk qdlpbt ktrk zgxj ghhgl htdmzp nft hdlqj nkv kqv hgb (contains eggs, wheat, dairy)
vkzxc vkr zsmvjh lmx pmvfzk snph xsszjk nrkfql znsgzjm gcchzx kqv ktrk nkv qdlpbt pbvmt mrdr nljbcd vfcxtx jlgf mqqf bsfbj hmddp kfmvn dngvn klxdnlk ltznm vvpdgp dklgl tsnkknk tksdnjlg dprlv vlfbd sqpgzf sjzpvnr bdjlqq gttkvg xbccds vxq jkhmz jcks pnzpr rxbfkh hgb tnxvt tpjmxd dgfppc nhp vsvbjx mvtrgzv rkzx xsckzs bxx pqhqk vjggt zzt pntlbv tfxz ntqckl tlgrhdh fkhp vggmnpdz znfh gxxzpxb lhfffc qpqbcqs rcm hhflg fgm qmbklgz (contains dairy)
mvxmrl dpn mprqh kzvzdk jdvpbd pmvfzk ngk vxq gxmptfk qdlpbt gqlgv znsgzjm lmx drcxd hnrjrb tfxz hdlqj vkr htdmzp snph vggmnpdz pnlsl vlfbd tj jxx cpjtmx tsnkknk ckrrj kpsj qmbklgz vrcbg vgrdpf tlgrhdh kflk ddkk kqv rxbfkh rcm rkzx blhjpn dklgl zhxvl xgvxhsf ccxg bzgcx pntlbv vjggt vjvk pnfhkd ggfcbj ssqf gdfht (contains sesame, shellfish, eggs)
vxq mvtrgzv nflcpz gqlgv gxxzpxb lhfffc mfht mvxmrl nqrj xkmvksh qpqbcqs nqhkv sgltzg pnlsl zzt kzvzdk kfdqkgm mzcmnhl vkzxc qqpfq bnzk vvjm gprzt cpjtmx smnvks ktkqkk pncmv dqj cfgb jxx mln tpmrhn ghhgl vfpdc pmcmpk drkmkss dprlv lzkj tsnkknk dzvj qdlpbt gmhrm hqgqs dklgl hmtznj sqpgzf lmx gcs cstj tlgrhdh hmzmpb jkhmz lxfth mgxqh kqv (contains nuts, sesame, dairy)
ntqckl hnrjrb kflk pmvfzk rbt hdlqj blhjpn jxx hbpn bnzk mkhptq zhxvl ssqf znjztb pnzpr vvjm bxx jfrmhn nrkfql pnfhkd pmcmpk xsckzs jdvpbd gxmptfk bzgcx sjzpvnr dgfppc mxvpm vggmnpdz dklgl npqdm nnpbt dzvj ktkqkk mfht xkmvksh lhfffc klxdnlk zsmvjh tnxvt rfmds rxbfkh zrrdcb xgvxhsf pqhqk kfdqkgm gqlgv tlgrhdh qdlpbt snph ps mvqrd gzhj fgm rcm ddkk gdfht clq vvpdgp kpsj qpqbcqs ghhgl nhp xvvm tsnkknk tpmrhn gprzt mkpd bsrbkh hqgqs mvtrgzv mbq xjkfsv cfgb hfkjj zzt vgvthk (contains fish)
kqv jfrmhn blhjpn tlgrhdh fgm krrfcv rcm dklgl nft pmcmpk mqqf bxtln fjxgflq cjl npqdm drkmkss lxfth tj zzt bdjlqq gprzt tsnkknk xsszjk qdlpbt sqpgzf kzvzdk jxx vvjm vrcbg hgb mvxmrl mgxqh mfht ghhgl jdvpbd qmbklgz gcchzx dmq sjzpvnr (contains eggs)
dxdfjd blhjpn zgxj pgjsbf rbt ghhgl cfgb pmcmpk dmq bdjlqq qpchg mrdr dgrfj tlgrhdh dzvj ssqf tnxvt dklgl mgxqh hdlqj nflcpz dqj klxdnlk xgvxhsf hmzmpb vkzxc xjkfsv snph rxbfkh ktrk crblbc mvqrd ps vjvk ckrrj qdlpbt vggmnpdz lmx vnczq mzcmnhl dprlv qmbklgz jdvpbd mprqh zzt hmtznj jmk pmvfzk snjxz vfcxtx mln vxq nnpbt tpjmxd lxfth fgm jrl nft mvtrgzv hmddp qqpfq znsgzjm hgb tsnkknk hzt lcdcd hfkjj pjshhf pnlsl lqsxnmm sqpgzf vlfbd jxx dpn tj xmdk ltznm vkr nljbcd gzhj vsvbjx drkmkss qpqbcqs mfht (contains wheat, nuts, eggs)
mgbc hmzmpb kzvzdk dxdfjd glcjl vlfbd mgxqh dklgl gkhbpd tsnkknk qqpfq xmdk nrkfql drcxd mkpd znjztb lqsxnmm lmx rbt nnvjn srbsb vfcxtx mkhptq ngk clq sgltzg dld vrcbg tj zrrdcb vxq ssqf jxx nljbcd gmhrm nqhkv pntlbv znsgzjm mrdr qdlpbt pmvfzk tgt qpqbcqs bzgcx gxxzpxb drkmkss hnrjrb zzt gqlgv qpchg bxx htdmzp mqqf hgb gdfht vfpdc hbnnx gcchzx znfh gcs tlgrhdh xvvm (contains sesame)
ps mprqh nkv vlfbd xvvm znjztb mzcmnhl pmvfzk jrl rkzx gxmptfk lplf pnlsl dznq pgjsbf mvqrd klxdnlk tsnkknk rxbfkh pnfhkd ltznm lmx kqv jkhmz qpchg zzt pjshhf dzvj rrqv rxr vxq xsckzs rcm hgb bxx vsvbjx hnrjrb zhxvl gqlgv snjxz sgltzg mqqf bdjlqq gcs npqdm ncqsz ggfcbj xmdk cfgb vvpdgp ldstvt kzvzdk fljn kpsj nqrj rfmds dxdfjd vfcxtx vkr hbnnx fgm xsszjk vkzxc qdlpbt zrrdcb gttkvg qmbklgz ddkk bnzk glcjl ggtxh smnvks dklgl tlgrhdh jfrmhn mfht pmcmpk ppppc dgrfj ktrz vjggt snph sqpgzf bsrbkh jcks (contains nuts)
sqpgzf kflk srbsb ngk bsrbkh pjshhf tnxvt fljn gxxzpxb mfht smnvks hbnnx qqpfq tj drkmkss tpjmxd xvvm lzkj vfcxtx pnfhkd znjztb tsnkknk pnzpr klxdnlk lxfth pgjsbf fgm rxr gprzt nkv dklgl qdlpbt ddkk krrfcv gcs kqv jrl lhfffc pmvfzk hdlqj jkhmz gxmptfk vgvthk dprlv lqsxnmm ltznm bzgcx ccxg jxx rcm bsfbj cstj hhflg nnpbt mrdr hmtznj tlgrhdh lplf (contains shellfish, wheat)
tpmrhn vfcxtx zzt bzgcx nqhkv kxpjsfz vvpdgp vvjm ktrz rxr vrcbg hbpn jxx xvvm mgbc kfdqkgm mrdr mvxmrl mqqf sqpgzf gqlgv kpsj kqv dznq fjxgflq mbq sgltzg dxxppcp nkv gdfht nnvjn nqrj znjztb dgrfj vggmnpdz bsrbkh vkr htdmzp hmtznj gcchzx clq hdlqj vxq pnlsl sjzpvnr kflk tlgrhdh mgxqh tsnkknk snph jlgf npqdm pntlbv pmvfzk dpn lqphl nljbcd ccxg dmq vkzxc hnrjrb hmzmpb qpchg tfxz mvqrd lzkj dklgl jfrmhn dngvn xsszjk vgvthk jrl bdjlqq jcks bsfbj mvtrgzv (contains wheat, sesame, peanuts)
gzhj cskrz mzcmnhl tpjmxd dklgl qpchg gxxzpxb dzvj lxfth qpqbcqs hdlqj mprqh sjzpvnr vjggt xvvm ktrz xkmvksh blhjpn vlfbd vfpdc tj gcchzx kflk tgt ncqsz xsckzs xsszjk dmq vkr pnfhkd nqhkv hnrjrb ngk smnvks zzt dgrfj tsnkknk cjl qdlpbt tnxvt gqlgv vsvbjx mxvpm kqv dqj znsgzjm pnlsl nrkfql bdjlqq ggtxh pjshhf hhflg lmx jlgf hfkjj cstj hqgqs ddkk rkzx ppppc fkhp ps snjxz dpn mkpd nljbcd vgrdpf vggmnpdz mgbc pmvfzk dznq hmzmpb srbsb qqpfq jdvpbd ntqckl hmddp gttkvg znfh vkzxc kfdqkgm vrcbg ltznm jxx (contains sesame, nuts, shellfish)
pnzpr hbnnx npqdm ckrrj ncqsz jxx lcdcd nnvjn mqqf zzt nqhkv pqhqk tsnkknk bnzk znsgzjm crblbc dklgl pmvfzk lplf hbpn dxdfjd zsmvjh mkhptq gttkvg pmcmpk pnfhkd sqpgzf gcchzx mgbc bsrbkh ldstvt qmbklgz tfxz bxtln mxvpm vvjm kpsj ktrk mln xkmvksh vvpdgp vxq kqv ccxg hnrjrb ssqf jlgf gkhbpd mgxqh gmhrm kflk mprqh jfrmhn fjxgflq hmzmpb vsvbjx ntqckl ps klxdnlk jcks kxpjsfz qdlpbt krrfcv ppppc (contains sesame, eggs, nuts)
fjxgflq hmtznj lcdcd pntlbv pnfhkd snph dklgl dxxppcp xkmvksh rcm ldstvt sjzpvnr mvtrgzv pjshhf zgxj mzcmnhl pmvfzk qqpfq jrl vfcxtx xbccds ccxg gxmptfk hbpn kpsj tlgrhdh hzt pncmv mvqrd kfmvn zhxvl zzt rbt mvxmrl kzvzdk vkzxc kfdqkgm tfxz bsfbj vnczq krrfcv hnrjrb ssqf bdjlqq tsnkknk clq xmdk nnpbt rrqv gkhbpd tpmrhn gzhj dld snjxz cstj jcks lqsxnmm lplf drcxd tksdnjlg zrrdcb pqhqk xsszjk xsckzs dzvj fgm mbq dqj drkmkss gcchzx jxx lqphl vrcbg mkpd ps nkv kflk hhflg kqv lzkj vggmnpdz bnzk pbvmt mrdr (contains sesame, dairy, nuts)
ktrk nqhkv fljn pjshhf cfgb lqphl nrkfql dngvn vfcxtx rfmds znsgzjm glcjl zgxj snjxz vlfbd snph jrl bxx nljbcd lcdcd pbvmt hbnnx clq vvjm mvqrd ltznm ghhgl qdlpbt ncqsz jxx lzkj npqdm gcchzx nhp mrdr hfkjj mzcmnhl rcm lxfth pgjsbf znfh jfrmhn kqv kzvzdk pmvfzk dmq tlgrhdh vrcbg gttkvg lmx qpchg gkhbpd cpjtmx vgvthk cjl bzgcx xsszjk srbsb pmcmpk ps dqj dklgl qqpfq vjggt tj qmbklgz vggmnpdz pnfhkd kfdqkgm bsfbj zzt nqrj mvtrgzv qnsq sqpgzf zrrdcb krrfcv xbccds dprlv (contains dairy, eggs)
kxpjsfz tgt sjzpvnr mxvpm pmcmpk mprqh znfh hmzmpb zgxj bzgcx kqv mln tsnkknk vnczq htdmzp jxx ldstvt kpsj hbnnx xvvm gzhj dgrfj vfcxtx xsckzs hzt drcxd cskrz bnzk glcjl dpn jlgf snph lhfffc pbvmt dklgl dxdfjd tnxvt tlgrhdh lplf crblbc dmq zsmvjh mvqrd mqqf zzt ccxg tj kjkhnh gcchzx nhp qpchg sqpgzf jdvpbd mvtrgzv rkzx gkhbpd qdlpbt pnzpr (contains fish, dairy, eggs)
fljn jcks gxmptfk tpjmxd qdlpbt lxfth vkr hgb vfcxtx fgm tsnkknk pmvfzk ntqckl qpqbcqs gttkvg dxdfjd clq fkhp npqdm jxx bxtln lqphl cfgb pqhqk kqv blhjpn hdlqj klxdnlk tj nrkfql jdvpbd tlgrhdh nhp mrdr ncqsz bsfbj xjkfsv znfh dpn zzt nqhkv mxvpm kfmvn vjvk ggtxh dznq lplf hnrjrb vrcbg bnzk jkhmz vgrdpf vkzxc (contains eggs)
dklgl ppppc xmdk bxx zzt qmbklgz rfmds nflcpz mln ccxg krrfcv mvtrgzv xjkfsv nft gxmptfk kflk pmvfzk bsfbj hgb qqpfq vvpdgp kpsj lhfffc xgvxhsf mzcmnhl mfht crblbc lqphl dgrfj tgt vnczq kfdqkgm vkr cfgb vlfbd qpqbcqs vggmnpdz ggfcbj vvjm zhxvl dzvj pjshhf gmhrm ktrz qnsq xkmvksh dpn smnvks qpchg bdjlqq nrkfql kfmvn qdlpbt hbnnx ggtxh tj dprlv hzt hnrjrb pqhqk drkmkss lxfth ps nnvjn jdvpbd fgm tlgrhdh xbccds nljbcd tnxvt kxpjsfz nqhkv rxbfkh pgjsbf tpjmxd zrrdcb drcxd rxr vxq mkpd ckrrj kqv jxx gttkvg hdlqj lmx (contains nuts, dairy)
ktkqkk zgxj mzcmnhl pgjsbf crblbc bzgcx dprlv mvqrd dklgl pmvfzk nflcpz xmdk kxpjsfz gcchzx mqqf pnfhkd dqj qdlpbt tksdnjlg rxr ktrz jdvpbd mgbc hmzmpb pjshhf rxbfkh klxdnlk ktrk rrqv smnvks hqgqs lplf gdfht rfmds qmbklgz lhfffc bxtln jxx snph vkzxc mxvpm qpchg mgxqh vjvk lqsxnmm vsvbjx jkhmz vxq dgrfj bdjlqq tnxvt gprzt gzhj mfht xjkfsv zzt tlgrhdh rkzx mrdr ngk hhflg kfmvn npqdm znjztb hbnnx fkhp sqpgzf kjkhnh ssqf bnzk ghhgl cstj nft fljn gcs mvtrgzv clq nrkfql nnvjn kqv hmtznj xvvm lcdcd gkhbpd sjzpvnr (contains fish, dairy, peanuts)
tj tsnkknk ktkqkk vkzxc ghhgl kjkhnh vjggt sgltzg ppppc dklgl jlgf zzt jmk kxpjsfz dxdfjd qnsq vnczq tgt rrqv qdlpbt ntqckl pmvfzk nqrj mgxqh zrrdcb kqv mxvpm rfmds srbsb dprlv jxx lplf xkmvksh krrfcv znsgzjm clq (contains nuts)
nljbcd dxxppcp dprlv mvtrgzv dgrfj drcxd ppppc lplf cskrz jxx dzvj znjztb bdjlqq vkzxc lcdcd tsnkknk sqpgzf rrqv jrl tgt npqdm nnvjn dklgl vxq cjl rcm dxdfjd zsmvjh gzhj hnrjrb pnzpr mxvpm vlfbd hgb xjkfsv qdlpbt mfht ktrk rfmds pmvfzk mvqrd gkhbpd zzt zgxj kqv tfxz mkpd vsvbjx vvjm xsckzs (contains dairy)
"""
}
