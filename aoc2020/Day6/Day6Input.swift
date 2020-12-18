//
//  Day6Input.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

public let day6SampleInput = """
abc

a
b
c

ab
ac

a
a
a
a

b
"""

public let day6Input = """
mz
mz
mzch

fzmwqgcjylr
goqewcrzfjm
caqgpmrwz

hupvfabkzntecq
diuvsxqtpbfjckmz

ovc
jcuvo
ocv

zpikjxaynebqltfg
xgcqajrb
xbhqujgamv
gbcrqdhjawx
qagmovxjb

vfxuaj
ryhsdotgzaekp

sva
lv
p
lv
ekuy

xyhnip
kxiyp
ixyp
txbisypfzr

xklhemvrcaudqs
ztbj
wobj
ngi

rldtoyewcbk
cjlrfbikmyw

rkvfule
asgwbtiypcx
f
mloj

z
v
z
z
z

crqksbxng
qsbcxzgkn

axefrumdwtzsvqbnjpih
svnphxqdzucrmfibtwe

tvpcsrgbfu
ptvbscufg
bfgpctsvu
jsfugcpvtbyeq

cmdkrgezqbup
kqumercgzd
qtzgkjcrmued

gf
f

pizyco
zuvdxqcornepw
zoyplc
oczyp
jtzcoiyp

lq
lq
lq
oql

bksxqpdnvoctywjmrlezif
nzobdvywjcmrsiqtlpkfex
ezfmkwlgnvqjsotibcxrpyd

zwyvtxondeblf
mxqjuolebcgifhwz
bstorxweyfldzv

naurgqhwsjie
hgeaqjrwnt
agrnqhwlej
eabqhgjrnw
qrjamegwhnp

p
ep
p

phrvq
prhlqv
pqrvh
vpqgrh

xnqofa
xnoafq
nafoxq
xnqofaj

vcuibfm
icdfuvm
ivmudcf

xgfcdyqhmzetbvp
qbwfmhgatzxysvncpldejr
vcythpqbeumfdgxzi

gkeanqohi
ofagqiekhn
neioghqak
vgeoqinakh

ehvjdabzoluniywmprqskfxt
biwvhzgaftysnrjqpkolduxe

mwdet
e
eg
nez
evjp

cnlyzw
qcfklwnm
gjunvbxeacohr
nictp
fcns

xjdkyvsg
djkpxuygs

zgyovlcmqkiejwbn
wecmknzvbglyji

jrfcu
mcnlifrwy
ufrxcq
uftcrja

ndryz
dnbyzpr
yzrnd
znryd

boigahmft
iubmwtvqx

boidcxahqvwzsuytnfmgrejlkp
nuzrsagxtwpjqdcyfekmoilhvb
henvortgaqpufsikxyjcwlbmdz
dyerfaojtnguxzbhvlsikwmcqp
cmtlqghxodpbyafrijenvskwzu

td
xitod
mtyd
dtq
dtmnq

rdvebxmjtgl
dejrbglmit

gqrnekjhlat
pxosynvzumbcdf

dxw
woqu
w
w

ucydqmngvbipoxskzwrjelta
ovanpticdzjrbgufmsweq

xpksqf
qwxsk
kwqsx
qstkxz
xkaqes

jhge
he

qkzibmslehp
gjxcyvnf
gudcrt

stnqlzvxujgmci
jizgxulnmvqecst
qtlzmnsgixvcuj
juzctmsgvixlnq
uixqstmzjvolncg

rcuytdziwp
aydzuitrcw
cwdtyrui
bikwfztrudcy
clusdiwrtmyj

vinw
icrfwq
ibw
wzib

yca
aoyc
zcy

lrtchbe
ikreqgyvbh
rdfxmzhsnbeo
erghpikbw

jbfzo
tnpsxoiu
lebdwco
lqeamjrow

bcrd
lkqofmujitzxn
gsea
c
gvp

evijgtpazbrosdyfu
rotbdpijsfzyugahev
yjsftipavduzbgero
ifpgtzduoyabqvrjes
pyovcbdrtmjugfsezai

xu
ux
ux
uxa
xu

whnumzsbdjxvfklgp
mkezxfdwolsvqtgjun
lfyngxsumvkdjzw
nvxwjszgdlkfmub
skmfngvwplxjduz

njrxskbodqmyleu
ynxutlswbekzjorcqdm
koemuynlsdbrqijx

rsmtfkwp
nayjbukgcdoxzp
vkqhprewi

divsuxwnjhayflozcrkgembq
kjgorbnwityelauxvqmzhcpdfs

hrwsbtejpczayulgoqfm
ugqtoswycrzhafpbmlje
ryusqmwlgcajethpzfbo

s
pihnt

iyfvsbhqdltxg
ifwecadbghoyztnj

bviwpexnymh
lfdzjurgas

neacpxhlgiwvrytof
fpoxarvklecitngy
ycprnualtxekgiof
flceyxozrptiagnd

vqthogbnkfapjymsxudz
sotbeqjdfhzvxuknp
qudxgptzbhoyfnvks
vkfsrtxupnwqizbhld

y
y
y
e
y

vot
vw
skdv
vld

wxfkqj
fjkxpwq
skwehfqjmx
fakpxqjw

krmyuhfbqjicdo
yrecdasbkqlpfuihtm

kmwjvoz
kzj
jkz

hu
hu
uh
uh

xdotkgseayqcjv
atgjiqceozdsknxy
rxyghacbqomjdts

lhijk
ilhkzj
jaulcpkdhrvoe
wlhfyjsk
hkjnl

hzwipsumcygkand
kaungswdyzcpmhi
wyhiaupdgkmsncz
gapiysmchnkzduw
nyhwdkcmpsigzua

m
mwu
m
m

xymekvhjfoqanwu
jyefxonhwumkavq
ekamynojhqwxfvu
fvdwhumjexqnoayk

uso
ous
uos
ouhsn

ba
ba
ab

z
z
z
z
zm

x
ex
xs
hxil
sx

l
l
lt
l
l

wgkiablvjhos
hoajlgwksivb
kjblqvoawhsgi
giavbolhskjw

gramcuzevh
ejsmobhzy
zemih

w
h

wl
ycl
lcy

jxtuecnwavyg
utqygrejwnlxc

bydxajenfpwtluchg
ljtaybdhfnewxuci
auyidcnktljhfwzebmx
hatuwfjxbylednc

abdws
pxwsdb
ybrhwotsd
dcxgsbw

mcnujadbiz
jdznmucaib
zncijdmau
aiundczsmj

aofecx
xcaqfo
ojcafr

edifkl
ehgjwkli
ksepqlm
wbkle

cq
uj
k
e

aiwcx
agcixw

axykbruimzfwsenhcglpjdqo
qflhrpmownujiagxebzcdky

meyxdtjrwusilkb
iotakdjqrmewxysu
rjtdsykiwexhum
eyujdmotaxswkri

girbwahyvqno
qgkovyinraxbhw
qyvraobihwng

pmxefc
fme
tfrwmeha

fz
zfw
zf
lzd

d
d
d
d

uehgdsrj
jbzergthdsq
lrxdghjem
aqetghdrj

mhpke
pkaem

ijdspfvu
mowdfsvuit
skeuxyivdfn
odvjgtsufi
icvsdbufg

qtpbs
cyrag
xm

gptbaxizvchwjnkmufr
uzvxrbpgcajkwtfim
fajzbvrkpxtmuwgci
mzxqbvuwjtrpgakcif
bjcgixftvakzrupwmy

xdbinla
iyb
mbyi
esubyi
zrib

bpindyumqzg
obkaswqyvnexiltdg

vclqgxkaowurtyhip
usbfdyomh
senjyhuo

jghuexsqtzyvilk
qephbvglkyisuzjtx
yliupkqeghztvsjx
hjgyxkletizqusv
rzvyhetxqkjmiuosgl

pwr
rw

mxdbjlt
xrwjp
cqjxg

xzejwkg
pwgcxke

n
n
n
n
n

mohyfds
hirldzty
ydgrhz

zjnwrmqvf
wotaimsy

fjb
fib

k
k
mj

gmqpucbtzheayxjnisvwlf
auwfxmsjvephlzqygnbcti
ilzbwaxfsqunjmehpycgtv
bjqsngepuaxzlwfmctyvhi

kjtrspzvdaxq
vmaxdzpjqrktfs
zptrsvakdhqjx
vsctahyrqkijxzpd
dvzsjtkapxrq

pgdrsqj
mdcqkgrspj
depsgajqr

enaub
bnuae
eunkba
qbuean

aolmtpfdrujqhbngxeyvzkswic
ikybegrjmvzxplqcdhutafswo
hxbcizkajomlsdwpfteyqgvru
jqzcuohfawlvriyemkgxsdptb

jzhoyflbvwgax
zkawjhuloyxvgb
ozexgablyjcwhv

tzqdyshga
dgmhzjq

kshuoxnlvecdjfqt
hksdeyncviuqlmxbtoj
pnrvdskltjuwexhq

gdfcriwh
cdigfrohw
cahzfiwxrdg
chgrfiwda

ebtjygzhoivq
yqvhtbiegoz
gyqahibovwtze
oyigebqhvtz

t
t
t
r

vgrhsw
hnvsxg

hwlnmuyeckqi
pxajovtbgz

pmiweusdaxtkv
ikaxyvwmseudt
dtiauvxemwks
kiwdevxsmuat

sokdrqtghpuanycexifmzb
ztdewbaigkonsqyvumpr
mngkrzouxbdapeqsftihy
odiaqkubgtfrnzympes

znspbjwtymoghcdfluerq
qdspobimcxvtzhewya

wvryt
vjwtyaor
trwvy
vwrty

bpnd
nasdfm

nplfiwzjxht
xjnziptwh
pwtjhnxiz

dozimxujkn
djumoknxz
odmjxzbknu
doxumjzkn

rbfgqwj
fahqbjw
fnybmwq
qbzwf
ilwfpcvutqb

qgkbjltchfyavedu
dmawbygrltq
atipzbsdxgyqlmo

ckye
jeyi
uemy
xveby
ywuei

eskrx
emjrx

wljvungdr
bnuwdsexkmap

xupgbd
sdgp
gpcd

eota
aeot
aeto

ysfc
fysc
tfscruy

jgkhymseqrdtnba
ymkqbtgshjnrdae
tyebmnrhqksagdj
sbhtjgqdkemnrya
hdsqabmygnrtejk

f
kf
f

ytjcedxaz
apzkbof
avpsxug
niahrmlw

rfudz
fhazyk
ibxtwvsglj
qd

c
c
d
hn

cskuido
uskco
scoku
koucs

tvb
ycdv

qhirvcsbd
rihejdpm

iybrma
yrmbcu
byrme

zed
zkxw

qzfnvplshubydexi
pnlvhdyeixzsb
zlnvxihypdebs
ydzvphscijlxbwagrone
xilvbdphszyekn

gvtrahxldoikzwq
qrzwhkvtoidlxga
zkxqigwvrhtaudlo
torivqgdhzknxlawp
ldxkrqywtizgohav

ubndcrqswvelxtzoayhj
hyrwatzedscqjxlvoub
zxrdhuoasqylevcjwbt
eqlhxworuvjzyctdabs
wtcuvhdelozqabrysxj

elcpsu
cpsule
cpsleu

zlh
hzl
hzl

dxiga
girfkm
jeigrf
ysnulphgzivq

psat
oa

ue
ue
ucpe

ogjh
xjothga

koftzwcqubmnlrhjipyseag
eoafnwvygpmqtjirblhczs
pmwsiqyhtjanogecbzlfr
ifgaznswcqjumyrlbeptoh
gnewjrhspaqtulmcoyikfzb

ix
i
i
iea
i

ulqaygxi
fdqeyauxg
zjuagxqpy

h
h
h
xh
ho

vxaw
wav
wvai

mxtkdpoeyi
mxetpyikdo
otxmedyipk

wdcnobehuztmp
ukqmabxsozjcpv
wpurectobdlfgmiz

bgdqnwvozepkhriacuxyl
nzuqydvhwplrockaegxbi
bagkhpzxlouyqcdewrinv

qhcltbxvwafsjyzdrm
qxstfdzejcylabhr

fmxdshjvzt
wlcqmjbgsyozten

iefmpxscygwlan
gmnabscpxeywvi
idamrwxgycslpen

oy
dhoy
yo
oy

xuwvolghnsiamrecbpf
yfnlkjpwtrosxcqbmadu

zevtqpufwohjsym
sujpcgxvfteyizmwkhq
luwdshftvempyjqbz

xwalcisvjbg
wmxgcshavjd
cxsjwgavn
wjxgavsc

ugbazkrqhewcsnlyv
kgbzywncqvelasr
vngwszacqbykrel
gsbwayqzrckenvl

odyfsmr
hmlazrkfqid
dmraf
dnfxm
ecgpbtvdwujmf

mgfdipvqwylt
yvmfgwpidlz

bqmlkj
ugvjpkf
yxnokt

uq
uq
qu
uq
qu

wi
iw

wzldovhb
mxwoabdljh
wolhbsd

wl
ly

izlwhjont
tilohzvnjw
xhwjpitoblz
zhjwilot

hywqgtx
qhkpmtyxgb

ofcbmgz
mgzoc

twrhoiq
xnwtvqpucoh
wohtqr

kyubjpqwmxlefvdh
wmipajfxdleyshukq
kmhulexyqfpjdnw
yefdjlwpmhxkqtu
mkhwyxldupfeqj

ofwrlh
jtxpb

gluokvay
sam
ba
cnaz

uxfmyszp
msuyfxz
zuxymfs

bkszijdoqnmyecutgwaf
beomaiwdjnfqcskzygu

jnvfxyis
isnyjxaflvb
dsfyncxivj
xzvfsinyj
jvfsxnyiu

aucnsglqtwydip
qwuiatngsdlpcy
pqgidcnsyltuaw
epioacwqylsmduntg
ypuwcilnasdtgq

luscjpnra
gzhfvwlnpkj
ldpnj

gdulsqjpoaybtciwnxfrmke
kimlncroyebfjqwgdxpastu
rkpmqycojftluednibgaxsw
qnmikcgjbftduewsyoparlx
qdotrglyakwsjneicbfmuxp

n
n
n
n
n

xmwdne
mnw
mniwg

dmikwtap
pdiamwkt

xwrtgqjol
xtloqrwjg
iwpxtgqljyozr

szatehfijudvnmcwgl
xiqpkol

bof
vsgk
b
l
f

qyjkltr
uzjk
jk

byhzmsgqkiw
gzksiqhxwymb
yghzswimqkb

xwdayibf
lobrevphkjsqtm

zbq
qa
qgjcnoki
qb
q

cy
cy
yr
yp
ysmjxl

mpgvawkxqilefjhzd
wcgrptlbiyqn
orgpsywqilu

tqnhwfzrval
sqjhazftln
ibdqltngpahfz

tkb
kbt
tb
itv

rastml
mac
oaqmih
cmoa
caomqh

euwfnjhqzk
zequbkfswhn
ufnhrxwekzq
hknwzueqxf

oa
oaz
ao
oa
ao

savhkgfjimzxetqbw
agbqjkfhevxtmzw

evxrktf
pueltvmodwcjixzfs
vfrbxyetn
vfrtaxe

msgunwydrpjabkle
lujndkpragesybwm
mweglaujkdprynsb
wmjdngaksplyeurb
gnujemlwpakrbysd

cr
dc
dc

blqpgi
lipqbz
zbqlpi
pqbilv

xydkpmghbc
pgykdmcxburl
zcykpgmxdub
dcvabygjxkmp

jprbeoa
frnb
zgcvsdwuqk

vtxoj
xvtpjql
divrft

gupfytlizkdbqex
eigxmyfbsctqunr

tuqs
sqtu
tuqs
uqts
squtv

byhigkoufalws
ak
jatke
akt
qakvm

ywdflkx
kylxwdf
dlkwxfy
xylwkdf
dkfxywl

f
l

aftsgyjkxvnzwue
wzkeljtasxuyrg
jtkswzyeaxugb
egkxjazyturws

itz
djt
ctv
gnthe
jt

yshu
sh
slmhgj

z
ji

obgi
sk
lks
dhjwanv
rm

xpiucywoa
uyopaxwncf
yvlgmouxwcjb
xuywfco

wlinyhgvomaft
fvgslaxtynwqio
lapiotndgyvwfm

qeckphv
udr

u
u

jctghsovrbxuldmeq
svrtubcqmpoxkedj

tdgkfpsncb
hgzlickap
wtgkfbqcp

znstglqikxh
lhbtxigmkaqcz
iqdopufzerxwgltkj

hlp
pvh

bdcmqvigkl
bmqghkvnladi
qigdvlcbkm

buphave
vbuhpe

ojupf
fupjo
opfju
joufp
pjfou

tdlgefz
zdgfelt
xdzgftl

m
a
a
e
m

aetxgnmbwlqorhcv
vdetolsmuwxgrznf

wjmgzhstnklvpqfre
zkjvmgihpasqtfr

uvzpwsegyldkt
vwuzngtlkyepd
lbvweapjfcqyxktzg
lmzuwepvghtyk

aqxirdlg
kv
f
jkm
kmf

lntwbeguivhjrczomdysk
lzshbojydwcitevuknm
tfosedjzwuhvinlcmkby
ywtsqhbidjuzcvklemon

cbarozvgwudfy
vradygocbfuw
gyurwbvdacof
vcagouydwrfb

uqtiably
yaqbvluit
brxqfymulati
tdiscyqjbalu
buqaliyth

xhi
ixh

qyiklhnzxm
mrxykqnh

snhiex
qjhkdwixvg

ruahnkqvztblspj
rnkhvatuqlszbpj
zurblstvqpjnhak
auvqlgtzsrpjnbkh
hjknpvolqbzrutias

urihbgctwdlfpkexzvy
ktecgwvfyuphdzlrxb
dfuktzavxylwbpogerch
yxtvjcdrpmubshfznewgkl
lzbdcgfyohvukrwpext

oainb
aqlfwdkj
rboa

dvhuwiytqfxgocs
lqiuhadstfgcv

xvwuibrygcldtao
cvidylwaxgshr
enarwdcymjpifvzlx
cawrqxygivhld

gebqtnvmsrcwiyadhx
ciodjyxbhetsngvwmraf

qujrfpiywcsxetovn
jhpriwqetfxucsyon
uqwrzpsmgiocnljefxbdy
kqrneposjfaiwxuyc

jpbilafygw
fbhcgjwlkpeyiau
yjiwalfpgrb
ylwabpgifj
jwpibylafg

wtszqgebajnh
zbwjthgeqasn
sqzbtegjnwha
sgjhtnzqbewa
entwgshqbjaz

rtjzh
jzhvr
rjhzt

inegmbt
mitgben
eimgtnb

rzc
jmx

mgjcabfol
hiavxjypk

hdewoxam

lfkjgtrdqeyv
oimtuah
xztb

hcr
qed

mhesdwpfgabjqut
eupahqbgdsmftjzw
bjeqagdtphwfsmu
oagpdekhwbtjfimrsu
ygcxfdhewbumstjap

osq
oq
oqs
ofqe

yv
yv
vy
yv

ejarwcshd
shecdajrw
cjshaweondr
rsdhajcew

yghdti
ihtdgy
ityhgd

cvbgprtdenxmf
uwoci
qacoh
ocjs
chkzq

gvj
ixopnqr
w
kw

zgjdhpumekvwi
saxcntfgjwzyqpikd

ypa
yp
mzdubpcq

tn
wosvaye

qlcperntgzsfwku
dqtcfnpswxlbu
twsnulfchqp
fntmwslpucrqg

kuapxrhzscefjgnyb
xrkqbyejnp

nzwdcjqgbkuyompih
qlbioakexrypd

xzpuvdgbksoehtya
ptsoyudzbkaxgevh
xasvzgtpoheybudk

cfsu
sucf

mgnyxeosiflbjarck
tilsoanckhxygeq
koaglncxyisweu

mdxw
mwx
mwxkr

xhbmivwocpnfj
gonpwvcbqjuh
kprwyvsnobazedchj

h
h
h
h

ylihseo
ielos

uceik
nmdu

ieoupwmsczxn
cwnfaixuphrmozs
izswomcpxun

szibkplxgjecfu
fueklisgcznpx

ozlrwfbyvpha
haobxsevztf
ftzbaesdovniqh

awlj
wlaj
whjgazc
wlfaij
wjab

bdxcvsi
bhsutypqzaeji
goxnlmskib
xsicdwb
isfxbr

fgyekxoc
fkoygxec
fexokcyg
xfaykeogc
kfexogcy

wfzxvbnuomqyprijakth
ymbqfakjlpoxuvrwnzth
tzxuyrnpmbhjoqfkvwa
xbkuwjanqvfrpmhztyo

rj
rj
jrnfo

ktn
njk
nk
kn
kn

expjkivrsbtay
hjripyesaxtb
aytexdibjlprsu

uaexqwnogypcrltfj
glsbvjofretayiunkxd
gtazeownjmuhxqlfry

ktbxcwjnqzgfo
acufingqsw

hk
kha
hk
kh

ckeiaqhvo
avqokcid

ydsjhnoef
hdjoesnyf
edjshytofn

djntazq
wryjkcglx

fm
mab
zhkog
a

in
i
i
i
ia

usx
oxsu
buxs

wuvrcathfyqjkbgoield
kryebltidhunwv
eyzbudwtvhiklrx

komt
okmt
xobvuhmrkfe
tokm

knwzvmxdhga
kdniavoyxgm

ujfriox
rhjsmfuo
dfobuejvzr
jogsurfyq
sjoufr

rkbwpliavcg
xhtvqgcpwy

cdbfvigluhnqmexjkow
clvbitqhdpkygoxefjr
kodfbvhclegqyizjx

hajewmgkrufxos
ujoyahirmgswefx
rwcmohgsfexuyqaj
fhadmlogejprsubzxw

kafstecyuloihbdn
tqwzspanoklj

xmefigduhoykazjwsl
kslweodzjihfaxymu
sfmkdyaxozwijeulh

saxvbgpytiewmzdko
wkpimyxzbgoeats
wgoxhtbzayeksijrcq
tzyogakbxuswei

igyrvzsbhjlfmckptnx
hpuinvzfklbctymjrsgx
fcbxsipgnryztvklhmj

auznpvehdqbkwgsy
skavghewdbnlzu

knlhpeiayrjqoxmvgz
qalkjxzopgvrnhymie
rkxmqpovhleyzjaign

wkcj
zuexp
j

isvcz
czivs

zcponrsbfwyd
bfwdrpzoycsn
wcpyoznbfsdr
bnrfpzcysdow
rpzycswbdfon

ovrxfapbi
irbfvxpao
xibrapofv

dksnutobj
olysudtvbjcn

mu
mae
me
sm
ybm

bkdpatzy
yzikp
lyzipkx
jxpzcyk

uv
upzv
uv
uv
iuvh

emjlvyhcfxbwg
spodukaqzlitrn

ksdr
wuvs

uphbk
ukhbp
phubk
uphkb
buahpk

cbshmdpuavwrtenlzyo
brlcwapsoevmyhtudzn

csqumglrtnk
msltkgncqhrv
slmdqtcgrnk
mnqgcrslkt

piokdlbgrxems
xpdmklisorwebg
xlrkbpomdesig
exglsbiropdmk

b
g

ghclsovdmtxq
hmglcoxvsdtq
thdoxsgyqcmvl
ogrhdsxvqcltm

ounsldtx
lunbowyt

vfrkutowbmgdc
oijnkpgbtud

lhujrbktn
dijr
dpzqjra
dfszrcj

rdbn
zkjcmatoub
frbh

sjviweohd
idso
sodi
gumlodisy

lhrdskgfeycbtpi
lcihtfkysderbgp
tdrpfihekylsbgc
gpsklchbdftyrei

xlajt
gnjtxq

tqzbcshjlvgpoyximdweuk
vyjibzqheuwpckgdxsomt
yknthubopzgmwqadexsjifvc
yvkxumjsbdzhqowipgtec
hisuqgkcjdxtzmevwbpyo

uketflynzcw
yuckntewfzl
qtcelwkynzxfu
wectmkzfylnu
kewzuynlftc

vswzacr
wvsazrc

e
ed
e

hebto
wtmsib

lwutqp
qltupw
htqpwu
pwlrtuq
tqwzpu

hdjvamqcegzbspiukrt
gjhcbtkspumrdvazi

jnbadfseltgwqicyp
fjaplrsgnibycqedw
nckyblgamoqpjhvdwefsi
upysigwjecnqaldbf
sbjlgfpyedanqcziw

eqfocbxlrn
kafbngoxrl

qvsw
nik
hrw

snufiz
uzjsfni
nsiuzf
fyiznous

ckpibgjwafuh
ghiljrcxakp
khjpgaweic

msvnuqxypgofjih
omqxvfygijpsuhn
ymquspjvonxigfh
oiqvnypuhjgfsxm

nkemyfxgpijluhqsdabvtrwc
ksfbumgetnavpijhqwxcyzldr

c
sc
hcd
sc

tuxfnesdclrvwhqjb
ocbiahyvljsxtpfezr

fbskmvrij
vifscrbmznk

myzb
umz
zmwr

uh
uh
uh
hu
hu

goajwbie
fdrx
xzp
nvftuq

iuavjemkrhgtpzs
zjmikaovtehrscu
izhvtnkbsqwfdjamue

xwtdegkbmzfpohs
tmxsdhpkebw
pmxkseihbtadr
txgcepnzsbdkmwh

zfahslmie
asnhezilfm

ykctbsjxuprlmnevzo
yvuropfkshndxze

lqavxpoykrctuhdbmesfjznwg
hmarbvonjpgzwcxdqtkf
dwohqktamjivgbpcrzfnx
ptfqwhgzkjmoxrcdnabv

zfm
fm
fm

ilcqbzxkmphwody
wzbqomvhlcxpyd
bwyoeczldqxvhmp

judhxf
xjduhf
juxdhf

q
u
qf

jcawmzxvihftkrebngo
frgtbhomlzynwexai

aih
ifwqduk
ejhi
ipz
in

xofynradpmsezlkt
sbkplaoydqmfnzcetr

crqaz
vrecpaqt
rcayq
qayhrnc

fjzuibwdqgk
ldsxctyevmafjnwquir

zxve
xvbrelq
mxpgujytowk
xrh
exnh

m
p
m
yz

bporefigvm
skdapgxintqh

mzrk
jov
s

seg
dgm
dgm

oermkyc
ecmkqyr

mftuja
xatug

lvp
ev

uos
xvstu

ievoqg
eozig

mcjvxrazogyqdutbnskfhliewp
muptksjqehgblvfwidocnrzxay

biqpca
qiacpb
axiqpcgb
aibcqp
cziqbap

extusijradokfy
leropqdtgbwu

dyrhapgfuzibswlxt
tysfcbldhjiugrpxaw

vxpwancrbigsezdljf
rbgaewzhpvflucnsjd
beswjpvgadtcmfzlrn

mqhdsrki
nwobaxgyf
ckeujlv
kmip
hurzmdkq

aj
n
n

qxolihwd
ndopqzxi
gqfryxcodtie
qjovsbximd
idxsoq

owpxfnubqckaygihvels
khuogazqblysetnxv

lw
wl
lw
lw
lw

nbmictlsfpe
lbpjtsen
snrepulbaozq
hpldsebkn
pswebvxnlh

kaxnq
cgzdqulw
qtev
kqxat

mktvdgqrjfpauwcx
xvqmwbatfrpcgukj
xqjhuimftgavwpkrc

suhrkjm
drhjoepn

muarvhpcj
budyqsxio
ukegjn
wuca

pfqy
pqf
qpf
fcpq

km
idfo
n
i
s

dzrel
rldez
dzlre
rzled

xab
zib
vfob
bepyc
zjbln

qhuk
rvuh

ijoanqflgevpkhbdcmtry
cngpmhtrubiwsyafelk
mnaygtrkwfilchepb
efxylarhmntpcbgik

kabselvfz
jzelxsbf
zldcgeuqwyib
blatez

mskcylp
skucmpyl
lynkcpsm
myascplkf
ymplkcs

genqxfmpbscruwavtz
qscjwoflrvtgmey

gqx
qgx
qxg
gxq
xqg

orpvatekfxn
kfyhvbxjatponr

dltjwieqhbngzfru
dnruzxtpeakjcg
dueojhtnzgr

xodnalcfue
alnfeco
leaconf
clbafone
ncafleibo

vlg
lvg
lgv
flgv

l
l
l
l
l

qt
qjdt
apsgtq
dtbqy
jqyt

vh
hex

zumjtpa
uzjsm
mjsaczhu
gmikjewuzf

ji
q
k

detaocgxyvrufmqblphj
gahmorvjytlbxfpquedc
jxlhgyfeovrmqscdatpbu

rnkvuqidtco
tsfkzvirndoqu

diafzejbwokm
wqizdyotjfuemav
szfcjwndaiemo
jfzdecamwoi
ewdafzmjion

zdmspogfkrenxycvhlwiqu
urfosnixgqhkwjcdevmyapzl
ekhgmclisqyptvrufxnzdow
vysbilkqumcprdenhwxfgoz
rskdplyvcoiqehmzxgwftnu

ukqch
qgkbuhc
tquchkd
ckquh

db
o
d
rv
k

piaofhxmwnvtcgu
emxuwgapitnfvoc
pjutmxnvaofcgi
aixqcbmpozngfyutv

p
p
p
pe
pm

ibwkp
jfirb
bzvij

iokrxmlg
hmtkogirlx
ilqkxmgor
xgihomtrlk
fovpremiubnkxgl

uegzim
mnrxdsweltb

nrtehv
ntrvhe
hnrtev
tehrnv

scfzhav
vhszce
zlshtacv
chzbvixs
shuwvrzc

cnuzjowplfbxv
lubcfxvzjnwp
junwicfbxvlzp
fbujwlvxncpz
jlbfrpvngucwzex

gjys
vjgys
amlzgditx

anseyxckmvhfizwjglotb
onwbvsxftmljgyeihkazc

gabe
mbg
ujdvwgb
bg
gmb

roygu
uyvgor
ruyog

i
y

iynwubv
uivynw
yniwvu

kwctelmjza
wktelmazj
jezakltwm
mklwjfeazt
kteazmljw

tjprfkmnuscqleb
etbskqmulncjpfr
qmtucbrsnjkpfle
uenbclkpsmjqtfr

bijsc
sicjb

tmjqbgxyeos
tgysmkbo
matbvwhgyso

x
x
njw
x

wqpulj
hmcobyzkendg
atlxspvifqr

fndkgycm
kydfmrc
corkfdmy
kdyfcm

qw
i
asji

mbhqsncogdirywzf
egdrcyhowmibvnszf
ygfmosnbihrwdzc
wimrnhsfzeycodgb

rlqy
rl
rlm

e
y
r

livzeg
kilregzpn
ligzqeu
lizge

x
x
t
x
x

dptigbzqfjs
fzsudijgtrbpn
fwgzpisbdjt

npthoj
dremkjnozxbuf

m
ym
m
mz
mdt

wtphexvsjmgy
ctzselmpjg
jbptdisemcgla
jzteslpcmg

svdlony
undlsyo
yqoinltbs
olrymdns

lqfnrvmsbhpwuj
uxa
aku
iuoe
uycd

ygjrpoanvtzlxbu
rlyuadobvpzgt
sylrzpbtoavgdu

dnycvol
ekcy
ychpjw

pycdmtaqorxg
yzalgerstudqpc
hiqvrpdkwtnjyacg
sqcagtpdyr
cgsdfaqrbtyp

hpljymuotgarsxw
ygljahmpwunt
kbtlfayejqpzhwuvm
mtahywpculnj

noqzyaifsmvrhxkju
jhouamryznxfkqvis
moahzirsqfjuyvknx

knxuvyizohfbp
ynpvbzahfkouisx
unzblxgykihpfvo
kfhxoubpznyvi

xlfmqhkjiuosrvda
omsxifhujdqlkavp
umfkiwxdlvqahoj
juhaimqvflxrdok

rw
j
amgfyn
wj
bz

yijwmopraq
ioqmawrylpj
qioayjpwmr

dyvfzhmetqwrga
zfetnamhcrjw
lwrzkansftehm
mafhtrzlew

jolep
jo
jao

gwuqrp
rgqpuw
gpqurw
quwrpgo

hrfol
nkrfaleo

htrnmvfpqbckduwloyez
khytlsgrdopzeucfxbqn
dizcpufnthkeyolrqjb

zpyjmxrfdtwuhsblav
vtdjpxsylwbramuf
urwsdbxamylfptjv
uaysdwjrvmptxlbf
vpmsudtajlrwfxyb

axtiwvmg
rniv
iv
quevi

pmoyzhcbijtqagskvnulfewd
tpneiqdhmgbkaojucyzwfsv
zutihfdvogwbjseayncqmkp

lsirvdth
jdypag

tjqef
bxiytelq
entmquof
dqtevr

dwmxfunpzc
pmxfzdcwu
dwpcfuzmx
dfcmwzxpu
wxzdmufcp

hmygqnbwisvakefc
cesgpbfkavmqrny
uaodqcjnsvgyemfkxb
yvchkebnagqmfs
fsqemgytklcbavn

asiuw
wiu
iuw

fbuwvehgm
fwvmgbcuhe
hzxmubewf

zwkfytmcaijbelr
xur
rhgu
hr
pru
"""
